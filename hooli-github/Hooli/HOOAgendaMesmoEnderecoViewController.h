//
//  HOOAgendaMesmoEnderecoViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"

@interface HOOAgendaMesmoEnderecoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *servico;
@property (strong, nonatomic) IBOutlet UIView *subviewData;

@property (weak, nonatomic) IBOutlet UITextView *descricaoField;

- (IBAction)agendaServico:(id)sender;

@property (retain, nonatomic)  UIDatePicker *pickerDate;

@property (nonatomic) NSString *data;
@property (nonatomic) int tipoDeServico;

@end
