//
//  CustomTextField.h
//  AuthApp
//
//  Created by rasul on 7/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTextField : UITextField

typedef enum {
	success,
	defaul,
	error
} State;

#pragma mark Property
@property (nonatomic) State stateField;

#pragma mark Method
- (void)updateState:(State)stateField;

@end

NS_ASSUME_NONNULL_END
