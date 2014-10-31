//
//  ViewController.m
//  keuboard
//
//  Created by optimus-130 on 10/15/14.
//  Copyright (c) 2014 optimus-130. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(keyboardWillShow:)
																							 name:@"UIKeyboardWillShowNotification"
																						 object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(keyboardDidHide:)
																							 name:@"UIKeyboardDidHideNotification"
																						 object:nil];
	
	
	
}
- (void) keyboardWillShow:(NSNotification *)note {
	NSDictionary *userInfo = [note userInfo];
	CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey ] CGRectValue].size;
	
	NSLog(@"Keyboard Height: %f Width: %f", kbSize.height, kbSize.width);
	
//	// move the view up by 30 pts
//	CGRect frame = self.view.frame;
//	frame.origin.y = -30;
//	
//	[UIView animateWithDuration:0.3 animations:^{
//		self.view.frame = frame;
//	}];
}
- (void) keyboardDidHide:(NSNotification *)note {
	
	// move the view back to the origin
	CGRect frame = self.view.frame;
	frame.origin.y = 0;
	
	[UIView animateWithDuration:0.3 animations:^{
		self.view.frame = frame;
	}];
}
- (void) dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	// uncomment for non-ARC:
	// [super dealloc];
}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
