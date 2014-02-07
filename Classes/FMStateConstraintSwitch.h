//
//  ConstraintSwitch.h
//  FMConstraintSwitch
//
//  Created by Fernando Mazzon on 2/7/14.
//  Copyright (c) 2014 Fernando Mazzon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMStateConstraintSwitch : NSObject

/**
 A list of NSLayoutConstraints to be given high priority when state is state == NO
 */
@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray *noStateConstraints;

/**
 A list of NSLayoutConstraints to be given high priority when state is state == YES
 */
@property (nonatomic, strong) IBOutletCollection(NSLayoutConstraint) NSArray *yesStateConstraints;

/**
 The view for which we call layoutIfNeeded when there is a change in constraint priority
 */
@property (nonatomic, strong) IBOutlet UIView *layoutedView;

/**
 Controls the current state
 */
@property (nonatomic, assign) BOOL state;

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

/**
 IBAction to switch state to NO, useful to bind it directly in the interface builder
 */
- (IBAction)setNoState:(id)sender;

/**
 IBAction to switch state to YES, useful to bind it directly in the interface builder 
 */
- (IBAction)setYesState:(id)sender;

@end
