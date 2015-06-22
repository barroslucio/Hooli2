//
//  HOOPerfilProfissionalViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface HOOPerfilProfissionalViewController : UIViewController



@property (strong, nonatomic) IBOutlet UIView *subviewEmail;
@property (strong, nonatomic) IBOutlet UIView *subviewTelefone;
@property (strong, nonatomic) IBOutlet UIView *subviewEstado;
@property (strong, nonatomic) IBOutlet UIView *subviewCidade;
@property (strong, nonatomic) IBOutlet UIView *subviewEndereco;
@property (strong, nonatomic) IBOutlet UIView *subviewAlvenaria;
@property (strong, nonatomic) IBOutlet UIView *subviewChaveiro;
@property (strong, nonatomic) IBOutlet UIView *subviewEletrica;
@property (strong, nonatomic) IBOutlet UIView *subviewHidraulica;
@property (strong, nonatomic) IBOutlet UIView *subviewLimpeza;
@property (strong, nonatomic) IBOutlet UIView *subviewPintura;
@property (strong, nonatomic) IBOutlet UIView *subviewDDD;
@property (strong, nonatomic) IBOutlet UISwitch *swAlvenaria;
@property (strong, nonatomic) IBOutlet UISwitch *swEletrica;
@property (strong, nonatomic) IBOutlet UISwitch *swChaveiro;
@property (strong, nonatomic) IBOutlet UISwitch *swHidraulica;
@property (strong, nonatomic) IBOutlet UISwitch *swLimpeza;
@property (strong, nonatomic) IBOutlet UISwitch *swPintura;

@end
