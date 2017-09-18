//
//  PagerViewController.m
//  Pager
//
//  Created by steve on 2017-09-18.
//  Copyright © 2017 steve. All rights reserved.
//

#import "PagerViewController.h"

@interface PagerViewController ()<UIScrollViewDelegate>
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UIImageView *imageView2;
@property (nonatomic) UIPageControl *pageControl;
@end

@implementation PagerViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:self.scrollView];
  self.scrollView.pagingEnabled = YES;
  self.scrollView.delegate = self;
  [self createImageViews];
  [self setupLayout];
  [self createPageControl];
}

- (void)createImageViews {
  self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"toronto"]];
  self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"montreal"]];
  [self.scrollView addSubview:self.imageView1];
  [self.scrollView addSubview:self.imageView2];
  self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
  self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
  self.imageView1.clipsToBounds = YES;
  self.imageView2.clipsToBounds = YES;
}

- (void)setupLayout {
  self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
  self.imageView2.translatesAutoresizingMaskIntoConstraints = NO;
  [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
  [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  [self.imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
  [self.imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  
  [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
  [self.imageView2.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
  
  // width and height
  [self.imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
  [self.imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
  
  [self.imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
  [self.imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
  
  [self.imageView1.trailingAnchor constraintEqualToAnchor:self.imageView2.leadingAnchor].active = YES;
}

#define pageControlHeight 20.0

- (void)createPageControl {
  CGRect frame = CGRectMake(0.0, self.view.frame.size.height - pageControlHeight, self.view.frame.size.width, pageControlHeight);
  self.pageControl = [[UIPageControl alloc] initWithFrame:frame];
  [self.view addSubview:self.pageControl];
  self.pageControl.layer.zPosition = 2;
  self.pageControl.numberOfPages = 2;
  self.pageControl.backgroundColor = [UIColor blackColor];
  self.pageControl.alpha = 0.5;
  [self.pageControl addTarget:self action:@selector(pageTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pageTapped:(UIPageControl *)sender {}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  [self updatePageControl];
}

- (void)updatePageControl {
  CGFloat width = self.view.frame.size.width;
  CGFloat xOffset = self.scrollView.contentOffset.x;
  NSInteger pageNumber = xOffset / width;
  self.pageControl.currentPage = pageNumber;
}

@end
