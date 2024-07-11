//
//  BaseDialog.m
//  AlarmGame
//
//  Created by Tiger on 2014. 4. 8..
//  Copyright (c) 2014 WG. All rights reserved.
//

#import "BaseDialog.h"

static CGFloat kTransitionDuration = 0.3;

@interface BaseDialog ()

@end

@implementation BaseDialog

- (void)presentWithSuperview:(UIView *)superview
{
    [superview addSubview:self.view];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x , 0, superview.frame.size.width, superview.frame.size.height);
    
    [self show];
}

// Method called when removeFromSuperviewWithAnimation's animation completes
- (void)animationDidStop:(NSString *)animationID
                finished:(NSNumber *)finished
                 context:(void *)context
{
    if ([animationID isEqualToString:@"removeFromSuperviewWithAnimation"]) {
        [self.view removeFromSuperview];
    }
}

// Slide this view to bottom of superview, then remove from superview
- (void)removeFromSuperviewWithAnimation {
    [UIView beginAnimations:@"removeFromSuperviewWithAnimation" context:nil];
    [UIView setAnimationDuration:kTransitionDuration];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    m_viMainBg.alpha = 0;
    [UIView commitAnimations];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    m_viPopupBg.layer.cornerRadius = 5.0;
    m_viPopupBg.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (CGAffineTransform)transformForOrientation {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI/2);
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
    } else {
        return CGAffineTransformIdentity;
    }
}

- (void)bounce1AnimationStopped {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kTransitionDuration/2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
    m_viPopupBg.transform = CGAffineTransformScale([self transformForOrientation], 0.9, 0.9);
    [UIView commitAnimations];
}

- (void)bounce2AnimationStopped {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kTransitionDuration/2];
    m_viPopupBg.transform = [self transformForOrientation];
    [UIView commitAnimations];
}

- (void)show {
    m_viPopupBg.transform = CGAffineTransformScale([self transformForOrientation], 0.001, 0.001);
    m_viMainBg.alpha = 0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:kTransitionDuration/1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
    m_viPopupBg.transform = CGAffineTransformScale([self transformForOrientation], 1.1, 1.1);
    m_viMainBg.alpha = 0.8;
    [UIView commitAnimations];
}

@end
