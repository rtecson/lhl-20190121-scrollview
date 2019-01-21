//
//  ScrollViewController.m
//  SimpleScrollView
//
//  Created by Roland on 2017-09-18.
//  Copyright © 2017 Roland. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController () <UIScrollViewDelegate>
@property (nonatomic) UIImageView *imageView;
@end

@implementation ScrollViewController

// MARK: - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Make scrollview have the same frame (same location and size) as the view controller's view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:scrollView];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cats"]];
    [scrollView addSubview:self.imageView];
    
    // Make the scrollview's content size the same as the size of the imageview
    scrollView.contentSize = self.imageView.bounds.size;
    
    // Make ourself the delegate for the scrollview
    scrollView.delegate = self;
    
    // The next two properties need to be set if you want to enable pinch/zoom
    scrollView.minimumZoomScale = 0.001;
    scrollView.maximumZoomScale = 3000000.0;
}

// MARK: - UIScrollViewDelegate methods

// Called when we first start the scroll
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewWillBeginDragging");
}

// Called while the scrollview is moving
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewDidScroll");
    NSLog(@"scrollview content offsetX = %f, offsetY = %f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

// Called when we lift our finger (stop dragging)
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"In scrollViewWillEndDragging");
}

// CAlled when the scrollview stops moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewDidEndDecelerating");
}

// You must define this delegate method if you want to enable pinch/zoom
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"In viewForZoomingInScrollView");
    // Don't check the value of zoomScale here
    return self.imageView;
}

// Get the final zoom scale with this method
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"Scrollview zoom scale = %f", scale);
}

@end
