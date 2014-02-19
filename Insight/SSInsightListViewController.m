//
//  SSInsightListControllerViewController.m
//  Insight
//
//  Created by Eric John Adamos on 2/11/14.
//  Copyright (c) 2014 Eric John Adamos. All rights reserved.
//

#import "SSInsightListViewController.h"
#import "SSFeedbackViewController.h"


typedef enum
{
  kQuestionnairePopupButtonCancel = 0,
  kQuestionnairePopupButtonSubmit = 1
} kQuestionnairePopupButton;

@interface SSInsightListViewController ()
  <UIImagePickerControllerDelegate,
   UITableViewDataSource, UITableViewDelegate,
   UINavigationControllerDelegate,
   UIAlertViewDelegate>

@property (nonatomic, retain) UIImagePickerController* imagePickerController;
@property (nonatomic, retain) UITableView* tableView;
@property (nonatomic, retain) UIAlertView* questionPopupView;

@end


@implementation SSInsightListViewController

#pragma mark -
#pragma mark Synthesize properties

@synthesize imagePickerController = m_imagePickerController;
@synthesize tableView = m_tableView;
@synthesize questionPopupView = m_questionPopupView;

#pragma mark -
#pragma mark Memory deallocation

- (void) dealloc
{
  self.imagePickerController = nil;
  self.tableView = nil;
  self.questionPopupView = nil;
  
  [super dealloc];
}

#pragma mark -
#pragma mark Lazy loading

- (UIImagePickerController*) imagePickerController
{
  if (m_imagePickerController == nil)
  {
    UIImagePickerController* imagePickerController
      = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    imagePickerController.sourceType
      = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    m_imagePickerController = imagePickerController;
  }
  
  return m_imagePickerController;
}

- (UITableView*) tableView
{
  if (m_tableView == nil)
  {
    UITableView* tableView
      = [[UITableView alloc] initWithFrame: self.view.bounds
                                     style: UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    m_tableView = tableView;
  }
  
  return m_tableView;
}

- (UIAlertView*) questionPopupView
{
  if (m_questionPopupView == nil)
  {
    UIAlertView* questionPopupView
      = [[UIAlertView alloc] initWithTitle: @"Add a questionnaire"
                                   message: @"Enter your question ID"
                                  delegate: self
                         cancelButtonTitle: @"Cancel"
                         otherButtonTitles: @"Submit", nil];
    
    questionPopupView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    m_questionPopupView = questionPopupView;
  }
  
  return m_questionPopupView;
}

#pragma mark -
#pragma mark Application lifecycle

- (void) viewDidLoad
{
  self.view.backgroundColor = [UIColor whiteColor];
  
  [self setupNavigationItem];
  
  [self.view addSubview: self.tableView];
  
  [super viewDidLoad];
}

- (void) didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Application lifecycle supporting methods

- (void) setupNavigationItem
{
  UIBarButtonSystemItem cameraItem = UIBarButtonSystemItemCamera;
  UIBarButtonItem* cameraButton
    = [[UIBarButtonItem alloc]
       initWithBarButtonSystemItem: cameraItem
                            target: self
                            action: @selector(handleCameraButton)];
  [cameraButton autorelease];
  
  UIBarButtonSystemItem addItem = UIBarButtonSystemItemAdd;
  UIBarButtonItem* addButton
    = [[UIBarButtonItem alloc]
       initWithBarButtonSystemItem: addItem
                            target: self
                            action: @selector(handleAddButton)];
  [addButton autorelease];
  
  self.navigationItem.rightBarButtonItems = @[cameraButton, addButton];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate methods

- (void) imagePickerController: (UIImagePickerController*) picker
 didFinishPickingMediaWithInfo: (NSDictionary*)            info
{
  /* TODO: Handle me */
}

#pragma mark -
#pragma mark UITableViewDelegate methods

- (CGFloat)   tableView: (UITableView*) tableView
heightForRowAtIndexPath: (NSIndexPath*) indexPath
{
  return 44.0f;
}

- (void)      tableView: (UITableView*) tableView
didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
  /* Deselect the selected row */
  [tableView deselectRowAtIndexPath: indexPath
                           animated: NO];
  
  SSFeedbackViewController* feedbackController
    = [[SSFeedbackViewController alloc] init];
  [feedbackController autorelease];
  
  [self.navigationController pushViewController: feedbackController
                                       animated: YES];
}

#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger) tableView: (UITableView*) tableView
  numberOfRowsInSection: (NSInteger)    section
{
  return 20;
}

- (UITableViewCell*) tableView: (UITableView*) tableView
         cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
  static NSString* identifier = @"kID";
  
  UITableViewCell* cell
    = [tableView dequeueReusableCellWithIdentifier: identifier];
  
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                  reuseIdentifier: identifier];
  }
  
  cell.textLabel.text = [NSString stringWithFormat: @"item %ld", indexPath.row];
  
  return cell;
}

#pragma mark -
#pragma mark Convenience methods

- (void) handleCameraButton
{
  [self presentViewController: self.imagePickerController
                     animated: YES
                   completion: nil];
}

- (void) handleAddButton
{
  [self.questionPopupView show];
}

#pragma mark -
#pragma mark UIAlertViewDelegate methods

- (void)   alertView: (UIAlertView*) alertView
clickedButtonAtIndex: (NSInteger)    buttonIndex
{
  if (buttonIndex == kQuestionnairePopupButtonSubmit)
  {
    /* TODO: Implement me */
  }
}

@end
