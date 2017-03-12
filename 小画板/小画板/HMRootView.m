//
//  HMRootView.m
//  小画板
//
//  Created by chenWei on 2017/2/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "HMRootView.h"
#import "HMBezierPath.h"

@implementation HMRootView{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _pathList = [NSMutableArray array];
    
    //解决程序启动时，不能划线的 BUG
    _lineWidth = 1;
    
    
}

- (void)drawRect:(CGRect)rect {

    //把数组中保存的所有路径都绘制出来
    for (HMBezierPath *path in _pathList) {
        
        [path.lineColor set];
        
        [path stroke];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.拿到触摸对象
    UITouch *t = touches.anyObject;
    
    //2.拿到按下点的那个位置
    CGPoint loc = [t locationInView:self];
    
    //获取上下文对象
    //创建路径对象
    HMBezierPath *path = [HMBezierPath bezierPath];
    
    
    //把刚刚收到的这个线条大小赋值给绘图路径
    path.lineWidth = self.lineWidth;
    
    //我们希望每个路径对象能保存自己的颜色，系统提供的没法满足，因为没有这个属性
    //所以我们要自己写一个类继承UIBezierPath，给它加属性
    path.lineColor = self.lineColor;
    
    //把路径添加到数组
    [_pathList addObject:path];
    
    //添加起点位置,把按下点作为第一个点
    [path moveToPoint: loc];
    
    
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //每移动一点，就画一点
    
    //拿到触发的那个点
    UITouch *t = touches.anyObject;
    
    //拿到按下的点的位置
    CGPoint loc = [t locationInView:self];
    
    //每次move应该拿最近那次添加的路径对象，最近添加的肯定就是lastObject
    HMBezierPath *path = _pathList.lastObject;
    
    //把当前移动的点添加到绘图路径对象中
    [path addLineToPoint:loc];
    
    //重绘
    [self setNeedsDisplay];
    
}



@end
