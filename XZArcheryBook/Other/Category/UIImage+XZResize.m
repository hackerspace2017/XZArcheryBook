// UIImage+XZResize.m
// Created by Trevor Harmon on 8/5/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

#import "UIImage+XZResize.h"
//#import "UIImage+RoundedCorner.h"
//#import "UIImage+Alpha.h"



CGRect XZCGRectFitWithContentMode(CGRect rect, CGSize size, UIViewContentMode mode) {
    rect = CGRectStandardize(rect);
    size.width = size.width < 0 ? -size.width : size.width;
    size.height = size.height < 0 ? -size.height : size.height;
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    switch (mode) {
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill: {
            if (rect.size.width < 0.01 || rect.size.height < 0.01 ||
                size.width < 0.01 || size.height < 0.01) {
                rect.origin = center;
                rect.size = CGSizeZero;
            } else {
                CGFloat scale;
                if (mode == UIViewContentModeScaleAspectFit) {
                    if (size.width / size.height < rect.size.width / rect.size.height) {
                        scale = rect.size.height / size.height;
                    } else {
                        scale = rect.size.width / size.width;
                    }
                } else {
                    if (size.width / size.height < rect.size.width / rect.size.height) {
                        scale = rect.size.width / size.width;
                    } else {
                        scale = rect.size.height / size.height;
                    }
                }
                size.width *= scale;
                size.height *= scale;
                rect.size = size;
                rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
            }
        } break;
        case UIViewContentModeCenter: {
            rect.size = size;
            rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
        } break;
        case UIViewContentModeTop: {
            rect.origin.x = center.x - size.width * 0.5;
            rect.size = size;
        } break;
        case UIViewContentModeBottom: {
            rect.origin.x = center.x - size.width * 0.5;
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        } break;
        case UIViewContentModeLeft: {
            rect.origin.y = center.y - size.height * 0.5;
            rect.size = size;
        } break;
        case UIViewContentModeRight: {
            rect.origin.y = center.y - size.height * 0.5;
            rect.origin.x += rect.size.width - size.width;
            rect.size = size;
        } break;
        case UIViewContentModeTopLeft: {
            rect.size = size;
        } break;
        case UIViewContentModeTopRight: {
            rect.origin.x += rect.size.width - size.width;
            rect.size = size;
        } break;
        case UIViewContentModeBottomLeft: {
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        } break;
        case UIViewContentModeBottomRight: {
            rect.origin.x += rect.size.width - size.width;
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        } break;
        case UIViewContentModeScaleToFill:
        case UIViewContentModeRedraw:
        default: {
            rect = rect;
        }
    }
    return rect;
}


// Private helper methods
//@interface UIImage ()
//- (UIImage *)resizedImage:(CGSize)newSize
//                transform:(CGAffineTransform)transform
//           drawTransposed:(BOOL)transpose
//     interpolationQuality:(CGInterpolationQuality)quality;
//- (CGAffineTransform)transformForOrientation:(CGSize)newSize;
//@end

@implementation UIImage (XZResize)

// Returns a copy of this image that is cropped to the given bounds.
// The bounds will be adjusted using CGRectIntegral.
// This method ignores the image's imageOrientation setting.
- (UIImage *)croppedImage:(CGRect)bounds {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], bounds);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}


