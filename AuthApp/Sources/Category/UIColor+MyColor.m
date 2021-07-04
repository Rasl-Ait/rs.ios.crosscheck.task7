//
//  UIColor+MyColor.m
//  AuthApp
//
//  Created by rasul on 7/4/21.
//

#import "UIColor+MyColor.h"

@implementation UIColor (MyColor)


+ (UIColor *) colorRed {
	return [UIColor colorWithRed: 194/255.0
												 green: 3/255.0
													blue: 20/255.0
												 alpha: 1.0];
}

+ (UIColor *) colorBlackColar {
	return [[UIColor alloc] initWithRed:76.0/255.0
																green:92.0/255.0
																 blue:104.0/255.0
																alpha:1.0];
	;
}

+ (UIColor *) colorCreen {
	return [UIColor colorWithRed: 145/255.0
												 green: 198/255.0
													blue: 177/255.0
												 alpha: 1.0];
}

+ (UIColor *) colorBlue:(CGFloat )alpha {
	return  [UIColor colorWithRed: 128/255.0
													green: 164/255.0
																	 blue: 237/255.0
																	alpha: alpha];
}

@end
