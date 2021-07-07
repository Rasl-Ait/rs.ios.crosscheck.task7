//
//  AuthView.m
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import "AuthView.h"
#import "UIColor+Extension.h"
#import "SecureView.h"

@interface AuthView () <UITextFieldDelegate, SecureViewDelegate, CustomButtonDelegate>

@end

@implementation AuthView

NSString *correctLogin = @"username";
NSString *correctPassword = @"password";

- (instancetype)init {
	self = [super init];
	if (self) {
		[self setupLabel];
		[self setupTextField];
		[self setupStackView];
		[self setupButton];
		[self setupSecureView];
		
		UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]
																								 initWithTarget:self
																								 action:@selector(hideKeyboard)];
		[self addGestureRecognizer:gestureRecognizer];
	}
	return self;
}

- (void) setupLabel {
	self.titleLabel = [[UILabel alloc] init];
	self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
	self.titleLabel.text = @"RSSchool";
	self.titleLabel.backgroundColor = UIColor.whiteColor;
	self.titleLabel.textAlignment = NSTextAlignmentCenter;
	self.titleLabel.font = [UIFont fontWithName:@"SF Pro Display Bold"
																				 size:36.0f];
	
	[self addSubview:self.titleLabel];
	
	[self.titleLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:80.0].active = YES;
	[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:101.0].active = YES;
	[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -101.0].active = YES;
}

- (void) setupTextField {
	self.loginTextField = [[CustomTextField alloc] init];
	self.loginTextField.placeholder = @"Login";

	self.passwordTextField = [[CustomTextField alloc] init];
	self.passwordTextField.placeholder = @"Password";
	[self.passwordTextField setSecureTextEntry:YES];
	
	self.loginTextField.delegate = self;
	self.passwordTextField.delegate = self;
	
	// Targets
	[self.loginTextField addTarget:self
													action:@selector(textFieldDidChange:)
								forControlEvents:UIControlEventEditingChanged];
	[self.passwordTextField addTarget:self
														 action:@selector(textFieldDidChange:)
									 forControlEvents:UIControlEventEditingChanged];
	
}

- (void) setupStackView {
	self.stackView = [[UIStackView alloc] init];
	self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
	self.stackView.axis = UILayoutConstraintAxisVertical;
	self.stackView.distribution = UIStackViewDistributionFillEqually;
	self.stackView.alignment = UIStackViewAlignmentFill;
	self.stackView.spacing = 30;
	
	[self.stackView addArrangedSubview:self.loginTextField];
	[self.stackView addArrangedSubview:self.passwordTextField];
	[self addSubview:self.stackView];
	
	[self.stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant: 36.0].active = YES;
	[self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -36.0].active = YES;
}

- (void) setupButton {
	self.authorizedButton = [[CustomButton alloc] initWithType:Authorize];
	self.authorizedButton.delegate = self;
	[self addSubview:self.authorizedButton];
	
	[self.authorizedButton.topAnchor constraintEqualToAnchor: self.stackView.bottomAnchor constant: 60].active = YES;
	[self.authorizedButton.widthAnchor constraintEqualToConstant: 156.0].active = YES;
	[self.authorizedButton.heightAnchor constraintEqualToConstant: 42.0].active = YES;
	[self.authorizedButton.centerXAnchor constraintEqualToAnchor: self.centerXAnchor].active = YES;
}

- (void) setupSecureView {
	self.secureView = [[SecureView alloc] init];
	self.secureView.translatesAutoresizingMaskIntoConstraints = false;
	self.secureView.delegate = self;
	[self.secureView setHidden:true];
	
	[self addSubview: self.secureView];
	
	[self.secureView.topAnchor constraintEqualToAnchor:self.authorizedButton.bottomAnchor constant:67.0].active = YES;
	[self.secureView.widthAnchor constraintEqualToConstant: 236.0].active = YES;
	[self.secureView.centerXAnchor constraintEqualToAnchor: self.centerXAnchor].active = YES;
	[self.secureView.bottomAnchor constraintEqualToAnchor: self.safeAreaLayoutGuide.bottomAnchor constant: -50].active = YES;
}

- (void) setIsHidden:(BOOL) isHidden {
	[self.loginTextField setEnabled:isHidden];
	[self.passwordTextField setEnabled:isHidden];
	[self.authorizedButton setEnabled:isHidden];
	[self.secureView setHidden:isHidden];
	self.loginTextField.alpha = 0.5;
	self.passwordTextField.alpha = 0.5;
}

- (void) hideKeyboard {
	[self endEditing:YES];
}

- (void) setDefault {
	[self.loginTextField updateState:defaul];
	[self.passwordTextField updateState:defaul];
	self.loginTextField.alpha = 1.0;
	self.passwordTextField.alpha = 1.0;
	self.authorizedButton.alpha = 1.0;
	[self.secureView setDefault];
}

- (void) setTextFieldLayerBorderColor:(UITextField *)textField border:(UIColor *) color {
	textField.layer.borderColor = color.CGColor;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidChange:(UITextField*)textField {
	if (textField == self.loginTextField) {
		if ([self.loginTextField.text isEqualToString:correctLogin]) {
			[self.loginTextField updateState:success];
		}
	}
	
	if (textField == self.passwordTextField) {
		if ([textField.text isEqualToString:correctPassword]) {
			[self.passwordTextField updateState:success];
		}
	}
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if ([string isEqualToString:@""]) {
		return true;
	}
	
	NSString *regex = @"[A-Za-z]+";
	NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	return ([nameTest evaluateWithObject:string]);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	if (textField == self.loginTextField) {
		[self.loginTextField updateState:defaul];
	}
	
	if (textField == self.passwordTextField) {
		[self.passwordTextField updateState:defaul];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
		if ([textField isEqual:self.loginTextField]) {
			[self.passwordTextField becomeFirstResponder];
		} else {
			[textField resignFirstResponder];
		}
	return YES;
}

#pragma mark - SecureViewDelegate
- (void)success {
	[self.delegate success];
}

#pragma mark - CustomButtonDelegate
- (void)didButtonTapped:(UIButton *)sender {
	
	BOOL isLoginCorrect = [self.loginTextField.text isEqualToString:correctLogin] ;
	BOOL isPasswordCorrect = [self.passwordTextField.text isEqualToString:correctPassword];
	
	if (isLoginCorrect) {
		[self.loginTextField updateState:success];
	} else {
		[self.loginTextField updateState:error];
	}
	
	if (isPasswordCorrect) {
		[self.passwordTextField updateState:success];
	} else {
		[self.passwordTextField updateState:error];
	}
	
	if (isLoginCorrect && isPasswordCorrect) {
		[self.loginTextField updateState:success];
		[self.passwordTextField updateState:success];
		[self setIsHidden:false];
		self.authorizedButton.alpha = 0.5;
	}
}



@end
