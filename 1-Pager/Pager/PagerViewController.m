//
//  PagerViewController.m
//  Pager
//
//  Created by Roland on 2017-09-18.
//  Copyright © 2017 Roland. All rights reserved.
//

#import "PagerViewController.h"

@interface PagerViewController () <UIScrollViewDelegate>

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UIImageView *imageView2;

@end

@implementation PagerViewController

// MARK: - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self createImageViews];
    [self setupLayout];
}

// MARK: - Internal methods

- (void)createImageViews
{
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"toronto"]];
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"montreal"]];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView1.clipsToBounds = YES;
    self.imageView2.clipsToBounds = YES;
}

- (void)setupLayout
{
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

@end
