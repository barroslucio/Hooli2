//
//  HOOClienteViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOCadastroClienteViewController.h"
#import "HOOAgendarServicoViewController.h"
#import "HOOCadastroProffisionalViewController.h"
#import "HOOLoginViewController.h"


@interface HOOCadastroClienteViewController() <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    UIFloatLabelTextField *estadoTextField;
    UIFloatLabelTextField *cidadeTextField;
    UIFloatLabelTextField *enderecoTextField;
    UIFloatLabelTextField *dddTextField;
    UIFloatLabelTextField *telefoneTextField;
    UIFloatLabelTextField *senhaTextField;
    UIFloatLabelTextField *emailTextField;
}

@end

@implementation HOOCadastroClienteViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    estadoTextField = [UIFloatLabelTextField new];
    [estadoTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    estadoTextField.floatLabelActiveColor = [UIColor orangeColor];
    estadoTextField.placeholder = @"Estado";
    estadoTextField.delegate = self;
    [self.subviewEstado addSubview:estadoTextField];
    
      
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[estadoTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(estadoTextField)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[estadoTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(estadoTextField)]];
    
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
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[emailTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];
    
    
    senhaTextField = [UIFloatLabelTextField new];
    [senhaTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    senhaTextField.floatLabelActiveColor = [UIColor orangeColor];
    senhaTextField.placeholder = @"Senha";
    senhaTextField.delegate = self;
    [self.subviewSenha addSubview:senhaTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[senhaTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(senhaTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[senhaTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(senhaTextField)]];
    
    
    cidadeTextField = [UIFloatLabelTextField new];
    [cidadeTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    cidadeTextField.floatLabelActiveColor = [UIColor orangeColor];
    cidadeTextField.placeholder = @"Cidade";
    //cidadeTextField.borderStyle = UITextBorderStyleNone;
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
    
    dddTextField = [UIFloatLabelTextField new];
    [dddTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    dddTextField.floatLabelActiveColor = [UIColor orangeColor];
    dddTextField.placeholder = @"DDD";
    dddTextField.delegate = self;
    [self.subviewDDD addSubview:dddTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[dddTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(dddTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[dddTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(dddTextField)]];
    
    enderecoTextField = [UIFloatLabelTextField new];
    [enderecoTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    enderecoTextField.floatLabelActiveColor = [UIColor orangeColor];
    enderecoTextField.placeholder = @"Endereço";
    enderecoTextField.delegate = self;
    [self.subviewEndereco  addSubview:enderecoTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[enderecoTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(enderecoTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[enderecoTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(enderecoTextField)]];
    
    telefoneTextField = [UIFloatLabelTextField new];
    [telefoneTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    telefoneTextField.floatLabelActiveColor = [UIColor orangeColor];
    telefoneTextField.placeholder = @"Telefone";
    telefoneTextField.delegate = self;
    [self.subviewTelefone addSubview:telefoneTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[telefoneTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(telefoneTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[telefoneTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(telefoneTextField)]];
    
  

    
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    estadoTextField.inputView = self.pickerView;
    
    self.arrayUF = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

//PIKER VIEW - ESTADOS
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.arrayUF count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    estadoTextField.text = @"Acre" ;
    return [self.arrayUF objectAtIndex:row];
    
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    estadoTextField.text=[self.arrayUF objectAtIndex:row];
}


// procedimento para o teclado ser ocultado
- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    [emailTextField resignFirstResponder];
    [senhaTextField resignFirstResponder];
    [telefoneTextField resignFirstResponder];
    [cidadeTextField resignFirstResponder];
    [estadoTextField resignFirstResponder];
    [enderecoTextField resignFirstResponder];
    [dddTextField resignFirstResponder];

}



- (void)cadastraCliente{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *telefone = [formatter numberFromString:telefoneTextField.text];
    NSNumber *ddd = [formatter numberFromString:dddTextField.text];
    NSNumber *tipo = [NSNumber numberWithInt:0];;
    
    PFUser *user = [PFUser user];
    user.username = emailTextField.text;
    user.password = senhaTextField.text;


    user[@"endereco"] = enderecoTextField.text;
    user[@"email"]=emailTextField.text;
    user[@"estado"] = estadoTextField.text;
    user[@"cidade"] = cidadeTextField.text;
    user[@"ddd"] = ddd;
    user[@"telefone"] = telefone;
    user[@"tipo"] = tipo;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Cadastro bem sucedido"
                                                                message:@"Obrigado!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alertView show];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HOOAgendarServicoViewController *viewController = (HOOAgendarServicoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"User"];
            [self presentViewController:viewController animated:YES completion:nil];
        }
        
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                message:[error.userInfo objectForKey:@"error"]
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];

        }
    }];
}

// salvando os dados dos clientes
- (IBAction)salvar:(id)sender
{
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![dddTextField.text isEqualToString:@""] && ![emailTextField.text isEqualToString:@""] && ![senhaTextField.text isEqualToString:@""]  && ![cidadeTextField.text isEqualToString:@""] && ![estadoTextField.text isEqualToString:@""] && ![telefoneTextField.text isEqualToString:@""] && ![enderecoTextField.text isEqualToString:@""])
    {
        //Método para salvar no Parse.com
        [self cadastraCliente];
    }

    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                            message:@"Preencha todos os campos"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}



@end
