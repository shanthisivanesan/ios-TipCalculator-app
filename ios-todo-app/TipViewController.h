//
//  TipViewController.h
//  ios-todo-app
//
//  Created by user on 2/4/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic,strong) IBOutlet UITextField *billTextField;
@property(nonatomic,strong) IBOutlet UILabel *tipLabel;
@property(nonatomic,strong) IBOutlet UILabel *totalLabel;
@property(nonatomic,strong) IBOutlet UISegmentedControl *tipControl;

-(IBAction)onDoneButton;

@end
