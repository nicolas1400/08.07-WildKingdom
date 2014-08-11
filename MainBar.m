//
//  MainBar.m
//  WildKingdom
//
//  Created by Nicolas Semenas on 08/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "MainBar.h"
#import "Detail1ViewController.h"

@interface MainBar () <UITabBarControllerDelegate>

@end

@implementation MainBar

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
    self.delegate = self;

}

-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(Detail1ViewController *)viewController
{
//    NSLog(@"selected %d",tabBarController.selectedIndex);
//    self.tab = tabBarController.selectedIndex;
//    Detail1ViewController * destinationViewController = (Detail1ViewController *)tabBarController.selectedViewController;
//    destinationViewController.currentTab = tabBarController.selectedIndex ;

    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
