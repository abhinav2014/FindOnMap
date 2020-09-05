//
//  TheWorldVC.h
//  CountriesAndStates
//
//  Created by Abhinav Dobhal on 17/03/19.
//  Copyright © 2019 Abhinav Dobhal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSInteractiveMapView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TheWorldVC : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property FSInteractiveMapView* map;
@property UIBarButtonItem *barButton;
@end

NS_ASSUME_NONNULL_END
