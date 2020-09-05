//
//  ViewController.m
//  CountriesAndStates
//
//  Created by Abhinav Dobhal on 17/03/19.
//  Copyright © 2019 Abhinav Dobhal. All rights reserved.
//

#import "ViewController.h"
#import "IndiaVC.h"
#import "TheWorldVC.h"
#import "ContinentsVC.h"
#import "USAVC.h"
#import "MenuCollectionViewCell.h"


@interface ViewController ()

    @property NSArray *options;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _options = @[@"The World", @"Continents", @"India", @"USA"];
    self.title = @"Select an option";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _options.count;
}
    
-(UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@",[_options objectAtIndex:indexPath.row]]];
    return cell;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            TheWorldVC *vc = [sb instantiateViewControllerWithIdentifier:@"TheWorldVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
        break;
        case 1:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ContinentsVC *vc = [sb instantiateViewControllerWithIdentifier:@"ContinentsVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
        break;
        case 2:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            IndiaVC *vc = [sb instantiateViewControllerWithIdentifier:@"IndiaVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
        break;
        default:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            USAVC *vc = [sb instantiateViewControllerWithIdentifier:@"USAVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
        break;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCollectionViewCell" forIndexPath:indexPath];
    [cell.layer setCornerRadius:10];
    [cell.layer setBorderWidth:1.0];
    [cell.layer setBorderColor:[UIColor blackColor].CGColor];
    switch (indexPath.item) {
        case 0:
        {
//            [cell.nameLabel setText:@"The World"];
            cell.nameLabel.text = @"The World";
            cell.imageView.image = [UIImage imageNamed:@"World_map_political_ISO"];
            cell.backgroundColor = [UIColor clearColor];
        }
            break;
        case 1:
        {
            cell.nameLabel.text = @"Continents";
            cell.imageView.image = [UIImage imageNamed:@"continents"];
            cell.backgroundColor = [UIColor colorWithRed:214.0f/255.0f green:254.0f/255.0f blue:254.0f/255.0f alpha:1.0];
        }
            break;
        case 2:
        {
            cell.nameLabel.text = @"India";
            cell.imageView.image = [UIImage imageNamed:@"india"];
            cell.backgroundColor = [UIColor whiteColor];
        }
            break;
            default:
        {
            cell.nameLabel.text = @"USA";
            cell.imageView.image = [UIImage imageNamed:@"usa"];
            cell.backgroundColor = [UIColor whiteColor];
        }
            break;
            
    }
    
//    [cell setBackgroundColor:[UIColor redColor]];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = self.view.frame.size.height;
    CGFloat cellHeight = (height - 74)/2;
    return CGSizeMake(cellHeight, cellHeight);
}
//-(UIEdgeInsets ) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    CGFloat height = self.view.frame.size.height;
//    CGFloat width = self.view.frame.size.width;
//    CGFloat cellHeight = (height - 74)/2;
//    CGFloat insetWidth = width - ((cellHeight * 2) + 10);
//    return UIEdgeInsetsMake(0, (insetWidth / 2) - 50, 0, (insetWidth / 2) - 50);
//}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.item) {
        case 0:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            TheWorldVC *vc = [sb instantiateViewControllerWithIdentifier:@"TheWorldVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
            break;
        case 1:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ContinentsVC *vc = [sb instantiateViewControllerWithIdentifier:@"ContinentsVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
            break;
        case 2:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            IndiaVC *vc = [sb instantiateViewControllerWithIdentifier:@"IndiaVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
            break;
        default:
        {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            USAVC *vc = [sb instantiateViewControllerWithIdentifier:@"USAVC"];
            [self.navigationController pushViewController:vc animated:true];
        }
            break;
    }
}

@end
