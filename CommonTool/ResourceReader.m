//
//  ResourceReader.m
//  CommonTool
//
//  Created by 方正 on 2016/12/23.
//  Copyright © 2016年 fang. All rights reserved.
//

#import "ResourceReader.h"

UIImage *UIImageNamedFromBundle(NSString *imageName,NSString *bundleName)
{
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) return image;
    
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.bundle/%@",bundleName,imageName]];
}
UIStoryboard *UIStoryBoardNamedFromBundle(NSString *storyboardName,NSString *bundleName)
{
    return [UIStoryboard storyboardWithName:storyboardName bundle:UIBundleForNamed(bundleName)];
}

NSBundle *UIBundleForNamed(NSString * bundleName)
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    return bundle;
}
