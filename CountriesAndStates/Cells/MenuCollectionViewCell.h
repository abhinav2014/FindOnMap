//
//  MenuCollectionViewCell.h
//  CountriesAndStates
//
//  Created by Abhinav Dobhal on 02/04/19.
//  Copyright © 2019 Abhinav Dobhal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

NS_ASSUME_NONNULL_END
