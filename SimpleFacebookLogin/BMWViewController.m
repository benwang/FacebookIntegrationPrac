//
//  BMWViewController.m
//  SimpleFacebookLogin
//
//  Created by Benjamin Wang on 5/6/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface BMWViewController ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation BMWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
        UIImage *image = [UIImage imageNamed:@"fabric_of_squares_gray.png"];
        self.imageView = [[UIImageView alloc] initWithImage: image];
        [self.view addSubview:self.imageView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        self.label.text = @"You are logged in.";
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.label];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                  initWithTitle:@"Logout"
                                                  style:UIBarButtonItemStyleBordered
                                                  target:self
                                                  action:@selector(logoutButtonWasPressed:)];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)populateUserDetails
{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 self.label.numberOfLines = 0;
//                 self.label.lineBreakMode = UILayoutConstraintAxisHorizontal;
                 
                 self.label.text = [NSString stringWithFormat:@"Hello, %@.\r\n %@!", user.name, user.link];
             }
         }];
    }
}

-(void)logoutButtonWasPressed:(id)sender {
    [FBSession.activeSession closeAndClearTokenInformation];
}


@end
