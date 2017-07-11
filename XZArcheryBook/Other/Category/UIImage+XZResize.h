// UIImage+XZResize.h
// Created by Trevor Harmon on 8/5/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support resizing/cropping
#import <UIKit/UIKit.h>


@interface UIImage (XZResize)

/**
 裁剪图片
 
 @param bounds 区域
 */
- (UIImage *)croppedImage:(CGRect)bounds;


//- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
//          transparentBorder:(NSUInteger)borderSize
//               cornerRadius:(NSUInteger)cornerRadius
//       interpolationQuality:(CGInterpolationQuality)quality;
//- (UIImage *)resizedImage:(CGSize)newSize
//     interpolationQuality:(CGInterpolationQuality)quality;
//- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
//                                  bounds:(CGSize)bounds
//                    interpolationQuality:(CGInterpolationQuality)quality;

/**
 将图片裁剪成头像
 */
- (UIImage *)getScaleAvatarImage;
/**
 将图片裁剪获得一般缩略图
 */
- (UIImage *)getDefaultScaleToThumbnailImage;

/**
 获得新图片根据目标size,可能会拉伸
 */
- (UIImage *)imageResizeToSize:(CGSize)size;
/**
 根据contentMode获取新图片
 */
- (UIImage *)imageResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

/**
 获得裁剪后的图片
 @param rect 裁剪范围
 */
- (UIImage *)imageCropToRect:(CGRect)rect;
@end
  
