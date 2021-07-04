//
//  AuthView.m
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import "AuthView.h"
#import "UIColor+MyColor.h"

typedef enum {
	success,
	ready,
	error
} SecureType;

@interface AuthView () <UITextFieldDelegate>

#pragma mark Property
@property (nonatomic, strong) NSMutableString *resultString;
@property (nonatomic) SecureType secureType;

@end

@implementation AuthView

UIColor *red;
- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setupLabel];
		[self setupTextField];
		[self setupStackView];
		[self setupTextFiedVIew];
		[self setupButton];
		[self setupSecureView];
		
		self.resultString = [[NSMutableString alloc] init];
		self.secureType = ready;
		
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
	
	self.secureCodeLabel = [[UILabel alloc] init];
	self.secureCodeLabel.translatesAutoresizingMaskIntoConstraints = false;
	self.secureCodeLabel.text = @"_";
	self.secureCodeLabel.backgroundColor = UIColor.whiteColor;
	self.secureCodeLabel.textColor = UIColor.blackColor;
	self.secureCodeLabel.textAlignment = NSTextAlignmentCenter;
	self.secureCodeLabel.font = [UIFont fontWithName:@"SF Pro Text Semibold"
																							size: 18.0f];
	
	[self addSubview:self.titleLabel];
	
	[self.secureCodeLabel.heightAnchor constraintEqualToConstant: 20].active = YES;
	
	[self.titleLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:80.0].active = YES;
	[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:36.0].active = YES;
	[self.titleLabel.heightAnchor constraintEqualToConstant:50].active = YES;
	[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -36.0].active = YES;
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
	
	
	self.passwordTextField = [[UITextField alloc] init];
	self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.passwordTextField.placeholder = @"Password";
	[self.passwordTextField setSecureTextEntry:YES];
	self.passwordTextField.font = [UIFont fontWithName:@"SF Pro Display Regular"
																								size:15.0f];
	self.passwordTextField.layer.borderColor = [UIColor colorBlackColar].CGColor;
	self.passwordTextField.layer.borderWidth = 1.5;
	self.passwordTextField.layer.cornerRadius = 5.0;
	
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
	
	[self.textFieldView.topAnchor constraintEqualToAnchor: self.titleLabel.bottomAnchor constant: 40].active = YES;
	[self.textFieldView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:36.0].active = YES;
	[self.textFieldView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -36.0].active = YES;
	[self.textFieldView.heightAnchor constraintEqualToConstant:100].active = YES;
	
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
	
	[self.authorizedButton addTarget:self
														action:@selector(authorizedButtonTapped:)
									forControlEvents:UIControlEventTouchUpInside];
	
	[self.authorizedButton addTarget:self
														action:@selector(authorizedButtonPressed:)
									forControlEvents:UIControlEventTouchDown];
	
	[self addSubview:self.authorizedButton];
	
	[self.authorizedButton.topAnchor constraintEqualToAnchor: self.textFieldView.bottomAnchor constant: 60].active = YES;
	[self.authorizedButton.widthAnchor constraintEqualToConstant: 156.0].active = YES;
	[self.authorizedButton.heightAnchor constraintEqualToConstant: 45.0].active = YES;
	[self.authorizedButton.centerXAnchor constraintEqualToAnchor: self.centerXAnchor].active = YES;
}

