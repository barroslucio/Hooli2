//
//  HOOAlertControllerStyle.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAlertControllerStyle.h"
@interface HOOAlertControllerStyle ()

@end

@implementation HOOAlertControllerStyle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIAlertController *)styleSimpleWithTitle:(NSString *)title andWithMessage:(NSString *)message{// andStoryboardWithName:(NSString *)name andInstantiateViewControllerWithIdentifier:(NSString *)identifier andAnimated:(BOOL)animated{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:NO completion:nil];
                             
                         }];
    [alert addAction:ok];

    return alert;
    
}

@end
