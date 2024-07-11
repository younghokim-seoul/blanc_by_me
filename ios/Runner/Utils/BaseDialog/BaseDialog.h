//
//  BaseDialog.h
//  AlarmGame
//
//  Created by Tiger on 2014. 4. 8..
//  Copyright (c) 2014 WG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseDialog : UIViewController {
    __weak IBOutlet UIView *m_viMainBg;
    __weak IBOutlet UIView *m_viPopupBg;
}

- (void)presentWithSuperview:(UIView *)superview;
- (void)removeFromSuperviewWithAnimation;

@end
