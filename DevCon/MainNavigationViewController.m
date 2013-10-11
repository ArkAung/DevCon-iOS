//
//  MainNavigationViewController.m
//  DevCon
//
//  Created by Zayar on 10/8/13.
//  Copyright (c) 2013 devcon. All rights reserved.
//

#import "MainNavigationViewController.h"
#import "UIColor+Expanded.h"
#import "NavBarButton.h"
#import "ViewController.h"
#import "SpeakersViewController.h"
#import "FavouritesViewController.h"
@interface MainNavigationViewController ()
{
    IBOutlet UINavigationController * navMainController;
}
@end

@implementation MainNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    pulldownMenu = [[PulldownMenu alloc] initWithNavigationController:self];
    [self.view insertSubview:pulldownMenu belowSubview:self.navigationBar];
    
    [pulldownMenu insertButton:@"SCHEDULE"];
    [pulldownMenu insertButton:@"SPEAKERS"];
    [pulldownMenu insertButton:@"FAVOURITES"];
    
    pulldownMenu.delegate = self;
    
    pulldownMenu.handleColor = [UIColor colorWithHexString:@"dd7e37"];
    pulldownMenu.cellSelectedColor = [UIColor colorWithHexString:@"586d73"];
    
    [pulldownMenu loadMenu];
    
}

-(void)menuItemSelected:(NSIndexPath *)indexPath
{
    NSLog(@"menu %d",indexPath.item);
    if (indexPath.item == 0) {
        ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"schedule"];
        self.viewControllers = @[viewController];
        [pulldownMenu animateDropDown];
    }
    else if (indexPath.item == 1) {
        SpeakersViewController *sViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"speakers"];
        self.viewControllers = @[sViewController];
        
         [pulldownMenu animateDropDown];
    }
    else if (indexPath.item == 2) {
        FavouritesViewController *fViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"favourites"];
        self.viewControllers = @[fViewController];
        
        [pulldownMenu animateDropDown];
    }
    //favourites
}

- (void)animateDropDown{
    [pulldownMenu animateDropDown];
}

-(void)pullDownAnimated:(BOOL)open
{
    if (open)
    {
        NSLog(@"Pull down menu open!");
    }
    else
    {
        NSLog(@"Pull down menu closed!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
