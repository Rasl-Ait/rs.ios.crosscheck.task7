//
//  AuthView.m
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import "AuthView.h"
#import "UIColor+Extension.h"
#import "SecureView.h"

@interface AuthView () <UITextFieldDelegate, SecureViewDelegate>

@end

@implementation AuthView

- (instancetype)init {
	self = [super init];
	if (self) {
		[self setupLabel];
		[self setupTextField];
		[self setupStackView];
		[self setupTextFiedVIew];
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
	self.loginTextField = [[UITextField alloc] init];
	self.loginTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.loginTextField.placeholder = @"Login";
	self.loginTextField.font = [UIFont fontWithName:@"SF Pro Display Regular"
																						 size:15.0f];
	self.loginTextField.layer.borderColor = [UIColor colorBlackColar].CGColor;
	self.loginTextField.layer.borderWidth = 1.5;
	self.loginTextField.layer.cornerRadius = 5.0;
	self.loginTextField.layer.masksToBounds = true;
	
	self.passwordTextField = [[UITextField alloc] init];
	self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.passwordTextField.placeholder = @"Password";
	[self.passwordTextField setSecureTextEntry:YES];
	self.passwordTextField.font = [UIFont fontWithName:@"SF Pro Display Regular"
																								size:15.0f];
	self.passwordTextField.layer.borderColor = [UIColor colorBlackColar].CGColor;
	self.passwordTextField.layer.borderWidth = 1.5;
	self.passwordTextField.layer.cornerRadius = 5.0;
	self.passwordTextField.layer.masksToBounds = true;
	
	self.loginTextField.delegate = self;
	self.passwordTextField.delegate = self;
	
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
}

- (void) setupTextFiedVIew {
	self.textFieldView = [[UIView alloc] init];
	self.textFieldView.translatesAutoresizingMaskIntoConstraints = false;
	self.textFieldView.backgroundColor = UIColor.whiteColor;
	
	[self.textFieldView addSubview:self.stackView];
	[self addSubview:self.textFieldView];
	
	[self.stackView.topAnchor constraintEqualToAnchor: self.textFieldView.topAnchor].active = YES;
	[self.stackView.leadingAnchor constraintEqualToAnchor:self.textFieldView.leadingAnchor].active = YES;
	[self.stackView.trailingAnchor constraintEqualToAnchor:self.textFieldView.trailingAnchor].active = YES;
	[self.stackView.bottomAnchor constraintEqualToAnchor:self.textFieldView.bottomAnchor].active = YES;

	[self.textFieldView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant: 36.0].active = YES;
	[self.textFieldView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -36.0].active = YES;
}

- (void) setupButton {
	self.authorizedButton = [UIButton buttonWithType:UIButtonTypeCustom];
	self.authorizedButton.translatesAutoresizingMaskIntoConstraints = false;
	[self.authorizedButton setTitle:@"Authorize" forState:UIControlStateNormal];
	
	[self.authorizedButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
	[self.authorizedButton setImage:[UIImage imageNamed:@"user-filled"] forState:UIControlStateHighlighted];
	[self.authorizedButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateDisabled];
	
	self.authorizedButton.titleLabel.font = [UIFont fontWithName:@"SF Pro Text Semibold"
																													size: 20.0f];
	[self.authorizedButton setTitleColor: [UIColor colorBlue:1.0]
															forState: UIControlStateNormal];
	
	
	[self.authorizedButton setTitleColor: [UIColor colorBlue:0.5]
															forState: UIControlStateDisabled];
	
	[self.authorizedButton setTitleColor: [UIColor colorBlue:0.4]
															forState: UIControlStateHighlighted];
	
	
	self.authorizedButton.layer.borderColor = [UIColor colorBlue:1.0].CGColor;
	
	self.authorizedButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
	self.authorizedButton.layer.borderWidth = 2.0;
	self.authorizedButton.layer.cornerRadius = 10.0;
	self.authorizedButton.layer.masksToBounds = true;
	
	[self.authorizedButton addTarget:self
														action:@selector(authorizedButtonTapped:)
									forControlEvents:UIControlEventTouchUpInside];
	
	[self.authorizedButton addTarget:self
														action:@selector(authorizedButtonPressed:)
									forControlEvents:UIControlEventTouchDown];
	
	[self addSubview:self.authorizedButton];
	
	[self.authorizedButton.topAnchor constraintEqualToAnchor: self.textFieldView.bottomAnchor constant: 60].active = YES;
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
	self.textFieldView.alpha = 0.5;
}

- (void) hideKeyboard {
	[self endEditing:YES];
}

- (void) setDefault {
	self.passwordTextField.text = @"";
	self.loginTextField.text = @"";
	self.textFieldView.alpha = 1.0;
	self.authorizedButton.alpha = 1.0;
	[self.secureView setDefault];
	
	[self setTextFieldLayerBorderColor:self.loginTextField border:[UIColor colorBlackColar]];
	[self setTextFieldLayerBorderColor:self.passwordTextField border:[UIColor colorBlackColar]];
}

- (void) setButtonColor:(UIButton *) button bgColor:(UIColor *)color {
	button.backgroundColor = color;
}

- (void) setTextFieldLayerBorderColor:(UITextField *)textField border:(UIColor *) color {
	textField.layer.borderColor = color.CGColor;
}

#pragma mark Actions
- (void) authorizedButtonPressed: (UIButton *) sender {
	[self setButtonColor:sender bgColor:[UIColor colorBlue:0.2]];
}

- (void) authorizedButtonTapped: (UIButton *) sender {
	[self setButtonColor:sender bgColor:[UIColor whiteColor]];
	
	if (![self.loginTextField.text isEqualToString:@"username"] && ![self.passwordTextField.text isEqualToString:@"password"]) {
		self.loginTextField.layer.borderColor = [UIColor colorRed].CGColor;
		
		self.passwordTextField.layer.borderColor = [UIColor colorRed].CGColor;
		
	} else if (![self.loginTextField.text isEqualToString:@"username"]) {
		[self setTextFieldLayerBorderColor:self.loginTextField border:[UIColor redColor]];
	} else if (![self.passwordTextField.text isEqualToString:@"password"]) {
			[self setTextFieldLayerBorderColor:self.passwordTextField border:[UIColor redColor]];
	} else {
		[self setTextFieldLayerBorderColor:self.loginTextField border:[UIColor colorCreen]];
		[self setTextFieldLayerBorderColor:self.passwordTextField border:[UIColor colorCreen]];
		
		[self setIsHidden:false];
		self.authorizedButton.alpha = 0.5;
	}
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	if (textField == self.loginTextField) {
		[self setTextFieldLayerBorderColor:textField border:[UIColor colorBlackColar]];
	}
	
	if (textField == self.passwordTextField) {
		[self setTextFieldLayerBorderColor:textField border:[UIColor colorBlackColar]];
	}
	
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	//	if ([textField isEqual:self.loginTextField]) {
	//		[self.passwordTextField becomeFirstResponder];
	//	}
	//
	//	else {
	//		[textField resignFirstResponder];
	//	}
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - SecureViewDelegate
- (void)success {
	[self.delegate success];
}



@end
