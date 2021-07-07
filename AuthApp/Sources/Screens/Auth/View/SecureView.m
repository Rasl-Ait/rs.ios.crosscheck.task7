//
//  SecureView.m
//  AuthApp
//
//  Created by rasul on 7/5/21.
//

#import "SecureView.h"
#import "UIColor+Extension.h"
#import "CustomButton.h"

typedef enum {
	success,
	ready,
	error
} SecureType;

@interface SecureView () <CustomButtonDelegate>

#pragma mark Property

@property (nonatomic, strong) NSMutableString *resultString;
@property (nonatomic) SecureType secureType;

@end

@implementation SecureView

- (instancetype)init {
	self = [super init];
	if (self) {
		[self setupLabel];
		[self setupSecureView];
		
		self.layer.cornerRadius = 10.0;
		self.layer.masksToBounds = true;
		self.backgroundColor = UIColor.whiteColor;
		
		self.resultString = [[NSMutableString alloc] init];
		self.secureType = ready;
	}
	return self;
}

- (void) setupLabel {
	self.secureCodeLabel = [[UILabel alloc] init];
	self.secureCodeLabel.translatesAutoresizingMaskIntoConstraints = false;
	self.secureCodeLabel.text = @"_";
	self.secureCodeLabel.backgroundColor = UIColor.whiteColor;
	self.secureCodeLabel.textColor = UIColor.blackColor;
	self.secureCodeLabel.textAlignment = NSTextAlignmentCenter;
	self.secureCodeLabel.font = [UIFont fontWithName:@"SF Pro Text Semibold"
																							size: 18.0f];
}

- (void) setupSecureView {
	UIStackView *secureButtonStack = [[UIStackView alloc] init];
	secureButtonStack.translatesAutoresizingMaskIntoConstraints = NO;
	secureButtonStack.axis = UILayoutConstraintAxisHorizontal;
	secureButtonStack.distribution = UIStackViewDistributionFill;
	secureButtonStack.alignment = UIStackViewAlignmentCenter;
	secureButtonStack.spacing = 20;
	
	UIStackView *vStack = [[UIStackView alloc] init];
	vStack.translatesAutoresizingMaskIntoConstraints = NO;
	vStack.axis = UILayoutConstraintAxisVertical;
	vStack.distribution = UIStackViewDistributionFillEqually;
	vStack.alignment = UIStackViewAlignmentCenter;
	vStack.spacing = 5;
	
	for (int i = 1; i < 4; i++) {
		CustomButton *button = [[CustomButton alloc] initWithType:Secure];
		[button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
		button.tag = i;
		button.delegate = self;
		
		[button.heightAnchor constraintEqualToConstant: 50.0].active = YES;
		[button.widthAnchor constraintEqualToConstant: 50.0].active = YES;
		[secureButtonStack addArrangedSubview:button];
		[vStack addArrangedSubview: self.secureCodeLabel];
		[vStack addArrangedSubview: secureButtonStack];
	}
	
	[self addSubview: vStack];
	
	[vStack.topAnchor constraintEqualToAnchor:self.topAnchor constant: 15].active = YES;
	[vStack.bottomAnchor constraintEqualToAnchor: self.bottomAnchor constant:-15].active = YES;
	[vStack.centerXAnchor constraintEqualToAnchor: self.centerXAnchor].active = YES;
}

- (void) setDefault {
	self.secureCodeLabel.text = @"_";
	[self.resultString setString:@""];
	self.secureType = ready;
	self.layer.borderColor = UIColor.clearColor.CGColor;
}

#pragma mark - CustomButtonDelegate
- (void)didButtonTapped:(UIButton *)sender {
	NSInteger index = sender.tag;
	
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
			self.layer.borderColor = [UIColor colorRed].CGColor;;
			self.layer.borderWidth = 2.0;
			self.secureCodeLabel.text = @"_";
			[self.resultString setString:@""];
			break;
		case success:
			self.layer.borderColor = [UIColor colorCreen].CGColor;;
			self.layer.borderWidth = 2.0;
			[self.delegate success];
			break;
		case ready:
			if (self.resultString.length == 1) {
				self.layer.borderColor = [UIColor clearColor].CGColor;
			}
			break;
			
		default:
			break;
	}
}

@end
