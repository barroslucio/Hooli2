//
//  HOOCadastroProffisionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//


#import "HOOCadastroProffisionalViewController.h"
#import "HOOServicosDisponiveisViewController.h"
#import "HOOLoginViewController.h"


@interface HOOCadastroProffisionalViewController ()<UIViewControllerTransitioningDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
    UIFloatLabelTextField *estadoTextField;
    UIFloatLabelTextField *cidadeTextField;
    UIFloatLabelTextField *enderecoTextField;
    UIFloatLabelTextField *dddTextField;
    UIFloatLabelTextField *telefoneTextField;
    UIFloatLabelTextField *senhaTextField;
    UIFloatLabelTextField *emailTextField;
    UIFloatLabelTextField *nomeTextField;
    UIFloatLabelTextField *cpfTextField;
    UIFloatLabelTextField *rgTextField;
}

//BUTTON SAVE
- (IBAction)actionSave:(id)sender;


//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//SWITCH
@property (weak, nonatomic) IBOutlet UISwitch *switchAlvenaria;
@property (weak, nonatomic) IBOutlet UISwitch *switchChaveiro;
@property (weak, nonatomic) IBOutlet UISwitch *switchEletrica;
@property (weak, nonatomic) IBOutlet UISwitch *switchHidraulica;
@property (weak, nonatomic) IBOutlet UISwitch *switchLimpeza;
@property (weak, nonatomic) IBOutlet UISwitch *switchPintura;

@end

@implementation HOOCadastroProffisionalViewController


- (IBAction)voltarButton:(id)sender {
    HOOLoginViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
 
}

//OBJETO DE USUÁRIO PROFISSIONAL




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initProperties];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
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
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[estadoTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(estadoTextField)]];
    
    
    nomeTextField = [UIFloatLabelTextField new];
    [nomeTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    nomeTextField.floatLabelActiveColor = [UIColor orangeColor];
    nomeTextField.placeholder = @"Nome Completo";
    
    nomeTextField.delegate = self;
    [self.subviewNome addSubview:nomeTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[nomeTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(nomeTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[nomeTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(nomeTextField)]];
    

    
    rgTextField = [UIFloatLabelTextField new];
    [rgTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    rgTextField.floatLabelActiveColor = [UIColor orangeColor];
    rgTextField.placeholder = @"RG";
    rgTextField.delegate = self;
    [self.subviewRG addSubview:rgTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[rgTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(rgTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rgTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(rgTextField)]];
    
    cpfTextField = [UIFloatLabelTextField new];
    [cpfTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    cpfTextField.floatLabelActiveColor = [UIColor orangeColor];
    cpfTextField.placeholder = @"CPF";
    cpfTextField.delegate = self;
    [self.subviewCPF addSubview:cpfTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cpfTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(cpfTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cpfTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(cpfTextField)]];
    
    senhaTextField = [UIFloatLabelTextField new];
    [senhaTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    senhaTextField.floatLabelActiveColor = [UIColor orangeColor];
    senhaTextField.placeholder = @"Senha";
    //senhaTextField.borderStyle = UITextBorderStyleLine;
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
    //dddTextField.borderStyle = UITextBorderStyleNone;
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
    // enderecoTextField.borderStyle = UITextBorderStyleNone;
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
    
    
}

//OCULTAR TECLADO
-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [emailTextField resignFirstResponder];
    [senhaTextField resignFirstResponder];
    [telefoneTextField resignFirstResponder];
    [cidadeTextField resignFirstResponder];
    [estadoTextField resignFirstResponder];
    [enderecoTextField resignFirstResponder];
    [dddTextField resignFirstResponder];
    [nomeTextField resignFirstResponder];
    [cpfTextField resignFirstResponder];
    [rgTextField resignFirstResponder];

}

//INICIA PROPERTIES
- (void)initProperties{
    
    self.switchAlvenaria.on = NO;
    self.switchChaveiro.on = NO;
    self.switchEletrica.on = NO;
    self.switchHidraulica.on = NO;
    self.switchLimpeza.on = NO;
    self.switchPintura.on = NO;
    


    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    estadoTextField.inputView = self.pickerView;
    
    self.arrayUF = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Distrito Federal", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
        estadoTextField.text=[self.arrayUF objectAtIndex:row];
}


//ALERTA DO STATUS DE CADASTRO
- (void)alertStatusCadastro:(NSString *)status{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta!" message:status delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    NSLog(@"Cadastro do Profissional recuzado");

}

- (void)cadastraProfissionalParse{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *telefone = [formatter numberFromString:telefoneTextField.text];
    NSNumber *ddd = [formatter numberFromString:dddTextField.text];
    NSNumber *cpf = [formatter numberFromString:cpfTextField.text];
    NSNumber *rg = [formatter numberFromString:rgTextField.text];

    NSNumber *tipo = [NSNumber numberWithInt:1];;
    
    
    PFUser *user = [PFUser user];
    user.username =emailTextField.text;
    user.password = senhaTextField.text;
    
    user[@"endereco"] = enderecoTextField.text;
    user[@"email"]= emailTextField.text;
    user[@"estado"] = estadoTextField.text;
    user[@"cidade"] = cidadeTextField.text;
    user[@"ddd"] = ddd;
    user[@"telefone"] = telefone;
    user[@"cpf"] = cpf;
    user[@"rg"] = rg;
    user[@"nome"] = nomeTextField.text;
    user[@"tipo"] =  tipo;
    user[@"hidraulica"] =  [NSNumber numberWithBool:self.switchHidraulica.on];
    user[@"pintura"] =  [NSNumber numberWithBool:self.switchPintura.on];
    user[@"limpeza"] =  [NSNumber numberWithBool:self.switchLimpeza.on];
    user[@"eletrica"] =  [NSNumber numberWithBool:self.switchEletrica.on];
    user[@"alvenaria"] =  [NSNumber numberWithBool:self.switchAlvenaria.on];
    user[@"chaveiro"] =  [NSNumber numberWithBool:self.switchChaveiro.on];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Cadastro bem sucedido"
                                                                message:@"Obrigado!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            [self segueViewController];
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


//ACTION - SALVAR DADOS
- (IBAction)actionSave:(id)sender {

    NSString *statusCadastro;
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![nomeTextField.text isEqualToString:@""] && ![emailTextField.text isEqualToString:@""] && ![senhaTextField.text isEqualToString:@""] && ![enderecoTextField.text isEqualToString:@""] && ![cidadeTextField.text isEqualToString:@""] && ![estadoTextField.text isEqualToString:@""] && ![telefoneTextField.text isEqualToString:@""] && ![rgTextField.text isEqualToString:@""] && ![cpfTextField.text isEqualToString:@""] && ![dddTextField.text isEqualToString:@""]) {
        
        //VERIFICA SE ALGUMA PROFISSÃO FOI MARCADA
        if (self.switchAlvenaria.on == YES || self.switchChaveiro.on == YES || self.switchEletrica.on == YES || self.switchHidraulica.on == YES || self.switchLimpeza.on == YES || self.switchPintura.on == YES){
        
            [self cadastraProfissionalParse];
        } else{
            statusCadastro = @"Selecione pelo menos um serviço";
            [self alertStatusCadastro:statusCadastro];

        }
    
        
    } else {
        statusCadastro = @"Preencha todos os campos";
        [self alertStatusCadastro:statusCadastro];
    }
    
}

- (void)segueViewController{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HOOServicosDisponiveisViewController *viewController = (HOOServicosDisponiveisViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Pro"];
        [self presentViewController:viewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
