//
//  ViewController.m
//  facebook
//
//  Created by eva on 16/1/7.
//  Copyright © 2016年 eva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)facebookBtnClick:(id)sender {
     //首先判断服务器是否可以访问
//          if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//              NSLog(@"Available\\");
    
    SLComposeViewController *controller = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeFacebook];
    SLComposeViewControllerCompletionHandler myBlock =
    ^(SLComposeViewControllerResult result){
        if (result == SLComposeViewControllerResultCancelled)
        {
            NSLog(@"Cancelled");
        }
        else
        {
            NSLog(@"Done");
        }
        [controller dismissViewControllerAnimated:YES completion:nil];
    };
    controller.completionHandler =myBlock;
    //Adding the Text to the facebook post value from iOS
    [controller setInitialText:@"My test post"];
    //Adding the URL to the facebook post value from iOS
    [controller addURL:[NSURL URLWithString:@"http://www.test.com"]];
    //Adding the Text to the facebook post value from iOS
    [self presentViewController:controller animated:YES completion:nil];
//          }
//          else {
//              NSLog(@"NO=================");
//          }
}

- (IBAction)twitterBtnClick:(id)sender {
    
   
    
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:@"My test tweet"];
    [self presentModalViewController:tweetSheet animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
