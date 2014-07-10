//
//  ConstraintSwitch.m
//  FMConstraintSwitch
//
//  Created by Fernando Mazzon on 2/7/14.
//  Copyright (c) 2014 Fernando Mazzon. All rights reserved.
//

#import "FMStateConstraintSwitch.h"

@interface FMStateConstraintSwitch ()

@property (nonatomic, assign) BOOL firstChangeCompleted;

@end

@implementation FMStateConstraintSwitch

- (void)setState:(BOOL)state
{
    if (_state != state || !self.firstChangeCompleted) {
        _state = state;
        
        self.firstChangeCompleted = YES;
        
        for (NSLayoutConstraint *c in self.noStateConstraints) {
            c.priority = state?1:999;
        }
        for (NSLayoutConstraint *c in self.yesStateConstraints) {
            c.priority = state?999:1;
        }
        
        if (self.animated) {
            [UIView animateWithDuration:self.animationDuration delay:0 options:self.animationCurve << 16 animations:^{
                [self.layoutedView layoutIfNeeded];
            } completion:^(BOOL finished) {
            }];
        }
        else {
            [self.layoutedView layoutIfNeeded];
        }
    }
}

- (IBAction)setNoState:(id)sender
{
    [self setState:NO];
}

- (IBAction)setYesState:(id)sender
{
    [self setState:YES];
}

@end
