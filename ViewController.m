//
//  ViewController.m
//  webView
//
//  Created by Priya on 23/04/15.
//  Copyright (c) 2015 Priya. All rights reserved.
//

#import "ViewController.h"
#import "Feedback.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize urltext, optionsbutton, myWebview,feedbackbutton,loadbutton,myImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)feedbackbutton:(UIButton *)sender {
    Feedback *feedback=[[Feedback alloc]initWithNibName:@"Feedback" bundle:nil];
    [self.navigationController pushViewController:feedback animated:YES];
}

- (IBAction)optionsbutton:(UIBarButtonItem *)sender {
    UIActionSheet *action =[[UIActionSheet alloc]initWithTitle:@"Options" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"cancel" otherButtonTitles:@"Hide webView",@"Unhide webView",@"Display Image",@"feedback", nil];
    [action showInView:self.view];

    }
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        myWebview.hidden=YES;
        myImage.hidden=NO;
    }
    else if (buttonIndex ==2)
    {
        myWebview.hidden=NO;
        myImage.hidden=YES;
        
        
    }
    else if (buttonIndex ==3 )
    {
        myWebview.hidden=YES;
        [myImage setImage:[UIImage imageNamed:@"url2.jpg"]];
    }
    else if (buttonIndex == 4 )
    {
        if (urltext.text.length > 1) {
            Feedback *feedback=[[Feedback alloc]initWithNibName:@"Feedback" bundle:nil];
            [self.navigationController pushViewController:feedback animated:YES];

        }
        else if (urltext.text.length < 1)
        {
        
            UIAlertView *alt =[[UIAlertView alloc]initWithTitle:nil message:@"Enter the url" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alt show];
        }
   }
    
}

- (IBAction)loadbutton:(UIButton *)sender {
    NSString *url =[[NSString alloc]init];
    url= urltext.text;
    if((![url containsString:@"http://"] && ![url containsString:@"https://"]) || (![url containsString:@".com"] && ![url containsString:@".co.in"] && ![url containsString:@"org"])) {
        UIAlertView *at=[[UIAlertView alloc]initWithTitle:nil message:@"Enter a valid url" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [at show];
    }
    else
   {
    NSURL *nsurl =[NSURL URLWithString:url];
    NSURLRequest *req=[NSURLRequest requestWithURL:nsurl];
    [myWebview loadRequest:req];
   }

}
@end
