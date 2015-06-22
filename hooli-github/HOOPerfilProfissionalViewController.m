//
//  HOOPerfilProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilProfissionalViewController.h"
#import "UIFloatLabelTextField.h"

@interface HOOPerfilProfissionalViewController ()<UITextFieldDelegate>
{
    UIFloatLabelTextField *estadoTextField;
    UIFloatLabelTextField *cidadeTextField;
    UIFloatLabelTextField *enderecoTextField;
    UIFloatLabelTextField *dddTextField;
    UIFloatLabelTextField *telefoneTextField;
    UIFloatLabelTextField *emailTextField;
}
@end

@implementation HOOPerfilProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    emailTextField = [UIFloatLabelTextField new];
    [emailTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    emailTextField.floatLabelActiveColor = [UIColor orangeColor];
    emailTextField.placeholder = @"Email";
    emailTextField.delegate = self;
    [self.subviewEmail addSubview:emailTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[emailTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[emailTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];
    
    estadoTextField = [UIFloatLabelTextField new];
    [estadoTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    estadoTextField.floatLabelActiveColor = [UIColor orangeColor];
    estadoTextField.placeholder = @"Email";
    estadoTextField.delegate = self;
    [self.subviewEstado addSubview:estadoTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[estadoTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(estadoTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[estadoTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(estadoTextField)]];
    
    cidadeTextField = [UIFloatLabelTextField new];
    [cidadeTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    cidadeTextField.floatLabelActiveColor = [UIColor orangeColor];
    cidadeTextField.placeholder = @"Email";
    cidadeTextField.delegate = self;
    [self.subviewCidade addSubview:cidadeTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cidadeTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(cidadeTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cidadeTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(cidadeTextField)]];
    
    enderecoTextField = [UIFloatLabelTextField new];
    [enderecoTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    enderecoTextField.floatLabelActiveColor = [UIColor orangeColor];
    enderecoTextField.placeholder = @"Email";
    enderecoTextField.delegate = self;
    [self.subviewEndereco addSubview:enderecoTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[enderecoTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(enderecoTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[enderecoTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(enderecoTextField)]];
    PFUser *user = [PFUser currentUser];
    emailTextField.text = [user objectForKey:@"email"];
    estadoTextField.text = [user objectForKey:@"estado"];
    cidadeTextField.text = [user objectForKey:@"cidade"];
    enderecoTextField.text = [user objectForKey:@"endereco"];


    [self requisicaoServicos];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// procedimento para pegar as informações do cliente no parse
- (void)buscaDadosProfissionalParse
{
    // variável para pegar as informações
    
    
    

   }

// método para pegar os trabalhos do profissional, direto do Parse
- (void)requisicaoServicos
{
    PFUser *user = [PFUser currentUser];
    

    
    // comparação para ver quais os trabalhos desempenhados pelo profissional
    if ([user[@"alvenaria"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swAlvenaria.on = YES;
    }
    else
    {
        self.swAlvenaria.on = NO;
    }
    
    if ([user[@"chaveiro"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swChaveiro.on = YES;
    }
    else
    {
        self.swChaveiro.on = NO;
    }
    
    if ([user[@"eletrica"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swEletrica.on = YES;
    }
    else
    {
        self.swEletrica.on = NO;
    }
    
    if ([user[@"hidraulica"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swHidraulica.on = YES;
    }
    else
    {
        self.swHidraulica.on = NO;
    }
    
    if ([user[@"limpeza"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swLimpeza.on = YES;
    }
    else
    {
        self.swLimpeza.on = NO;
    }
    
    if ([user[@"pintura"] isEqual:[NSNumber numberWithBool:YES]])
    {
        self.swPintura.on = YES;
    }
    else
    {
        self.swPintura.on = NO;
    }




    
    
    
    
}

@end
