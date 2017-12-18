//
//  NeedViewController.h
//  CustomCartridge
//
//  Created by 张杰 on 2017/12/18.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NeedViewController : UIViewController
@property (nonatomic, assign) NSInteger topAndBottomHight;
@property (nonatomic, assign) NSInteger leftAndRightWide;
@property (nonatomic, assign) BOOL isClose;

typedef void(^changelabel)(id);
typedef void(^changelabelID)(id);
@property (nonatomic, copy) changelabel labeltitle;
@property (nonatomic, copy) changelabelID labeltitleID;
- (void)settheroundedcorners;
@end
