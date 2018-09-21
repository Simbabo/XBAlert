//
//  XBAlert.m
//  XBAlert
//
//  Created by 许鑫博 on 2018/9/20.
//  Copyright © 2018年 XXB. All rights reserved.
//

#import "XBAlert.h"

@implementation XBAlert

+(void)alertMesasge:(NSString *)message
     confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandle
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmActionHandle];
    [alertController addAction:confirmAction];
    [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}

+(void)alertOneConfirmTitle:(NSString *)title
                    mesasge:(NSString *)message
             preferredStyle:(UIAlertControllerStyle )preferredStyle
             confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandler
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmActionHandler];
    [alertController addAction:confirmAction];
    [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}

+(void)alertTwoBtnTitle:(NSString *)title
                mesasge:(NSString *)message
         preferredStyle:(UIAlertControllerStyle )preferredStyle
         confirmHandler:(void(^)(UIAlertAction *action))confirmHandler
          cancleHandler:(void(^)(UIAlertAction *))cancleHandler
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:confirmHandler];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleHandler];
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}

+(void)alertTwoBtnTitle:(NSString *)title
                mesasge:(NSString *)message
           one_btnTitle:(NSString *)one_btnTitle
           two_btnTitle:(NSString *)two_btnTitle
         preferredStyle:(UIAlertControllerStyle )preferredStyle
         one_btnHandler:(void(^)(UIAlertAction *action))one_btnHandler
         two_btnHandler:(void(^)(UIAlertAction *action))two_btnHandler
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *one_btnAction=[UIAlertAction actionWithTitle:one_btnTitle style:UIAlertActionStyleDefault handler:one_btnHandler];
    UIAlertAction *two_btnAction = [UIAlertAction actionWithTitle:two_btnTitle style:UIAlertActionStyleDefault handler:two_btnHandler];
    [alertController addAction:one_btnAction];
    [alertController addAction:two_btnAction];
    [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}

+(void)alertHaveTextFieldTitle:(NSString *)title
                       mesasge:(NSString *)message
                preferredStyle:(UIAlertControllerStyle)preferredStyle
                confirmHandler:(void(^)(UIAlertAction *alert,UITextField *textField))confirmHandler
                 cancleHandler:(void(^)(UIAlertAction *action))cancleHandler
                   placeholder:(NSString *)placeholde
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholde;
        textField.secureTextEntry = NO;
    }];
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        confirmHandler(action,alertController.textFields.firstObject);
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancleHandler];
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    [[self getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 私有方法->
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return [self p_nextTopForViewController:result];
}


+ (UIViewController *)p_nextTopForViewController:(UIViewController *)inViewController {
    while (inViewController.presentedViewController) {
        inViewController = inViewController.presentedViewController;
    }
    if ([inViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedVC = [self p_nextTopForViewController:((UITabBarController *)inViewController).selectedViewController];
        return selectedVC;
    } else if ([inViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *selectedVC = [self p_nextTopForViewController:((UINavigationController *)inViewController).visibleViewController];
        return selectedVC;
    } else {
        return inViewController;
    }
}

@end
