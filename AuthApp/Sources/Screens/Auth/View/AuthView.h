//
//  AuthView.h
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import <UIKit/UIKit.h>
#import "SecureView.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark Procotol
@protocol AuthViewDelegate <NSObject>
- (void) success;
@end

@interface AuthView : UIView

#pragma mark Property
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *loginTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *authorizedButton;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) SecureView *secureView;
@property (nonatomic, strong) UIView *textFieldView;
@property (nonatomic, weak) id<AuthViewDelegate> delegate;

#pragma mark Method
- (void) setIsHidden:(BOOL) isHidden;
- (void) setDefault;

@end

NS_ASSUME_NONNULL_END
