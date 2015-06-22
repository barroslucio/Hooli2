//
//  HOOAgendaOutroEnderecoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendaOutroEnderecoViewController.h"
#import "HOOHistoricoClienteViewController.h"
@interface HOOAgendaOutroEnderecoViewController ()<UITextFieldDelegate, UITextViewDelegate>
{
    NSString *strDate;
    NSString *strInvertedDate;
    NSString *strTime;
    NSString *strComb;
    NSString *tipoServico;
}
@end

@implementation HOOAgendaOutroEnderecoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    NSLog(@"%d",self.tipoDeServico);
    
    self.textFieldDate.delegate = self;
    self.textFieldTime.delegate = self;
    self.enderecoField.delegate = self;
    self.descricaoField.delegate = self;
    
    
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
    self.textFieldDate.inputView = self.pickerDate;
    [self.pickerDate addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    self.pickerTime = [[UIDatePicker alloc] init];
    self.pickerTime.locale = locale;
    self.pickerTime.datePickerMode = UIDatePickerModeTime;
    self.textFieldTime.inputView = self.pickerTime;
    [self.pickerTime addTarget:self action:@selector(timePickerChanged:) forControlEvents:UIControlEventValueChanged];

}

-(void) datePickerChanged: (UIDatePicker *)datePicker{
   
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *invertedDateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    [invertedDateFormatter setDateFormat:@"yyyy-MM-dd"];

    strDate = [dateFormatter stringFromDate:datePicker.date];
    strInvertedDate = [invertedDateFormatter stringFromDate:datePicker.date];
    self.textFieldDate.text = [NSString stringWithFormat:@"Data do serviço: %@",strDate];

    NSLog(@"---date");

}

-(void) timePickerChanged: (UIDatePicker *)datePicker{
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm"];
    strTime = [timeFormatter stringFromDate:datePicker.date];
    
    self.textFieldTime.text = [NSString stringWithFormat:@"Hora do serviço: %@",strTime];

    NSLog(@"---time %@", self.textFieldTime.text);

    
}

-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    [self.textFieldDate resignFirstResponder];
    [self.textFieldTime resignFirstResponder];
    [self.enderecoField resignFirstResponder];
    [self.descricaoField resignFirstResponder];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)combina{
    
    NSLog(@" \ndate : %@ \ntime : %@\n \ninverted date : %@\n",strDate,strTime, strInvertedDate);
}

- (IBAction)agendaServico:(id)sender {
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.descricaoField.text isEqualToString:@""] && ![self.textFieldDate.text isEqualToString:@""] && ![self.textFieldTime.text isEqualToString:@""] && ![self.enderecoField.text isEqualToString:@""])
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
                [self combina];
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


- (void)segueViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HOOHistoricoClienteViewController *viewController = (HOOHistoricoClienteViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HistoricoCliente"];
    [self presentViewController:viewController animated:YES completion:nil];
    
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self animate:YES];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self animate:NO];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animate:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animate:NO];
}

- (void) animate: (BOOL)up {
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
