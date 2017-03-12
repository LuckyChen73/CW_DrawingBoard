//
//  ViewController.m
//  小画板
//
//  Created by chenWei on 2017/2/11.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeSizeValue:(UISlider *)sender {
    
     //获取现在滑块界面的值
    self.rootView.lineWidth = sender.value;
    
}

- (IBAction)changeColor:(UIButton *)sender {
    
    //点击颜色按钮时，要做的事
    //把点击按钮的背景色传递给面板
    self.rootView.lineColor = sender.backgroundColor;
    
}


//点击了保存按钮
- (IBAction)saveBtn:(id)sender {
    
    //1.创建一个图片上下文
    //参数1：图片大小
    //参数2：是否不透明 YES为不透明，NO为透明
    //参数3：缩放因子，传入0，则会自动根据屏幕来得到缩放因子
    UIGraphicsBeginImageContextWithOptions(_rootView.bounds.size, YES, 0);
    
    //2.绘制东西到上下文
    //第一个参数：截多大范围
    //第二个参数：截屏后是否刷新
    [_rootView drawViewHierarchyInRect:_rootView.bounds afterScreenUpdates:YES];
    
    
    //3.从当前的图片上下文中获取一张图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    
    //4.要把图片输出到相册
    //参数1：保存那张图片
    //参数2和参数3：就是当保存完毕后调用哪个对象的哪个方法
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    //5.结束图片上下文
    UIGraphicsEndPDFContext();
    
}

//图片写入相册完毕会调用的回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error) {
        NSLog(@"%@",error);
    }else
    {
        NSLog(@"保存成功");
    }
    
}

//点击了清除按钮
- (IBAction)deleteBtn:(UIButton *)sender {
    
    //要清除面板 view 的路径数组
    [_rootView.pathList removeAllObjects];
    
    //重绘
    [_rootView setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
