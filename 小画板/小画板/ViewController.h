//
//  ViewController.h
//  小画板
//
//  Created by chenWei on 2017/2/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HMRootView.h"

@interface ViewController : UIViewController

//把画板视图作为控制器的属性
@property (weak, nonatomic) IBOutlet HMRootView *rootView;


@end

