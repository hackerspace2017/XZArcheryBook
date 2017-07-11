//
//  UIImage+XZUtils.m
//  ImageBubble
//
//  Created by Richard Kirby on 3/14/13.
//  Copyright (c) 2013 Kirby. All rights reserved.
//

#import "UIImage+XZUtils.h"
#import "UIImage+XZResize.h"

@implementation UIImage (XZUtils)

/**
 *  进行图片缩放
 *
 * Render a UIImage at the specified size. This is needed to render out the resizable image mask before sending it to maskImage:withMask:
 *
 *  @param size 需要缩放的尺寸
 *
 *  @return 返回的图片
 */
- (UIImage *)renderAtSize:(const CGSize)size
{
    UIGraphicsBeginImageContext(size);
    const CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    const CGImageRef cgImage = CGBitmapContextCreateImage(context);
    UIImage *renderedImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    UIGraphicsEndImageContext();
    
    return renderedImage;
}

/**
 *  进行图片掩码
 *
 *  @param maskImage 需要掩码的图片
 *
 *  @return 掩码图片
 */
- (UIImage *)maskWithImage:(const UIImage *)maskImage
{
    const CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    const CGImageRef maskImageRef = maskImage.CGImage;
    
    const CGContextRef mainViewContentContext = CGBitmapContextCreate (NULL, maskImage.size.width, maskImage.size.height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    
    if (! mainViewContentContext)
    {
        return nil;
    }
    
    CGFloat ratio = maskImage.size.width / self.size.width;
    
    if (ratio * self.size.height < maskImage.size.height)
    {
        ratio = maskImage.size.height / self.size.height;
    }
    
    const CGRect maskRect  = CGRectMake(0, 0, maskImage.size.width, maskImage.size.height);
    
    const CGRect imageRect  = CGRectMake(-((self.size.width * ratio) - maskImage.size.width) / 2,
                                         -((self.size.height * ratio) - maskImage.size.height) / 2,
                                         self.size.width * ratio,
                                         self.size.height * ratio);
    
    CGContextClipToMask(mainViewContentContext, maskRect, maskImageRef);
    CGContextDrawImage(mainViewContentContext, imageRect, self.CGImage);
    
    CGImageRef newImage = CGBitmapContextCreateImage(mainViewContentContext);
    CGContextRelease(mainViewContentContext);
    
    UIImage *theImage = [UIImage imageWithCGImage:newImage];
    
    CGImageRelease(newImage);
    
    return theImage;
    
}

/*
 maskWithColor
 takes a (grayscale) image and 'tints' it with the supplied color.
 */
- (UIImage *)maskWithColor:(UIColor *)color
{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    CGRect bounds = CGRectMake(0,0,width,height);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL, width, height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    CGContextClipToMask(bitmapContext, bounds, self.CGImage);
    CGContextSetFillColorWithColor(bitmapContext, color.CGColor);
    CGContextFillRect(bitmapContext, bounds);
    
    CGImageRef cImage = CGBitmapContextCreateImage(bitmapContext);
    UIImage *coloredImage = [UIImage imageWithCGImage:cImage];
    
    CGContextRelease(bitmapContext);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(cImage);
    
    return coloredImage;
    
}

/**
 根据颜色生成纯色的图片
 
 @param color 颜色
 @param size 大小
 @return 生成的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
    
- (void)writeToFileByPath:(NSString *)filePath
{
    [self writeToFileByPath:filePath compressQuality:1.0];

}

/**
 转换为NSData后,写入路径,默认压缩0.8
 
 @param filePath 路径
 */
- (void)writeToFileDefaultCompressByPath:(NSString *)filePath
{
    [self writeToFileByPath:filePath compressQuality:0.8];
}


/**
 转换为NSData后,写入路径,压缩quality
 
 @param filePath 路径
 */
- (void)writeToFileByPath:(NSString *)filePath compressQuality:(float)quality
{
    if (filePath.length == 0) {
        @throw [NSException exceptionWithName:@"error" reason:@"图片写入路径为空" userInfo:nil];
        
        return;
    }
    // 转换JPEG图片进行质量的压缩
    NSData * imageData = [self convertToDataCompressQuality:quality];
    
    [imageData writeToFile:filePath atomically:YES];
}


/**
 转换为NSData后,写入路径,<= 1M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo1MByPath:(NSString *)filePath
{
    NSData *data = [self compressToMaxDataSizeKBytes:1000];
    
    [data writeToFile:filePath atomically:YES];
}

/**
 转换为NSData后,写入路径,<= 4M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo4MByPath:(NSString *)filePath
{
    NSData *data = [self compressToMaxDataSizeKBytes:4000];
    
    [data writeToFile:filePath atomically:YES];
}

/**
 转换为NSData
 */
- (NSData *)convertToData
{
    // 转换JPEG图片进行质量的压缩
    NSData * imageData = [self convertToDataCompressQuality:1.0];
    
    return imageData;
}


/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
- (NSData *)compressToMaxDataSizeKBytes:(CGFloat)size{

    NSData * data = [self convertToData];
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality -= 0.01f;
        data = UIImageJPEGRepresentation(self, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}



/**
 转换为NSData
 */
- (NSData *)convertToDataCompressQuality:(float)quality
{
    // 转换JPEG图片进行质量的压缩
    NSData * imageData = UIImageJPEGRepresentation(self, quality);
    
    return imageData;
}



@end
