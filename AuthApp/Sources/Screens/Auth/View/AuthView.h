//
//  AuthView.h
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import <UIKit/UIKit.h>
#import "SecureView.h"
#import "CustomButton.h"
#import "CustomTextField.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark Procotol
@protocol AuthViewDelegate <NSObject>
- (void) success;
@end

@interface AuthView : UIView

#pragma mark Property
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) CustomTextField *loginTextField;
@property (nonatomic, strong) CustomTextField *passwordTextField;
@property (nonatomic, strong) CustomButton *authorizedButton;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) SecureView *secureView;
@property (nonatomic, weak) id<AuthViewDelegate> delegate;

#pragma mark Method
- (void) setIsHidden:(BOOL) isHidden;
- (void) setDefault;

@end

NS_ASSUME_NONNULL_END
