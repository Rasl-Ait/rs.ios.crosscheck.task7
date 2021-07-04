//
//  AuthViewController.m
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import "AuthViewController.h"
#import "AuthView.h"
 
@interface AuthViewController () <AuthViewDelegate>

@property (nonatomic, strong) AuthView *authView;

@end

@implementation AuthViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = UIColor.whiteColor;
	[self setupAuthView];
}

- (void)setupAuthView {
	self.authView = [[AuthView alloc] init];
	self.authView.delegate = self;
	self.authView.translatesAutoresizingMaskIntoConstraints = false;
	[self.view addSubview:self.authView];
	
	[self.authView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
	[self.authView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
	[self.authView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
	[self.authView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

-(void)showAlert{
	
	UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"Welcome"
																																 message: @"You are successfuly authorized!"
																													preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive
																												handler:^(UIAlertAction * action) {
		[self.authView setIsHidden:true];
		[self.authView setDefault];
	}];
	
	[alert addAction:defaultAction];
	[self presentViewController:alert animated:YES completion:nil];
}

#pragma mark AuthViewDelegate
- (void)showSuccess {
	[self showAlert];
}

@end
