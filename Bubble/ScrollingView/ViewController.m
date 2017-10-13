//
//  ViewController.m
//  Bubble
//
//  Created by Roland on 2017-09-18.
//  Copyright © 2017 Roland. All rights reserved.
//

#import "ViewController.h"
#import "ScrollingViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}


- (IBAction)unwind:(UIStoryboardSegue *)sender {
  if ([sender.identifier isEqualToString:@"unwindMe"]) {
    ScrollingViewController *svc = ((ScrollingViewController *)sender.sourceViewController);
    NSString *result = svc.greeting;
    NSLog(@"%@",result);
  }
}



@end
