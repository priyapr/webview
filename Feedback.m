//
//  Feedback.m
//  webView
//
//  Created by Priya on 23/04/15.
//  Copyright (c) 2015 Priya. All rights reserved.
//

#import "Feedback.h"

@interface Feedback ()
{
    UITextField *uitext;
    UISegmentedControl *segment;
    UITextField *rate;
    UISlider *rateslider;
    UITextView *feedback;
    UIButton *done;
    UIImageView *feedbackimage;
    UILabel *feedbacklabel;
    NSArray *segmentcontent;
    UITextField *needchanges;
    UISwitch *selectswitch;
    UIImage *image;
    NSUserDefaults *feedbackinfo;
}

@end

@implementation Feedback

- (void)viewDidLoad {
    [super viewDidLoad];
    uitext = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, 130, 30)];
    uitext.placeholder =@"UI";
    [uitext setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:uitext];
    
    CGRect myframe= CGRectMake(180, 100, 150, 30);
    segmentcontent =[[NSArray alloc]initWithObjects:@"Bad",@"Good",@"Excellent", nil];
    segment=[[UISegmentedControl alloc]initWithItems:segmentcontent];
    segment.frame = myframe;
    [segment setTintColor:[UIColor grayColor]];
    [segment addTarget:self action:@selector(segmentcontrol) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    rate = [[UITextField alloc]initWithFrame:CGRectMake(20, 150, 130, 30)];
    rate.placeholder =@"Rate Us";
    [rate setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:rate];
    
    rateslider=[[UISlider alloc]initWithFrame:CGRectMake(180, 150, 150, 30)];
    [rateslider setMinimumValue:1];
    [rateslider setMaximumValue:5];
    [rateslider setTintColor:[UIColor grayColor]];
    [rateslider addTarget:self action:@selector(slidervalue) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rateslider];
    
    needchanges =[[UITextField alloc]initWithFrame:CGRectMake(20, 200, 130, 30)];
    needchanges.placeholder=@"Need Changes?";
    [needchanges setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:needchanges];
    
    selectswitch =[[UISwitch alloc]initWithFrame:CGRectMake(180, 200, 150, 30)];
    [selectswitch setTintColor:[UIColor grayColor]];
    [selectswitch setOnTintColor:[UIColor grayColor]];
    [selectswitch addTarget:self action:@selector(switchcontrol) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectswitch];
    
    feedbacklabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 420, 150, 30)];
    feedbacklabel.text=@"Suggesstion";
    [self.view addSubview:feedbacklabel];
    
    feedback =[[UITextView alloc]initWithFrame:CGRectMake(180, 400, 150, 60)];
    [feedback setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:feedback];
    
    
    done=[[UIButton alloc]initWithFrame:CGRectMake(130, 500, 100, 30)];
    [done setTitle:@"Done" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:done];
    
    
    feedbackimage = [[UIImageView alloc]init];
    [feedbackimage setImage:[UIImage imageNamed:@"feedback.jpg"]];
    CGRect fr=CGRectMake(40, 280, 300, 100);
    feedbackimage.frame=fr;
    [self.view addSubview:feedbackimage];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)segmentcontrol
{
    if (segment.selectedSegmentIndex == 0) {
        uitext.text = [segmentcontent objectAtIndex:0];
    }
    
    else if (segment.selectedSegmentIndex == 1) {
        uitext.text = [segmentcontent objectAtIndex:1];
    }
    
    else if (segment.selectedSegmentIndex == 2) {
        uitext.text = [segmentcontent objectAtIndex:2];
    }
   
}
 -(void)slidervalue
{
    NSInteger ratevalue = rateslider.value;
    rate.text = [NSString stringWithFormat:@"%ld", ratevalue];
}
-(void)switchcontrol
{
    if (selectswitch.isOn) {
        needchanges.text = @"Yes";
    }
    else
    {
        needchanges.text=@"No";
    }
}


-(void)buttonPressed
{
    if (uitext.text.length < 1) {
        UIAlertView *alt =[[UIAlertView alloc]initWithTitle:nil message:@"Select the UI" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alt show];
    }
    else if (rate.text.length < 1) {
        UIAlertView *alt =[[UIAlertView alloc]initWithTitle:nil message:@"Rate Us" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alt show];
    }
    else if (needchanges.text.length < 1) {
        UIAlertView *alt =[[UIAlertView alloc]initWithTitle:nil message:@"select option for need chnges field" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alt show];
    }
    else if (feedback.text.length < 1) {
        UIAlertView *alt =[[UIAlertView alloc]initWithTitle:nil message:@"Enter your suggesstion" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alt show];
    }
    else
    {
        feedbackinfo=[NSUserDefaults standardUserDefaults];
        [feedbackinfo setObject:uitext.text forKey:@"UI"];
        [feedbackinfo setObject:rate.text forKey:@"Rating"];
        [feedbackinfo setObject:needchanges.text forKey:@"Changes"];
        [feedbackinfo setObject:feedback.text forKey:@"Suggestion"];
    UIAlertView *alt =[[UIAlertView alloc]initWithTitle:nil message:@"Thanks for yor feedback" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alt show];
    }
}

@end
