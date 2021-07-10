//
//  CustomButton.m
//  AuthApp
//
//  Created by rasul on 7/6/21.
//

#import "CustomButton.h"
#import "UIColor+Extension.h"

@implementation CustomButton

- (void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
	
	if (highlighted) {
		self.backgroundColor = [UIColor colorBlue:0.2];
	} else {
		self.backgroundColor = [UIColor clearColor];
	}
}

- (instancetype)init
{
	self = [super init];
	if (self) {
	}
	return self;
}

- (id)initWithType:(CustomButtonType)btnType {
	self = [super init];
	if(self ) {
		[self setup:btnType];
	}
	return self;
}

- (void) setup:(CustomButtonType)btnType {
	switch (btnType) {
		case Authorize:
			[self setupAthorizedButton];
			break;
		case Secure:
			[self setupSecureButton];
			break;
	}
}

- (void) setupAthorizedButton {
	[self setTitle:@"Authorize" forState:UIControlStateNormal];
	self.translatesAutoresizingMaskIntoConstraints = false;
	[self setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
	[self setImage:[UIImage imageNamed:@"user-filled"] forState:UIControlStateHighlighted];
	[self setImage:[UIImage imageNamed:@"user"] forState:UIControlStateDisabled];
	
	self.titleLabel.font = [UIFont fontWithName:@"SF Pro Text Semibold"
																				 size: 20.0f];
	[self setTitleColor: [UIColor colorBlue:1.0]
						 forState: UIControlStateNormal];
	
	
	[self setTitleColor: [UIColor colorBlue:0.5]
						 forState: UIControlStateDisabled];
	
	[self setTitleColor: [UIColor colorBlue:0.4]
						 forState: UIControlStateHighlighted];
	
	
	self.layer.borderColor = [UIColor colorBlue:1.0].CGColor;
	
	self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
	self.layer.borderWidth = 2.0;
	self.layer.cornerRadius = 10.0;
	self.layer.masksToBounds = true;
	
	[self addTarget:self
					 action:@selector(authorizedButtonTapped:)
 forControlEvents:UIControlEventTouchUpInside];
}

- (void) setupSecureButton {
	self.translatesAutoresizingMaskIntoConstraints = false;
	self.titleLabel.font = [UIFont fontWithName:@"SF Pro Text Semibold"
																					 size: 24.0f];
	[self setTitleColor: [UIColor colorBlue:1.0]
							 forState: UIControlStateNormal];
	
	[self setTitleColor: [UIColor colorBlue:1.0]
							 forState: UIControlStateHighlighted];
	
	
	self.layer.borderColor = [UIColor colorBlue:1.0].CGColor;
	
	self.layer.borderWidth = 1.5;
	self.layer.cornerRadius = 25.0;
	self.layer.masksToBounds = true;

	[self addTarget:self
						 action:@selector(secureButtonTapped:)
	 forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark Action
- (void) authorizedButtonTapped: (UIButton *) sender {
	[self.delegate didButtonTapped:sender];
}

- (void) secureButtonTapped: (UIButton *) sender {
	[self.delegate didButtonTapped: sender];
}

@end
