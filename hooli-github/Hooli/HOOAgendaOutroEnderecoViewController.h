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
#import "HOOAlertControllerStyle.h"

@interface HOOAgendaOutroEnderecoViewController : UIViewController

@property (retain, nonatomic)  UIDatePicker *pickerDate;
@property (retain, nonatomic)  UIDatePicker *pickerTime;

@property (nonatomic) NSString *hora;
@property (nonatomic) NSString *data;
@property (nonatomic) int tipoDeServico;

@property (strong, nonatomic) IBOutlet UILabel *servico;

@property (strong, nonatomic) IBOutlet UITextView *descricaoField;

@property (strong, nonatomic) IBOutlet UITextField *enderecoField;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;


- (IBAction)agendaServico:(id)sender;
- (IBAction)voltar:(id)sender;

@end
