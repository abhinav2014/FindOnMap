//
//  USAVC.h
//  CountriesAndStates
//
//  Created by Abhinav Dobhal on 17/03/19.
//  Copyright © 2019 Abhinav Dobhal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface USAVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIBarButtonItem *barButton;

@end

NS_ASSUME_NONNULL_END
