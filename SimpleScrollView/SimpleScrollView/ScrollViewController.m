//
//  ScrollViewController.m
//  SimpleScrollView
//
//  Created by steve on 2017-09-18.
//  Copyright © 2017 steve. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic) UIImageView *imageView;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return self.imageView;
}






@end