//
//// Returns a copy of this image that is squared to the thumbnail size.
//// If transparentBorder is non-zero, a transparent border of the given size will be added around the edges of the thumbnail. (Adding a transparent border of at least one pixel in size has the side-effect of antialiasing the edges of the image when rotating it using Core Animation.)
//- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
//          transparentBorder:(NSUInteger)borderSize
//               cornerRadius:(NSUInteger)cornerRadius
//       interpolationQuality:(CGInterpolationQuality)quality {
//    UIImage *resizedImage = [self resizedImageWithContentMode:UIViewContentModeScaleAspectFill
//                                                       bounds:CGSizeMake(thumbnailSize, thumbnailSize)
//                                         interpolationQuality:quality];
//    
//    // Crop out any part of the image that's larger than the thumbnail size
//    // The cropped rect must be centered on the resized image
//    // Round the origin points so that the size isn't altered when CGRectIntegral is later invoked
//    CGRect cropRect = CGRectMake(round((resizedImage.size.width - thumbnailSize) / 2),
//                                 round((resizedImage.size.height - thumbnailSize) / 2),
//                                 thumbnailSize,
//                                 thumbnailSize);
//    UIImage *croppedImage = [resizedImage croppedImage:cropRect];
//    
//    UIImage *transparentBorderImage = borderSize ? [croppedImage transparentBorderImage:borderSize] : croppedImage;
//
//    return [transparentBorderImage roundedCornerImage:cornerRadius borderSize:borderSize];
//}
//
//// Returns a rescaled copy of the image, taking into account its orientation
//// The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
//- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality {
//    BOOL drawTransposed;
//    
//    switch (self.imageOrientation) {
//        case UIImageOrientationLeft:
//        case UIImageOrientationLeftMirrored:
//        case UIImageOrientationRight:
//        case UIImageOrientationRightMirrored:
//            drawTransposed = YES;
//            break;
//            
//        default:
//            drawTransposed = NO;
//    }
//    
//    return [self resizedImage:newSize
//                    transform:[self transformForOrientation:newSize]
//               drawTransposed:drawTransposed
//         interpolationQuality:quality];
//}
//
//// Resizes the image according to the given content mode, taking into account the image's orientation
////- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
////                                  bounds:(CGSize)bounds
////                    interpolationQuality:(CGInterpolationQuality)quality {
////    CGFloat horizontalRatio = bounds.width / self.size.width;
////    CGFloat verticalRatio = bounds.height / self.size.height;
////    CGFloat ratio;
////    
////    switch (contentMode) {
////        case UIViewContentModeScaleAspectFill:
////            ratio = MAX(horizontalRatio, verticalRatio);
////            break;
////            
////        case UIViewContentModeScaleAspectFit:
////            ratio = MIN(horizontalRatio, verticalRatio);
////            break;
////            
////        default:
////            [NSException raise:NSInvalidArgumentException format:@"Unsupported content mode: %zd", contentMode];
////    }
////    
////    CGSize newSize = CGSizeMake(self.size.width * ratio, self.size.height * ratio);
////    
////    return [self resizedImage:newSize interpolationQuality:quality];
////}
//
//#pragma mark -
//#pragma mark Private helper methods
//
//// Returns a copy of the image that has been transformed using the given affine transform and scaled to the new size
//// The new image's orientation will be UIImageOrientationUp, regardless of the current image's orientation
//// If the new size is not integral, it will be rounded up
//- (UIImage *)resizedImage:(CGSize)newSize
//                transform:(CGAffineTransform)transform
//           drawTransposed:(BOOL)transpose
//     interpolationQuality:(CGInterpolationQuality)quality {
//    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
//    CGRect transposedRect = CGRectMake(0, 0, newRect.size.height, newRect.size.width);
//    CGImageRef imageRef = self.CGImage;
//    
//    // Build a context that's the same dimensions as the new size
//    CGContextRef bitmap = CGBitmapContextCreate(NULL,
//                                                newRect.size.width,
//                                                newRect.size.height,
//                                                CGImageGetBitsPerComponent(imageRef),
//                                                0,
//                                                CGImageGetColorSpace(imageRef),
//                                                CGImageGetBitmapInfo(imageRef));
//    
//    // Rotate and/or flip the image if required by its orientation
//    CGContextConcatCTM(bitmap, transform);
//    
//    // Set the quality level to use when rescaling
//    CGContextSetInterpolationQuality(bitmap, quality);
//    
//    // Draw into the context; this scales the image
//    CGContextDrawImage(bitmap, transpose ? transposedRect : newRect, imageRef);
//    
//    // Get the resized image from the context and a UIImage
//    CGImageRef newImageRef = CGBitmapContextCreateImage(bitmap);
//    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
//    
//    // Clean up
//    CGContextRelease(bitmap);
//    CGImageRelease(newImageRef);
//    
//    return newImage;
//}
//
//// Returns an affine transform that takes into account the image orientation when drawing a scaled image
//- (CGAffineTransform)transformForOrientation:(CGSize)newSize {
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    
//    // 下面这两个警告是因为imageOrientation的type类型没有写全
//    switch (self.imageOrientation) {
//        case UIImageOrientationDown:           // EXIF = 3
//        case UIImageOrientationDownMirrored:   // EXIF = 4
//            transform = CGAffineTransformTranslate(transform, newSize.width, newSize.height);
//            transform = CGAffineTransformRotate(transform, M_PI);
//            break;
//            
//        case UIImageOrientationLeft:           // EXIF = 6
//        case UIImageOrientationLeftMirrored:   // EXIF = 5
//            transform = CGAffineTransformTranslate(transform, newSize.width, 0);
//            transform = CGAffineTransformRotate(transform, M_PI_2);
//            break;
//            
//        case UIImageOrientationRight:          // EXIF = 8
//        case UIImageOrientationRightMirrored:  // EXIF = 7
//            transform = CGAffineTransformTranslate(transform, 0, newSize.height);
//            transform = CGAffineTransformRotate(transform, -M_PI_2);
//            break;
//        default:
//            break;
//    }
//    
//    switch (self.imageOrientation) {
//        case UIImageOrientationUpMirrored:     // EXIF = 2
//        case UIImageOrientationDownMirrored:   // EXIF = 4
//            transform = CGAffineTransformTranslate(transform, newSize.width, 0);
//            transform = CGAffineTransformScale(transform, -1, 1);
//            break;
//            
//        case UIImageOrientationLeftMirrored:   // EXIF = 5
//        case UIImageOrientationRightMirrored:  // EXIF = 7
//            transform = CGAffineTransformTranslate(transform, newSize.height, 0);
//            transform = CGAffineTransformScale(transform, -1, 1);
//            break;
//        default:
//            break;
//    }
//    
//    return transform;
//}



