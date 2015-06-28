//
//  HOOClienteViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOAlertControllerStyle.h"
@interface HOOPerfilClienteViewController : UIViewController <UIViewControllerTransitioningDelegate>


@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfEstado;
@property (weak, nonatomic) IBOutlet UITextField *tfCidade;
@property (weak, nonatomic) IBOutlet UITextField *tfEndereco;
@property (weak, nonatomic) IBOutlet UITextField *tfTelefone;


//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

- (IBAction)salvar:(id)sender;

+ (NSArray *)arrayUF;

@end
