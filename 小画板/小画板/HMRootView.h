//
//  HMRootView.h
//  小画板
//
//  Created by chenWei on 2017/2/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMBezierPath;
@interface HMRootView : UIView

@property (nonatomic, assign) CGFloat lineWidth;

//线条颜色
@property (nonatomic, strong) UIColor *lineColor;

//保存所有绘图路径的数组
@property (nonatomic, strong)NSMutableArray <HMBezierPath*> *pathList;




@end
