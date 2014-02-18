//
//  TipViewController.m
//  ios-todo-app
//
//  Created by user on 2/4/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (nonatomic, strong) NSArray *tipAmount;
- (void)updatevalues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
        self.tipAmount=@[@(0.1),@(0.15),@(0.2)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.billTextField.delegate =self;
    // Do any additional setup after loading the view from its nib.
    [self.tipControl addTarget:self action:@selector(updatevalues) forControlEvents:UIControlEventValueChanged];
    self.tipControl.selectedSegmentIndex=1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark UITextfield delegate methods
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

-(BOOL) textFieldShouldEndEditing:(UITextField *)textField  {
    self.navigationItem.rightBarButtonItem =nil;
    [self updatevalues];
    return YES;
}

-(void)onDoneButton{
    [self.view endEditing:YES];
    [self updatevalues];
}
#pragma  mark - private methods
-(void) updatevalues {
    float tipPercentage = [self.tipAmount[self.tipControl.selectedSegmentIndex]floatValue];
    float bill = [self.billTextField.text floatValue];
    float tip = tipPercentage *bill;
    float total = bill+tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",total];
}
@end
