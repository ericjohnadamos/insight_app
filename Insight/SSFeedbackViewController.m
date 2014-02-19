//
//  SSFeedbackViewController.m
//  Insight
//
//  Created by Eric John Adamos on 2/18/14.
//  Copyright (c) 2014 Eric John Adamos. All rights reserved.
//

#import "SSFeedbackViewController.h"
#import "SSFeedbackHeaderView.h"


@interface SSFeedbackViewController ()

@property (nonatomic, retain) SSFeedbackHeaderView* headerView;
@property (nonatomic, retain) UISegmentedControl* segmentControl;

@end


@implementation SSFeedbackViewController

#pragma mark -
#pragma mark Synthesize properties

@synthesize headerView = m_headerView;
@synthesize segmentControl = m_segmentControl;

#pragma mark -
#pragma mark Memory deallocation

- (void) dealloc
{
  self.headerView = nil;
  self.segmentControl = nil;
  
  [super dealloc];
}

#pragma mark -
#pragma mark Lazy loaders

- (SSFeedbackHeaderView*) headerView
{
  if (m_headerView == nil)
  {
    CGSize viewSize = self.view.bounds.size;
    CGRect navBarFrame = self.navigationController.navigationBar.frame;
    
    CGRect frame
      = CGRectMake(0.0f, CGRectGetMaxY(navBarFrame), viewSize.width, 100.0f);
    
    SSFeedbackHeaderView* headerView
      = [[SSFeedbackHeaderView alloc] initWithFrame: frame];
    
    m_headerView = headerView;
  }
  
  return m_headerView;
}

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
  [self.view addSubview: self.headerView];
}

@end
