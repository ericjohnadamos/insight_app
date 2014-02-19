//
//  SSFeedbackHeaderView.m
//  Insight
//
//  Created by Eric John Adamos on 2/19/14.
//  Copyright (c) 2014 Eric John Adamos. All rights reserved.
//

#import "SSFeedbackHeaderView.h"

@interface SSFeedbackHeaderView ()

@property (nonatomic, retain) UILabel* questionLabel;

@end

@implementation SSFeedbackHeaderView

#pragma mark -
#pragma mark Synthesize properties

@synthesize questionLabel = m_questionLabel;

#pragma mark -
#pragma mark Memory deallocation

- (void) dealloc
{
  self.questionLabel = nil;
  
  [super dealloc];
}

#pragma mark -
#pragma mark Initializer

- (id) initWithFrame: (CGRect) frame
{
  self = [super initWithFrame: frame];
  
  if (self != nil)
  {
    [self addSubview: self.questionLabel];
  }
  
  return self;
}

#pragma mark -
#pragma mark Lazy loaders

- (void) setHeaderText: (NSString*) headerText
{
  self.questionLabel.text = headerText;
  
  NSStringDrawingContext* context = [[NSStringDrawingContext alloc] init];
  context.minimumScaleFactor = 0.7f;
  
  CGSize labelSize = CGSizeMake(self.bounds.size.width, MAXFLOAT);
  [headerText
   boundingRectWithSize: labelSize
                options: NSStringDrawingUsesLineFragmentOrigin
             attributes: @{NSFontAttributeName: self.questionLabel.font}
                context: context];
}

- (UILabel*) questionLabel
{
  if (m_questionLabel == nil)
  {
    UIFont* questionLabelFont = [UIFont systemFontOfSize: 14.0f];
    
    UILabel* questionLabel = [[UILabel alloc] init];
    
    questionLabel.font = questionLabelFont;
    questionLabel.numberOfLines = 4;
    questionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    questionLabel.backgroundColor = [UIColor clearColor];
    questionLabel.textAlignment = NSTextAlignmentCenter;
    
    NSInteger titleLines = MAX(1, 4);
    
    CGSize questionLabelSize
      = CGSizeMake(300.0f, questionLabelFont.lineHeight * titleLines);

    questionLabel.frame
      = CGRectMake(10.0f, 0.0f, 300.0f, questionLabelSize.height);
    
    m_questionLabel = questionLabel;
  }
  
  return m_questionLabel;
}

@end
