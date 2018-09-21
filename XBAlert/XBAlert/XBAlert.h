//
//  XBAlert.h
//  XBAlert
//
//  Created by 许鑫博 on 2018/9/20.
//  Copyright © 2018年 XXB. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface XBAlert : NSObject
/*
 *         普通样式
 *    ╭--------------------╮
 *    ¦      温馨提示        ¦
 *    ¦      message       ¦
 *    ----------------------
 *    ¦   确定   |    取消   ¦
 *    --------------------╯
 */
+(void)alertMesasge:(NSString *)message
     confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandle;

/*
 *          没有取消样式
 *    ╭--------------------╮
 *    ¦      温馨提示        ¦
 *    ¦      message       ¦
 *    ----------------------
 *    ¦        确定         ¦
 *    ╰--------------------╯
 */
+(void)alertOneConfirmTitle:(NSString *)title
                    mesasge:(NSString *)message
             preferredStyle:(UIAlertControllerStyle )preferredStyle
             confirmHandler:(void(^)(UIAlertAction *action))confirmActionHandler;

/*
 *          自定义标题
 *    ╭--------------------╮
 *    ¦       title        ¦
 *    ¦      message       ¦
 *    ----------------------
 *    ¦   确定   ¦    取消   ¦
 *    ╰--------------------╯
 */
+(void)alertTwoBtnTitle:(NSString *)title
                mesasge:(NSString *)message
         preferredStyle:(UIAlertControllerStyle )preferredStyle
         confirmHandler:(void(^)(UIAlertAction *action))confirmHandler
          cancleHandler:(void(^)(UIAlertAction *action))cancleHandler;

/*
 *             按钮自定义标题
 *    ╭---------------------------╮
 *    ¦           title           ¦
 *    ¦          message          ¦
 *    -----------------------------
 *    ¦   one_btn   ¦   two_btn   ¦
 *    ╰---------------------------╯
 */
+(void)alertTwoBtnTitle:(NSString *)title
                mesasge:(NSString *)message
           one_btnTitle:(NSString *)one_btnTitle
           two_btnTitle:(NSString *)two_btnTitle
         preferredStyle:(UIAlertControllerStyle )preferredStyle
         one_btnHandler:(void(^)(UIAlertAction *action))one_btnHandler
         two_btnHandler:(void(^)(UIAlertAction *action))two_btnHandler;

/*
 *          带输入框
 *    ╭--------------------╮
 *    ¦       title        ¦
 *    ¦      message       ¦
 *    ¦ ╭-----------------╮¦
 *    ¦ ╰-----------------╯¦
 *    ----------------------
 *    ¦   确定   |    取消   ¦
 *    ╰--------------------╯
 */
+(void)alertHaveTextFieldTitle:(NSString *)title
                       mesasge:(NSString *)message
                preferredStyle:(UIAlertControllerStyle )preferredStyle
                confirmHandler:(void(^)(UIAlertAction *alert,UITextField *textField))confirmHandler cancleHandler:(void(^)(UIAlertAction *action))cancleHandler
                   placeholder:(NSString *)placeholder;
@end
