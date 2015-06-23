//
//  HOOPerfilProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilProfissionalViewController.h"
#import "UIFloatLabelTextField.h"

@interface HOOPerfilProfissionalViewController ()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIFloatLabelTextField *estadoTextField;
    UIFloatLabelTextField *cidadeTextField;
    UIFloatLabelTextField *enderecoTextField;
    UIFloatLabelTextField *dddTextField;
    UIFloatLabelTextField *telefoneTextField;
    UIFloatLabelTextField *emailTextField;
}

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

@end

@implementation HOOPerfilProfissionalViewController

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
    
    
    telefoneTextField = [UIFloatLabelTextField new];
    [telefoneTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    telefoneTextField.floatLabelActiveColor = [UIColor orangeColor];
    telefoneTextField.placeholder = @"Email";
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
    
    
    dddTextField = [UIFloatLabelTextField new];
    [dddTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    dddTextField.floatLabelActiveColor = [UIColor orangeColor];
    dddTextField.placeholder = @"Email";
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

    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    estadoTextField.inputView = self.pickerView;
    
    self.arrayUF = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Distrito Federal", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];

    
    PFUser *user = [PFUser currentUser];
    emailTextField.text = [user objectForKey:@"email"];
    estadoTextField.text = [user objectForKey:@"estado"];
    cidadeTextField.text = [user objectForKey:@"cidade"];
    enderecoTextField.text = [user objectForKey:@"endereco"];
    dddTextField.text = [user[@"ddd"] stringValue];
    telefoneTextField.text = [user[@"telefone"] stringValue];


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

- (void)atualizaCadastroProfissional{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *telefone = [formatter numberFromString:telefoneTextField.text];
    NSNumber *ddd = [formatter numberFromString:dddTextField.text];
    
    
    
    PFUser *user = [PFUser currentUser];
    user.username =emailTextField.text;
    user[@"endereco"] = enderecoTextField.text;
    user[@"email"]= emailTextField.text;
    user[@"estado"] = estadoTextField.text;
    user[@"cidade"] = cidadeTextField.text;
    user[@"ddd"] = ddd;
    user[@"telefone"] = telefone;
    user[@"hidraulica"] =  [NSNumber numberWithBool:self.swHidraulica.on];
    user[@"pintura"] =  [NSNumber numberWithBool:self.swPintura.on];
    user[@"limpeza"] =  [NSNumber numberWithBool:self.swLimpeza.on];
    user[@"eletrica"] =  [NSNumber numberWithBool:self.swEletrica.on];
    user[@"alvenaria"] =  [NSNumber numberWithBool:self.swAlvenaria.on];
    user[@"chaveiro"] =  [NSNumber numberWithBool:self.swChaveiro.on];
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Seus dados foram atualizados."
                                                                message:@"Obrigado!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
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

//ALERTA DO STATUS DE CADASTRO
- (void)alertStatusCadastro:(NSString *)status{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta!" message:status delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    NSLog(@"Cadastro do Profissional recuzado");
    
}


- (IBAction)salvar:(id)sender {
    
    NSString *statusCadastro;
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![emailTextField.text isEqualToString:@""]  && ![enderecoTextField.text isEqualToString:@""] && ![cidadeTextField.text isEqualToString:@""] && ![estadoTextField.text isEqualToString:@""] && ![telefoneTextField.text isEqualToString:@""] && ![dddTextField.text isEqualToString:@""]) {
        
        //VERIFICA SE ALGUMA PROFISSÃO FOI MARCADA
        if (self.swAlvenaria.on == YES || self.swChaveiro.on == YES || self.swEletrica.on == YES || self.swHidraulica.on == YES || self.swLimpeza.on == YES || self.swPintura.on == YES){
            
            [self atualizaCadastroProfissional];
        } else{
            statusCadastro = @"Selecione pelo menos um serviço";
            [self alertStatusCadastro:statusCadastro];
            
        }
        
        
    } else {
        statusCadastro = @"Preencha todos os campos";
        [self alertStatusCadastro:statusCadastro];
    }

}
@end
