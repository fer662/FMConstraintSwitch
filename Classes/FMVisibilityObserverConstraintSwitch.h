//
//  VisibilityObserverSwitch.h
//  DynamicTableHeight
//
//  Created by Fernando Mazzon on 2/7/14.
//  Copyright (c) 2014 RGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 A class that encapsulated the changing of the priority of two groups of constraints depending on the visibility
 of a view. When the view is hidden, hiddenConstraints will be given higher priority than visibleConstraints, and
 viceversa.
 */
@interface FMVisibilityObserverConstraintSwitch : NSObject

/**
 A list of NSLayoutConstraints to be given high priority when observedView is visible
 */
@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray *visibleConstraints;

/**
 A list of NSLayoutConstraints to be given high priority when observedView is hidden
 */
@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray *hiddenConstraints;

/**
 The view for which we observe the hidden property
 */
@property (nonatomic, strong) IBOutlet UIView *observedView;

/**
 The view for which we call layoutIfNeeded when there is a change in constraint priority
 */
@property (nonatomic, strong) IBOutlet UIView *layoutedView;

/**
 Controls whether the layout change is animated or not. Default: NO
 */
@property (nonatomic, assign) BOOL animated;

/**
 If animated == YES, controls the curve at which the animation is performed
 */
@property (nonatomic, assign) UIViewAnimationCurve animationCurve;

/**
 If animated == YES, controls the duration of the transition
 */
@property (nonatomic, assign) CGFloat animationDuration;

@end
