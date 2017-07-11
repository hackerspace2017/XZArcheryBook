//
//  UIImage+XZUtils.h
//  ImageBubble
//
//  Created by Richard Kirby on 3/14/13.
//  Copyright (c) 2013 Kirby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZUtils)

/**
 *  进行图片缩放
 *
 *  @param size 需要缩放的尺寸
 *
 *  @return 返回的图片
 */
- (UIImage *)renderAtSize:(const CGSize) size;

/**
 *  进行图片掩码
 *
 *  @param maskImage 需要掩码的图片
 *
 *  @return 掩码图片
 */
- (UIImage *)maskWithImage:(const UIImage *) maskImage;
- (UIImage *)maskWithColor:(UIColor *) color;


/**
 根据颜色生成纯色的图片

 @param color 颜色
 @param size 大小
 @return 生成的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
    
/**
 转换为NSData后,写入路径

 @param filePath 路径
 */
- (void)writeToFileByPath:(NSString *)filePath;

/**
 转换为NSData后,写入路径,默认压缩0.8
 
 @param filePath 路径
 */
- (void)writeToFileDefaultCompressByPath:(NSString *)filePath ;
/**
 转换为NSData后,写入路径,压缩quality
 
 @param filePath 路径
 */
- (void)writeToFileByPath:(NSString *)filePath compressQuality:(float)quality;

/**
 转换为NSData后,写入路径,<= 1M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo1MByPath:(NSString *)filePath;

/**
 转换为NSData后,写入路径,<= 4M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo4MByPath:(NSString *)filePath;
/**
 转换为NSData
 */
- (NSData *)convertToData;

/**
 *  压缩图片到指定文件大小
 *  @param image 目标图片
 *  @param size  目标大小（最大值）kb
 *  @return 返回的图片文件
 */
- (NSData *)compressToMaxDataSizeKBytes:(CGFloat)size;
/**
 转换为NSData
 */
- (NSData *)convertToDataCompressQuality:(float)quality;
    
@end
