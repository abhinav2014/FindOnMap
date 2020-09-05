//
//  TheWorldVC.m
//  CountriesAndStates
//
//  Created by Abhinav Dobhal on 17/03/19.
//  Copyright © 2019 Abhinav Dobhal. All rights reserved.
//

#import "TheWorldVC.h"


@interface TheWorldVC ()
@property (nonatomic, weak) CAShapeLayer* oldClickedLayer;
    @property NSMutableDictionary *dict;
@property NSMutableArray *arrayValue;
@property int randNum;
@property NSString *randString;
@property Boolean isTesting;

@property NSString *fillColor;
@property NSString *strokeColor;
@property NSString *nowFillColor;
@property NSString *scrollViewColor;


@end

@implementation TheWorldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fillColor = @"#F16A70";
    self.strokeColor = @"#B1D877";
    self.nowFillColor = @"#8CDCDA";
    self.scrollViewColor = @"#ADD9FE";

    [self fetchData];
    [self configureView];
}

-(void)configureView
{
    _isTesting = NO;
    [self.navigationItem setTitle:@"Select a Country"];
    _barButton = [[UIBarButtonItem alloc] initWithTitle:@"Test Yourself" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonTapped:)];
    [[self navigationItem] setRightBarButtonItem:_barButton];
    CGFloat viewHeight = self.view.frame.size.height;
    NSLog(@"%f",viewHeight);
    if (viewHeight == 375) {
        [_scrollView setContentSize: CGSizeMake(self.view.frame.size.width * 2, 1100)];
    } else {
        [_scrollView setContentSize: CGSizeMake(self.view.frame.size.width * 2, 1400)];
    }
    [_scrollView setBackgroundColor:[self colorWithHexString:self.scrollViewColor]];
    [self.view setBackgroundColor:[self colorWithHexString:self.scrollViewColor]];
    [self initIndiaMap];
}

- (void)initIndiaMap
    {
        self.map = [[FSInteractiveMapView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width * 2, 1400)];
        self.map.fillColor = [self colorWithHexString:self.fillColor];
        self.map.strokeColor = [self colorWithHexString:self.strokeColor];
        
        [self.map loadMap:@"worldHigh" withColors:nil];
        
//        __weak typeof(map) weakMap = map;
        __weak typeof(self) weakSelf = self;
        [self.map setClickHandler:^(NSString* identifier, CAShapeLayer* layer) {
            if(self->_oldClickedLayer) {
                self->_oldClickedLayer.zPosition = 0;
                self->_oldClickedLayer.shadowOpacity = 0;
            }
            NSString *name = [self->_dict valueForKey:identifier];
            self.title = [NSString stringWithFormat:@"You Clicked: %@",name];
            if (self->_isTesting) {
                // alert
                if ([self->_randString isEqualToString:name]) {
                    [self showAlert:@"You are Right"];
                } else {
                    [self showAlert:@"You are Wrong"];
                }
                self->_isTesting = NO;
            } else {
                
            }
            
            self->_oldClickedLayer.fillColor = [weakSelf colorWithHexString:weakSelf.fillColor].CGColor;
            self->_oldClickedLayer = layer;
            
            // We set a simple effect on the layer clicked to highlight it
            layer.zPosition = 10;
            layer.shadowOpacity = 0.5;
            layer.shadowColor = [UIColor blackColor].CGColor;
            layer.shadowRadius = 5;
            layer.shadowOffset = CGSizeMake(0, 0);
            layer.fillColor = [weakSelf colorWithHexString:weakSelf.nowFillColor].CGColor;

        }];
        
        [self.scrollView addSubview:self.map];
        [self.scrollView setContentOffset:CGPointMake(0, 320)];
        self.scrollView.minimumZoomScale=0.5;
        
        self.scrollView.maximumZoomScale=3.0;
        self.scrollView.delegate=self;
    }
-(void)fetchData {
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"WorldCountries" ofType:@"plist"];
    // Build the array from the plist
    NSDictionary *dict1 = [[NSDictionary alloc] initWithContentsOfFile:path];
    _dict = [dict1 mutableCopy];
    _arrayValue = [[_dict allValues] mutableCopy];
    NSLog(@"_arrayValue = %@",_arrayValue);
}
#pragma mark - Actions
-(IBAction)barButtonTapped:(id)sender {
    int r = arc4random_uniform(_arrayValue.count);
    _randString = [_arrayValue objectAtIndex:r];
    NSLog(@"_randString = %@",_randString);
    self.title = [NSString stringWithFormat:@"Find: %@",_randString];
    _isTesting = YES;
}
- (void)showAlert:(NSString*)message
{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:nil
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //Add Buttons
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark - scrollView
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _map;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    [self.map setUserInteractionEnabled:NO];
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.map setUserInteractionEnabled:YES];
    });
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
}
#pragma mark - UIColor
- (UIColor *)colorWithHexString:(NSString *)str {
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [self colorWithHex:x];
}
- (UIColor *)colorWithHex:(UInt32)col {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

@end
