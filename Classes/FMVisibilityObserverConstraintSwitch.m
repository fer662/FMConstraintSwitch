//
//  VisibilityObserverSwitch.m
//  DynamicTableHeight
//
//  Created by Fernando Mazzon on 2/7/14.
//  Copyright (c) 2014 RGA. All rights reserved.
//

#import "FMVisibilityObserverConstraintSwitch.h"
#import <objc/runtime.h>

static UILayoutPriority kRequiredLayoutPriority = 999;
static UILayoutPriority kNotRequiredLayoutPriority = 1;

static char kObservedViewRetainKey;

@implementation FMVisibilityObserverConstraintSwitch

- (void)setObservedView:(UIView *)observedView
{
    if (_observedView) {
        //Make the old observed view release this switch
        objc_setAssociatedObject(_observedView, &kObservedViewRetainKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [_observedView removeObserver:self forKeyPath:@"hidden" context:nil];
    }
    _observedView = observedView;
    if (_observedView) {
        //Make the new observed view retain this switch. This is so this object doesn't need an strong outlet
        //to prevent it from getting released.
        objc_setAssociatedObject(_observedView, &kObservedViewRetainKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    [observedView addObserver:self forKeyPath:@"hidden" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(UIView *)object change:(NSDictionary *)change context:(void *)context
{
    for (NSLayoutConstraint *c in self.hiddenConstraints) {
        c.priority = [object isHidden]?kRequiredLayoutPriority:kNotRequiredLayoutPriority;
    }
    for (NSLayoutConstraint *c in self.visibleConstraints) {
        c.priority = [object isHidden]?kNotRequiredLayoutPriority:kRequiredLayoutPriority;
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
