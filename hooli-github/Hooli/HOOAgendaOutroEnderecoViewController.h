//
//  HOOAgendaOutroEnderecoViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"

@interface HOOAgendaOutroEnderecoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *servico;


@property (retain, nonatomic)  UIDatePicker *pickerDate;
@property (retain, nonatomic)  UIDatePicker *pickerTime;


@property (nonatomic) NSString *hora;
@property (nonatomic) NSString *data;
@property (nonatomic) int tipoDeServico;
- (IBAction)voltar:(id)sender;


@property (strong, nonatomic) IBOutlet UITextView *descricaoField;
@property (strong, nonatomic) IBOutlet UITextField *enderecoField;


@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTime;


@property (weak, nonatomic) IBOutlet UIView *subviewEndereco;
@property (weak, nonatomic) IBOutlet UIView *subviewData;


- (IBAction)agendaServico:(id)sender;

@end
