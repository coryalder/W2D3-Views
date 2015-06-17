//
//  ViewController.m
//  MovingViews2
//
//  Created by Cory Alder on 2015-06-17.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *boxView;
@property (weak, nonatomic) IBOutlet UILabel *frameLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsLabel;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *boxTopContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *boxCenterConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.frameLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self update];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)upAction:(id)sender {
    CGPoint newCenter = self.boxView.center;
    
    newCenter.y = newCenter.y - 100;
//    
//    [UIView animateWithDuration:2.0 animations:^{
//        self.boxView.center = newCenter;
//    }];
    
    //self.boxView.backgroundColor = [UIColor colorWithRed:0.5 green:0.25 blue:0.10 alpha:0.8];
    
    //self.boxView.alpha = 0.8;
    
    [UIView animateWithDuration:2.0 delay:0.2 options:0 animations:^{
        self.boxView.center = newCenter;
        self.boxView.backgroundColor = [UIColor colorWithRed:0.5 green:0.25 blue:0.10 alpha:0.8];
    } completion:^(BOOL finished) {
        NSLog(@"animation done");
    }];
    
    
    [self update];
}




- (IBAction)downAction:(id)sender {
    
    CGRect newFrame = self.boxView.frame;
    
    newFrame.origin.y = newFrame.origin.y + 10;
    
    self.boxView.frame = newFrame;
    
    [self update];
}

- (IBAction)leftAction:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.boxCenterConstraint.constant += 10;
        [self.view layoutSubviews];
    }];
    
    [self update];
}

- (IBAction)rightAction:(id)sender {
//    CGRect newFrame = self.boxView.frame;
//    
//    newFrame.origin.x = newFrame.origin.x + 10;
//    
//    self.boxView.frame = newFrame;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.boxCenterConstraint.constant -= 10;
        [self.view layoutSubviews];
    }];
    
    [self update];
}

- (IBAction)bigAction:(id)sender {
    
    CGRect newFrame = self.boxView.frame;
    
    newFrame = CGRectInset(newFrame, -10, -10);
    
    self.boxView.frame = newFrame;
    
    [self update];
}




-(void)update {
    
    NSString *frameString = [NSString stringWithFormat:@"Frame: %@",  NSStringFromCGRect(self.boxView.frame)];
    
    NSNumber *strikethroughStyle = @(NSUnderlineStyleSingle | NSUnderlinePatternSolid);
    
    NSAttributedString *attributedFrameString = [[NSAttributedString alloc] initWithString:frameString attributes:@{ NSStrikethroughStyleAttributeName : strikethroughStyle }];
    
    
    
    self.frameLabel.attributedText = attributedFrameString;
//    self.frameLabel.text = frameString;
    
    
    self.boundsLabel.text = [NSString stringWithFormat:@"Bounds: %@",  NSStringFromCGRect(self.boxView.bounds)];
}



@end
