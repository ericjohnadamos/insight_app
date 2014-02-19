//
//  SSFeedbackViewController.m
//  Insight
//
//  Created by Eric John Adamos on 2/18/14.
//  Copyright (c) 2014 Eric John Adamos. All rights reserved.
//

#import "SSFeedbackViewController.h"


@interface SSFeedbackViewController ()

@property (nonatomic, retain) UISegmentedControl* segmentControl;

@end


@implementation SSFeedbackViewController

#pragma mark -
#pragma mark Synthesize properties

@synthesize segmentControl = m_segmentControl;

#pragma mark -
#pragma mark Memory deallocation

- (void) dealloc
{
  [super dealloc];
}

#pragma mark -
#pragma mark Lazy loaders

- (UISegmentedControl*) segmentControl
{
  if (m_segmentControl == nil)
  {
    UISegmentedControl* segmentControl
      = [[UISegmentedControl alloc] initWithItems: @[@"Rate", @"Comments"]];
    
    m_segmentControl = segmentControl;
  }
  
  return m_segmentControl;
}

#pragma mark -
#pragma mark Application lifecycle

- (void) viewDidLoad
{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  [self setupComponents];
  [self addSubviews];
}

- (void) didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Convenience methods

- (void) setupComponents
{
  CGSize viewSize = self.view.bounds.size;
  CGRect navBarFrame = self.navigationController.navigationBar.frame;
  
  self.segmentControl.frame
    = CGRectMake(0, CGRectGetMaxY(navBarFrame), viewSize.width, 44);
}

- (void) addSubviews
{
  [self.view addSubview: self.segmentControl];
}

@end
