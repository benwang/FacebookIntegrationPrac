//
//  BMWLoginViewController.m
//  SimpleFacebookLogin
//
//  Created by Benjamin Wang on 5/6/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWLoginViewController.h"
#import "BMWAppDelegate.h"

@implementation BMWLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        label.text = @"Please log in.";
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(10, 100, 300, 50);
        [button setTitle:@"Login" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(performLogin:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performLogin:(id)sender
{
    BMWAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate openSession];
}

- (void)loginFailed
{
    // User switched back to the app without authorizing. Stay here, but
    // stop the spinner.
    
    // do something
}

@end
