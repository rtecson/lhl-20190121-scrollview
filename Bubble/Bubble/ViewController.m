//
//  ViewController.m
//  Bubble
//
//  Created by steve on 2017-09-18.
//  Copyright © 2017 steve. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}


- (IBAction)unwind:(UIStoryboardSegue *)sender {
  if ([sender.identifier isEqualToString:@"unwindMe"]) {
    SecondViewController *svc = ((SecondViewController *)sender.sourceViewController);
    NSString *result = svc.greeting;
    NSLog(@"%@",result);
  }
}



@end
