//
//  HOOAgendaMesmoEnderecoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendaMesmoEnderecoViewController.h"
#import "HOOHistoricoClienteViewController.h"
@interface HOOAgendaMesmoEnderecoViewController ()<UITextFieldDelegate, UITextViewDelegate>
{
    NSString *strDate;
    NSString *strInvertedDate;
    NSString *strComb;
    NSString *tipoServico;
    UIFloatLabelTextField *dataTextField;
}

@end

@implementation HOOAgendaMesmoEnderecoViewController

- (void)viewDidLoad {

    NSLog(@"%d", self.tipoDeServico);
    
    if (self.tipoDeServico == 1){
        [self.servico setText:@"Tipo de serviço: Alvenaria"];
        tipoServico = @"Alvenaria";
    }
    else if (self.tipoDeServico == 2){
        [self.servico setText:@"Tipo de serviço: Chaveiro"];
        tipoServico = @"Chaveiro";
    }
    else if (self.tipoDeServico == 3){
        [self.servico setText:@"Tipo de serviço: Elétrica"];
        tipoServico = @"Elétrica";
    }
    else if (self.tipoDeServico == 4){
        [self.servico setText:@"Tipo de serviço: Hidráulica"];
        tipoServico = @"Hidráulica";
        
    }
    else if (self.tipoDeServico == 5){
        [self.servico setText:@"Tipo de serviço: Limpeza"];
        tipoServico = @"Limpeza";
        
    }
    else if (self.tipoDeServico == 6){
        [self.servico setText:@"Tipo de serviço: Pintura"];
        tipoServico = @"Pintura";
        
    }
    
    
    self.descricaoField.delegate = self;
    
    dataTextField = [UIFloatLabelTextField new];
    [dataTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    dataTextField.floatLabelActiveColor = [UIColor orangeColor];
    dataTextField.placeholder = @"Data do serviço";
    dataTextField.delegate = self;
    [self.subviewData addSubview:dataTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[dataTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(dataTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[dataTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(dataTextField)]];
    
    
    //OCULTA TECLADO
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    
    
    [self initPikers];
    
    
    
}

- (void)initPikers{
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
    
    self.pickerDate = [[UIDatePicker alloc] init];
    self.pickerDate.minimumDate = [NSDate date];
    self.pickerDate.datePickerMode = YES;
    self.pickerDate.date = [NSDate date];
    self.pickerDate.locale = locale;
    self.pickerDate.minuteInterval = 1;
    dataTextField.inputView = self.pickerDate;
    [self.pickerDate addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    

    
}

-(void) datePickerChanged: (UIDatePicker *)datePicker{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *invertedDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    [invertedDateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    strDate = [dateFormatter stringFromDate:datePicker.date];
    strInvertedDate = [invertedDateFormatter stringFromDate:datePicker.date];
    dataTextField.text = [NSString stringWithFormat:@"%@",strDate];
    
    
}


-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    [dataTextField resignFirstResponder];
    [self.descricaoField resignFirstResponder];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





- (IBAction)agendaServico:(id)sender {
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.descricaoField.text isEqualToString:@""]  && ![dataTextField.text isEqualToString:@""])
    {
        PFUser *user = [PFUser currentUser];
    
        PFObject *servico = [PFObject objectWithClassName:@"Servico"];
        [servico setObject:[PFUser currentUser] forKey:@"User"];
        servico[@"endereco"] = [user objectForKey:@"endereco"];
        servico[@"descricao"] = self.descricaoField.text;
        servico[@"dataServico"] = strInvertedDate;
        servico[@"tipo"] = tipoServico;
    
    
        [servico saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Agendamento bem sucedido"
                                                                message:@"Obrigado!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [self segueViewController];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Erro"
                                                                message:@"Tente novamente"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];        }
    }];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Erro"
                                                            message:@"Preencha todos os campos!"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    

}

- (void)segueViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HOOHistoricoClienteViewController *viewController = (HOOHistoricoClienteViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HistoricoCliente"];
    [self presentViewController:viewController animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
