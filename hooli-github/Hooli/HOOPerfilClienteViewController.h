//
//  HOOClienteViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"

@interface HOOPerfilClienteViewController : UIViewController <UIViewControllerTransitioningDelegate>


@property (strong, nonatomic) IBOutlet UIView *subviewEstado;
@property (strong, nonatomic) IBOutlet UIView *subviewCidade;
@property (strong, nonatomic) IBOutlet UIView *subviewEndereco;
@property (strong, nonatomic) IBOutlet UIView *subviewDDD;
@property (strong, nonatomic) IBOutlet UIView *subviewTelefone;
@property (strong, nonatomic) IBOutlet UIView *subviewEmail;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

- (IBAction)salvar:(id)sender;

@end
