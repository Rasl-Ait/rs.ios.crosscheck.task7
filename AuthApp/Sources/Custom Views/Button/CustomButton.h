//
//  CustomButton.h
//  AuthApp
//
//  Created by rasul on 7/6/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, CustomButtonType) {
		
		Authorize = 0,
		Secure
};

#pragma mark Procotol
@protocol CustomButtonDelegate <NSObject>
- (void) didButtonTapped: (UIButton *) sender;
@end

@interface CustomButton : UIButton
@property (nonatomic, weak) id<CustomButtonDelegate> delegate;
@property (nonatomic) CustomButtonType btnType;


-(id)initWithType:(CustomButtonType)btnType;

@end

NS_ASSUME_NONNULL_END
