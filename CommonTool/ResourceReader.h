//
//  ResourceReader.h
//  CommonTool
//
//  Created by 方正 on 2016/12/23.
//  Copyright © 2016年 fang. All rights reserved.
//

#define FZ @"666"
#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
UIImage *UIImageNamedFromBundle(NSString *imageName,NSString *bundleName);
UIStoryboard *UIStoryBoardNamedFromBundle(NSString *storyboardName,NSString *bundleName);
NSBundle *UIBundleForNamed(NSString * bundleName);



