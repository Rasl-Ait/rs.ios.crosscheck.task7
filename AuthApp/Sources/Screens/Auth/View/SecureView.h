//
//  SecureView.h
//  AuthApp
//
//  Created by rasul on 7/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark Procotol
@protocol SecureViewDelegate <NSObject>
-(void) success;
@end

@interface SecureView : UIView

#pragma mark Property
@property (nonatomic, strong) UILabel *secureCodeLabel;
@property (nonatomic, weak) id<SecureViewDelegate> delegate;

#pragma mark Method

- (void) setDefault;

@end

NS_ASSUME_NONNULL_END
