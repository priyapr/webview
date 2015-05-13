//
//  ViewController.h
//  webView
//
//  Created by Priya on 23/04/15.
//  Copyright (c) 2015 Priya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UITextField *urltext;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *optionsbutton;
@property (strong, nonatomic) IBOutlet UIButton *feedbackbutton;
@property (strong, nonatomic) IBOutlet UIWebView *myWebview;
@property (strong, nonatomic) IBOutlet UIButton *loadbutton;
@property (strong, nonatomic) IBOutlet UIImageView *myImage;



- (IBAction)feedbackbutton:(UIButton *)sender;

- (IBAction)optionsbutton:(UIBarButtonItem *)sender;
- (IBAction)loadbutton:(UIButton *)sender;

@end

