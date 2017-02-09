//
//  ViewController.m
//  foldDemo
//
//  Created by 董知樾 on 2017/2/9.
//  Copyright © 2017年 董知樾. All rights reserved.
//
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) CGPoint beginPoint;

@property (strong, nonatomic) CALayer *layer1_top;
@property (strong, nonatomic) CALayer *layer1_bottom;

@property (strong, nonatomic) CAGradientLayer *gradient1_bottom;

@property (strong, nonatomic) CALayer *layer2_top;
@property (strong, nonatomic) CALayer *layer2_bottom;

@property (strong, nonatomic) CAGradientLayer *gradient2_top;

@property (assign, nonatomic) CGPoint lastPoint;
//@property (assign, nonatomic) CGPoint currentPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //下层
    _layer1_top = [CALayer layer];
    _layer1_top.frame = CGRectMake(0, 0, width, height * 0.5);
    _layer1_top.contents = (__bridge id _Nullable)([UIImage imageNamed:@"IU.jpeg"].CGImage);
    _layer1_top.contentsRect = CGRectMake(0, 0, 1, 0.5);
    _layer1_top.contentsGravity = kCAGravityResizeAspectFill;
    [self.view.layer addSublayer:_layer1_top];
    
    _layer1_bottom = [CALayer layer];
    _layer1_bottom.frame = CGRectMake(0, height * 0.5, width, height * 0.5);
    _layer1_bottom.position = CGPointMake(width*0.5, height * 0.5);
    _layer1_bottom.anchorPoint = CGPointMake(0.5, 0);
    _layer1_bottom.contents = (__bridge id _Nullable)([UIImage imageNamed:@"IU.jpeg"].CGImage);
    _layer1_bottom.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    _layer1_bottom.contentsGravity = kCAGravityResizeAspectFill;
    [self.view.layer addSublayer:_layer1_bottom];
    
    _gradient1_bottom = [CAGradientLayer layer];
    _gradient1_bottom.colors = @[(__bridge id _Nullable)([UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor),(__bridge id _Nullable)([UIColor clearColor].CGColor)];
    _gradient1_bottom.frame = _layer1_bottom.bounds;
    [_layer1_bottom addSublayer:_gradient1_bottom];
    _gradient1_bottom.opacity = 1;
    
    //上层
    _layer2_top = [CALayer layer];
    _layer2_top.frame = CGRectMake(0, 0, width, height * 0.5);
    _layer2_top.position = CGPointMake(width*0.5, height * 0.5);
    _layer2_top.anchorPoint = CGPointMake(0.5, 1);
    _layer2_top.contents = (__bridge id _Nullable)([UIImage imageNamed:@"IU2.jpeg"].CGImage);
    _layer2_top.contentsRect = CGRectMake(0, 0, 1, 0.5);
    _layer2_top.contentsGravity = kCAGravityResizeAspectFill;
    _layer2_top.shadowColor = [UIColor grayColor].CGColor;
    [self.view.layer addSublayer:_layer2_top];
    
    _gradient2_top = [CAGradientLayer layer];
    _gradient2_top.colors = @[(__bridge id _Nullable)([UIColor clearColor].CGColor),(__bridge id _Nullable)([UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor)];
    _gradient2_top.frame = _layer2_top.bounds;
    [_layer2_top addSublayer:_gradient2_top];
    _gradient2_top.opacity = 0;
    
    _layer2_bottom = [CALayer layer];
    _layer2_bottom.frame = CGRectMake(0, height * 0.5, width, height * 0.5);
    _layer2_bottom.contents = (__bridge id _Nullable)([UIImage imageNamed:@"IU2.jpeg"].CGImage);
    _layer2_bottom.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    _layer2_bottom.contentsGravity = kCAGravityResizeAspectFill;
    [self.view.layer addSublayer:_layer2_bottom];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _beginPoint = [touches.anyObject locationInView:self.view];
    _lastPoint = _beginPoint;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint currentPoint = [touches.anyObject locationInView:self.view];
    
    CGFloat margin = currentPoint.y - _beginPoint.y;
    CGFloat angle = -margin / 300 * M_PI;
    
//    CGFloat margin1 = _lastPoint.y - _beginPoint.y;
//    CGFloat angle1 = -margin / 300 * M_PI;

    
    if (margin > 0) {//down
        CGFloat interval = 0.01;
        CGFloat m34 = -1 / 2000.0;
        
        if (angle < -M_PI || angle > 0) {
            return;
        }
//        if ((angle >= -M_PI_2 && angle1 <= -M_PI_2) || (angle >= -M_PI_2 && angle1 <= -M_PI_2)) {
//            if (angle > angle1) {
////                _layer2_top.hidden = YES;
////                _layer1_bottom.hidden = NO;
////                [UIView animateWithDuration:(angle + M_PI_2)/(angle - angle1) animations:^{
//                
////                    CATransform3D transform = CATransform3DMakeRotation( -M_PI_2, 1, 0, 0);
////                    transform.m34 = m34;
////                    _layer1_bottom.transform = transform;
////                    _gradient1_bottom.opacity = 1;
//
////                } completion:^(BOOL finished) {
//                    _layer2_top.hidden = NO;
//                    _layer1_bottom.hidden = YES;
////                    [UIView animateWithDuration:(-M_PI_2 - angle1)/(angle - angle1) animations:^{
//                
////                        transform = CATransform3DMakeRotation(angle, 1, 0, 0);
////                        transform.m34 = m34;
////                        _layer2_top.transform = transform;
////                        _gradient2_top.opacity = angle / -M_PI_2;
////                    }];
////                }];
//                
//            } else {
////                _layer2_top.hidden = NO;
////                _layer1_bottom.hidden = YES;
////                [UIView animateWithDuration:(-M_PI_2 - angle1)/(angle1 - angle) animations:^{
////                    CATransform3D transform = CATransform3DMakeRotation(angle, 1, 0, 0);
////                    transform.m34 = m34;
////                    _layer2_top.transform = transform;
////                    _gradient2_top.opacity = angle / -M_PI_2;
////                } completion:^(BOOL finished) {
//                    _layer2_top.hidden = YES;
//                    _layer1_bottom.hidden = NO;
////                    [UIView animateWithDuration:(angle + M_PI_2)/(angle1 - angle) animations:^{
////                        transform = CATransform3DMakeRotation( -M_PI_2, 1, 0, 0);
////                        transform.m34 = m34;
////                        _layer1_bottom.transform = transform;
////                        _gradient1_bottom.opacity = 1;
////                    }];
////                }];
//            }
//            CATransform3D transform = CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
//            transform.m34 = m34;
//            _layer1_bottom.transform = transform;
//            
//        } else
        if ((angle >= -M_PI_2-interval) && (angle <= -M_PI_2-interval)) {
            _layer1_bottom.hidden = YES;
            CATransform3D transform = CATransform3DMakeRotation(M_PI_2, 1, 0, 0);
            transform.m34 = m34;
            _layer1_bottom.transform = transform;
        } else if (angle <= -M_PI_2-interval) {
            _layer2_top.hidden = YES;
            _layer1_bottom.hidden = NO;
            CATransform3D transform = CATransform3DMakeRotation(M_PI +  angle, 1, 0, 0);
            transform.m34 = m34;
            _layer1_bottom.transform = transform;
            
            _gradient1_bottom.opacity = (M_PI +  angle) / M_PI_2;
            NSLog(@"%f",(M_PI +  angle) / M_PI_2);
        } else {
            
            _layer2_top.hidden = NO;
            _layer1_bottom.hidden = YES;
            CATransform3D transform = CATransform3DMakeRotation(angle, 1, 0, 0);
            transform.m34 = m34;
            _layer2_top.transform = transform;
            
            _gradient2_top.opacity = angle / -M_PI_2;
            //            NSLog(@"%f",angle / -M_PI_2);
        }
//        }
        
        _layer2_bottom.hidden = NO;
        
        _layer1_top.hidden = NO;
        
        
    } else {//up
        
    }
    
    
//
//    
//    
//    
//    
    _lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint currentPoint = [touches.anyObject locationInView:self.view];
    CGFloat margin = currentPoint.y - _beginPoint.y;
    CGFloat angle = -margin / 300 * M_PI;
    if (margin > 0) {//down
        CGFloat m34 = -1 / 2000.0;
        BOOL more_than_half = angle < -M_PI_2;
        if (!more_than_half) {
            
            [UIView animateWithDuration:0.5 animations:^{
                CATransform3D transform = CATransform3DMakeRotation(0, 1, 0, 0);
                transform.m34 = m34;
                _layer2_top.transform = transform;
                
                _gradient2_top.opacity = 0 / -M_PI_2;
            } completion:^(BOOL finished) {
                
            }];
        } else {
            
            [UIView animateWithDuration:0.5 animations:^{
                CATransform3D transform = CATransform3DIdentity;
                transform.m34 = m34;
                _layer1_bottom.transform = transform;
                _gradient1_bottom.opacity = 0;
            } completion:^(BOOL finished) {
                
            }];
        }
        _layer2_top.hidden = more_than_half;
        _layer2_bottom.hidden = more_than_half;
        _layer1_bottom.hidden = !more_than_half;
        _layer1_top.hidden = !more_than_half;
    } else {//up
        
    }
}


- (void)dropDown:(CGPoint)currentPoint {
    
}

- (void)dropUp:(CGPoint)currentPoint {
    
}


@end
