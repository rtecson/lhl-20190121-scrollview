//
//  ScrollViewController.m
//  SimpleScrollView
//
//  Created by Roland on 2017-09-18.
//  Copyright © 2017 Roland. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic) UIImageView *imageView;
@end

@implementation ScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:scrollView];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cats"]];
    [scrollView addSubview:self.imageView];
    scrollView.contentSize = self.imageView.bounds.size;
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 0.25;
    scrollView.maximumZoomScale = 3.0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewDidScroll");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewDidEndDecelerating");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"In scrollViewWillEndDragging");
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"In viewForZoomingInScrollView");
    return self.imageView;
}






@end