- (void) setupSecureView {
	self.secureView = [[UIView alloc] init];
	self.secureView.translatesAutoresizingMaskIntoConstraints = false;
	self.secureView.backgroundColor = UIColor.whiteColor;
	[self.secureView setHidden:true];
	
	self.secureView.layer.cornerRadius = 10.0;
	
	UIStackView *secureButtonStack = [[UIStackView alloc] init];
	secureButtonStack.translatesAutoresizingMaskIntoConstraints = NO;
	secureButtonStack.axis = UILayoutConstraintAxisHorizontal;
	secureButtonStack.distribution = UIStackViewDistributionFillEqually;
	secureButtonStack.alignment = UIStackViewAlignmentCenter;
	secureButtonStack.spacing = 20;
	
	UIStackView *vStack = [[UIStackView alloc] init];
	vStack.translatesAutoresizingMaskIntoConstraints = NO;
	vStack.axis = UILayoutConstraintAxisVertical;
	vStack.distribution = UIStackViewDistributionFillEqually;
	vStack.alignment = UIStackViewAlignmentCenter;
	vStack.spacing = 10;
	
	for (int i = 1; i < 4; i++) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.translatesAutoresizingMaskIntoConstraints = false;
		[button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
		button.titleLabel.font = [UIFont fontWithName:@"SF Pro Text Semibold"
																						 size: 24.0f];
		[button setTitleColor: [UIColor colorBlue:1.0]
								 forState: UIControlStateNormal];
		
		[button setTitleColor: [UIColor colorBlue:1.0]
								 forState: UIControlStateHighlighted];
		
		
		button.layer.borderColor = [UIColor colorBlue:1.0].CGColor;
		
		button.layer.borderWidth = 1.5;
		button.layer.cornerRadius = 25.0;
		button.tag = i;
		[button addTarget:self
							 action:@selector(secureButtonTapped:)
		 forControlEvents:UIControlEventTouchUpInside];
		[button addTarget:self
							 action:@selector(secureButtonPressed:)
		 forControlEvents:UIControlEventTouchDown];
		
		[button.heightAnchor constraintEqualToConstant: 50.0].active = YES;
		[button.widthAnchor constraintEqualToConstant: 50.0].active = YES;
		[secureButtonStack addArrangedSubview:button];
		[vStack addArrangedSubview: self.secureCodeLabel];
		[vStack addArrangedSubview: secureButtonStack];
	}
	
	[self.secureView addSubview:vStack];
	[self addSubview: self.secureView];
	
	[vStack.topAnchor constraintEqualToAnchor:self.secureView.topAnchor constant: 15].active = YES;
	[vStack.bottomAnchor constraintEqualToAnchor: self.secureView.bottomAnchor constant:-15].active = YES;
	[vStack.centerXAnchor constraintEqualToAnchor: self.secureView.centerXAnchor].active = YES;
	
	[self.secureView.widthAnchor constraintEqualToConstant: 240.0].active = YES;
	[self.secureView.heightAnchor constraintEqualToConstant: 140.0].active = YES;
	[self.secureView.centerXAnchor constraintEqualToAnchor: self.centerXAnchor].active = YES;
	[self.secureView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor constant: -50].active = YES;
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
	self.secureCodeLabel.text = @"_";
	[self.resultString setString:@""];
	self.secureType = ready;
	self.textFieldView.alpha = 1.0;
	self.authorizedButton.alpha = 1.0;
	
	self.secureView.layer.borderColor = UIColor.clearColor.CGColor;
	[self setTextFieldLayerBorderColor:self.loginTextField border:[UIColor colorBlackColar]];
	[self setTextFieldLayerBorderColor:self.passwordTextField border:[UIColor colorBlackColar]];
}

- (void) setButtonColor:(UIButton *) button bgColor:(UIColor *)color {
	button.backgroundColor = color;
}

- (void) setTextFieldLayerBorderColor:(UITextField *)textField border:(UIColor *) color {
	textField.layer.borderColor = color.CGColor;
}

#pragma mark Action

- (void) secureButtonPressed: (UIButton *) sender {
	[self setButtonColor:sender bgColor:[UIColor colorBlue:0.2]];
}

- (void) secureButtonTapped: (UIButton *) sender {
	NSInteger index = sender.tag;
	[self setButtonColor:sender bgColor:[UIColor whiteColor]];
	
	if (self.secureType == error) {
		self.secureType = ready;
	}
	
	[self.resultString appendString:[NSString stringWithFormat:@"%ld", (long)index]];
	
	self.secureCodeLabel.text = self.resultString;
	
	if (self.resultString.length == 3) {
		if ([self.resultString isEqualToString: @"132"]) {
			self.secureType = success;
		} else {
			self.secureType = error;
		}
	}
	
	switch (self.secureType) {
		case error:
			self.secureView.layer.borderColor = [UIColor colorRed].CGColor;;
			self.secureView.layer.borderWidth = 2.0;
			self.secureCodeLabel.text = @"_";
			[self.resultString setString:@""];
			break;
		case success:
			self.secureView.layer.borderColor = [UIColor colorCreen].CGColor;;
			self.secureView.layer.borderWidth = 2.0;
			[self.delegate showSuccess];
			break;
		case ready:
			break;
			
		default:
			break;
	}
}

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

@end
