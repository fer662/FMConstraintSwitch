//
//  VisibilityObserverSwitch.m
//  DynamicTableHeight
//
//  Created by Fernando Mazzon on 2/7/14.
//  Copyright (c) 2014 RGA. All rights reserved.
//

#import "FMVisibilityObserverConstraintSwitch.h"

@implementation FMVisibilityObserverConstraintSwitch

- (void)setObservedView:(UIView *)observedView
{
    [self.observedView removeObserver:self forKeyPath:@"hidden" context:nil];
    [observedView addObserver:self forKeyPath:@"hidden" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(UIView *)object change:(NSDictionary *)change context:(void *)context
{
    for (NSLayoutConstraint *c in self.hiddenConstraints) {
        c.priority = [object isHidden]?999:1;
    }
    for (NSLayoutConstraint *c in self.visibleConstraints) {
        c.priority = [object isHidden]?1:999;
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

@end
