//
//  CustomTextField.m
//  AuthApp
//
//  Created by rasul on 7/7/21.
//

#import "CustomTextField.h"
#import "UIColor+Extension.h"

@implementation CustomTextField

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setup];
		self.stateField = defaul;
	}
	return self;
}

- (void) setup {
	self.borderStyle = UITextBorderStyleRoundedRect;
	self.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.font = [UIFont fontWithName:@"SF Pro Display Regular"
			size:15.0f];
	self.layer.borderColor = [UIColor colorBlackColar].CGColor;
	self.layer.borderWidth = 1.5;
	self.layer.cornerRadius = 5.0;
	self.layer.masksToBounds = true;
}

- (void)updateState:(State)stateField {
	switch (stateField) {
		case success:
			self.layer.borderColor = [UIColor colorCreen].CGColor;
			break;
		case error:
			self.layer.borderColor = [UIColor colorRed].CGColor;
			break;
		case defaul:
			self.layer.borderColor = [UIColor colorBlackColar].CGColor;
			self.text = nil;
			break;
			
		default:
			break;
	}
	
	self.stateField = stateField;
}

@end
