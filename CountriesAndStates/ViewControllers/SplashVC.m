//
//  SplashVC.m
//  CountriesAndStates
//
//  Created by Abhinav Dobhal on 17/03/19.
//  Copyright © 2019 Abhinav Dobhal. All rights reserved.
//

#import "SplashVC.h"
#import "ViewController.h"
#import "UIImage+animatedGIF.h"


@interface SplashVC ()

@end

@implementation SplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    double delayInSeconds = 4.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//    });
    
    [self configureView];
    [self playGIF];

}
-(void)configureView {
    [[self.getStartedButton layer] setCornerRadius:10];
    [[self.getStartedButton layer] setBorderColor: [UIColor colorWithRed:0 green:162/255 blue:0 alpha:1.0].CGColor];
    [[self.getStartedButton layer] setBorderWidth:1.0];
    
}
-(void)playGIF {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"globe" withExtension:@"gif"];
    self.imageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
}

- (IBAction)getStartedTapped:(id)sender {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vc animated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