/**
 将图片裁剪成头像
 */
- (UIImage *)getScaleAvatarImage
{
    
   UIImage *newImage =  [self imageResizeToSize:CGSizeMake(60, 60) contentMode:UIViewContentModeScaleAspectFill];
    
    return newImage;
    
}

/**
 将图片裁剪获得一般缩略图
 */
- (UIImage *)getDefaultScaleToThumbnailImage
{
    
    CGFloat defaultWidth = [UIScreen mainScreen].bounds.size.width - 50;

    if (self.size.width < defaultWidth && self.size.height < defaultWidth) {
        
        return self;
    }
    
    UIImage *newImage =  nil;

    if (self.size.width > defaultWidth || self.size.height > defaultWidth) {
        
        newImage = [self imageResizeToSize:CGSizeMake(defaultWidth, defaultWidth) contentMode:UIViewContentModeScaleAspectFill];
    }else{
        newImage = self;
    }
    
    
    return newImage;
    
}

/**
 获得新图片根据目标size,可能会拉伸
 */
- (UIImage *)imageResizeToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
根据contentMode获取新图片
 */
- (UIImage *)imageResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height) withContentMode:contentMode clipsToBounds:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/**
 获得裁剪后的图片
 @param rect 裁剪范围
 */
- (UIImage *)imageCropToRect:(CGRect)rect {
    rect.origin.x *= self.scale;
    rect.origin.y *= self.scale;
    rect.size.width *= self.scale;
    rect.size.height *= self.scale;
    if (rect.size.width <= 0 || rect.size.height <= 0) return nil;
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return image;
}

#pragma mark - 工具

- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips{
    CGRect drawRect = XZCGRectFitWithContentMode(rect, self.size, contentMode);
    if (drawRect.size.width == 0 || drawRect.size.height == 0) return;
    if (clips) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        if (context) {
            CGContextSaveGState(context);
            CGContextAddRect(context, rect);
            CGContextClip(context);
            [self drawInRect:drawRect];
            CGContextRestoreGState(context);
        }
    } else {
        [self drawInRect:drawRect];
    }
}
@end

