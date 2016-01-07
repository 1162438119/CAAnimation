//
//  ViewController.m
//  CAAnimation
//
//  Created by mac on 16/1/7.
//  Copyright © 2016年 dqy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) UIView * aview;

@property (nonatomic, strong) UIView * bview;

@property (nonatomic, strong) NSTimer * timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(10, 80, self.view.frame.size.width - 20,self.view.frame.size.height - 100)];
    self.aview.backgroundColor =  [UIColor redColor];
    [self.view addSubview:self.aview];
    
    
    self.bview = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 40, 40)];
    self.bview.backgroundColor = [UIColor greenColor];
    
    
    
    //basic animation
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(10, 20, 40, 30);
    [btn1 setTitle:@"basic" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 1;
    [self.view addSubview:btn1];
    
    
    //key frame animation
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(55, 20, 40, 30);
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"keyFrame" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    btn2.tag = 2;
    
    
    //transition
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, 20, 40, 30);
    [btn3 setTitle:@"transition" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    btn3.tag = 3;
    
    //group animation
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(145, 20, 40, 30);
    [btn4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn4 setTitle:@"group" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    btn4.tag = 4;
    
    //puase
    UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame =  CGRectMake(190, 20, 20, 30);
    btn5.backgroundColor = [UIColor blueColor];
    [btn5 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    btn5.tag = 5;
    
    //resume
    UIButton * btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(240, 20, 20, 30);
    btn6.backgroundColor = [UIColor blueColor];
    [btn6 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn6.tag = 6;
    [self.view addSubview:btn6];
    

    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -------------------------- start animation
- (void)btnAction: (UIButton *) sender {
    
    if (sender.tag == 1) {
        //basic
        
        
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(haha) userInfo:nil repeats:YES];
        
        
        
        
    }
    else if (sender.tag == 2) {
        //key
        
        [self.aview removeFromSuperview];
        [self.view addSubview:self.bview];
        
        //UIBezierPath
        UIBezierPath * bezeirPath = [UIBezierPath bezierPath];
        
        [bezeirPath moveToPoint:CGPointMake(30, 100)];
        [bezeirPath addLineToPoint:CGPointMake(300, 100)];
        [bezeirPath addLineToPoint:CGPointMake(300, 400)];
        
        
        CAKeyframeAnimation * keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        /*
         choose (values keytimes) or path
         */
        keyFrame.path = bezeirPath.CGPath;
        
        keyFrame.duration = 4;
        
        //keep current state
        keyFrame.fillMode = kCAFillModeForwards;
        keyFrame.removedOnCompletion = NO;
        
        [self.bview.layer addAnimation:keyFrame forKey:nil];
        
        
        
        
        
        
        
    }
    else if (sender.tag == 3) {
        //transition
        
        CATransition * transition = [CATransition animation];
        /*
         kind of type:
         1.fade 交叉淡化过渡 2.push 3.moveIn 新视图移到旧视图上面
         4.reveal 显示下面的新视图 5.cube 立体 6.oglFlip
         7.suckEffect 收缩效果 8.rippleEffect 水滴
         9.pageCurl 向上翻页 10.pageUnCurl
         11.cameraIrisHollowOpen cameraIrisHollowClos 相机效果
         */
        transition.type = @"pageCurl";
        /*
         subtype:
         1.fromLeft 2.fromRight 3.fromTop 4.fromBottom
         */
        transition.subtype = @"fromLeft";
        transition.duration = 3;
        
        /* startProgress  endProgress  动画的起点和终点 (百分比)*/

        UIView * tempview = [[UIView alloc] initWithFrame:self.aview.bounds];
        tempview.backgroundColor = [UIColor yellowColor];
        
        [self.aview addSubview:tempview];
        
        [self.aview.layer addAnimation:transition forKey:nil];
        
        
    }
    else if (sender.tag == 4) {
        //group
        /*
         默认情况下，一组动画对象是同时运行的，也可以通过设置动画对象的beginTime属性来更改动画的开始时间
         */
        
    
        
        
        
    }
    else if (sender.tag == 5) {
        
        //pause
        [self pauseLayer:self.aview.layer];
        
    }
    else if (sender.tag == 6) {
        
        //resume
        [self resumeLayer:self.aview.layer];
        
    }
   
    
    
    
}
- (void)haha {
    
    /*
     keypath:
     1.transform.scale 2.transform.rotation
     3.transform.translation
     */
    CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //value is object
    basic.fromValue = @1;
    basic.toValue = @.5;
    //keep current state
    basic.fillMode = kCAFillModeForwards;
    basic.removedOnCompletion = NO;
    
    basic.duration = 1;
    
    [self.aview.layer addAnimation:basic forKey:nil];
    
    
}

//pause
- (void)pauseLayer:(CALayer *) layer {
    
    CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    //stop CALayer
    layer.speed = 0.0;
    // CALayer pause
    layer.timeOffset = pauseTime;

    
}
//resume
- (void)resumeLayer:(CALayer *) layer {
    
    CFTimeInterval pauseTime = layer.timeOffset;
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    //compute pause time
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
    layer.beginTime = timeSincePause;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
