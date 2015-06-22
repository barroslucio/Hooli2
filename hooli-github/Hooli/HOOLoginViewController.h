//
//  ViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"
#import "HOOEscolhaCadastroViewController.h"


@interface HOOLoginViewController : UIViewController <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet UIView *subviewEmail;
@property (strong, nonatomic) IBOutlet UIView *subviewSenha;

- (IBAction)login:(id)sender;
- (IBAction)cadastro:(id)sender;

@end

