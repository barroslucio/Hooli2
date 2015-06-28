//
//  HOOPerfilUsuarioViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/11/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilClienteViewController.h"
#import "HOOAgendarServicoViewController.h"
#import "HOOCadastroProfissionalViewController.h"
#import "HOOLoginViewController.h"


@interface HOOPerfilClienteViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>


@end

@implementation HOOPerfilClienteViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tfEmail.layer setCornerRadius:15.0f];
    self.tfEmail.layer.masksToBounds = YES;
    
    [self.tfEndereco.layer setCornerRadius:15.0f];
    self.tfEndereco.layer.masksToBounds = YES;
    
    [self.tfCidade.layer setCornerRadius:15.0f];
    self.tfCidade.layer.masksToBounds = YES;
    
    [self.tfEstado.layer setCornerRadius:15.0f];
    self.tfEstado.layer.masksToBounds = YES;
    
    [self.tfTelefone.layer setCornerRadius:15.0f];
    self.tfEstado.layer.masksToBounds = YES;
       
    self.tfEstado.placeholder = @"Estado";
    self.tfEstado.delegate = self;
    
    self.tfEmail.placeholder = @"Email";
    self.tfEmail.delegate = self;

    self.tfCidade.placeholder = @"Cidade";
    self.tfCidade.delegate = self;
    
    
    
   
    
    self.tfEndereco.placeholder = @"Endereço";
    self.tfEndereco.delegate = self;
    
    self.tfTelefone.placeholder = @"Telefone";
    self.tfTelefone.delegate = self;

    
    
    
    PFUser *user = [PFUser currentUser];
    
    self.tfEndereco.text = user[@"endereco"];
    self.tfEmail.text = user[@"email"];
    self.tfEstado.text = user[@"estado"];
    self.tfCidade.text = user[@"cidade"];
    self.tfTelefone.text = [user[@"telefone"] stringValue];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.tfEstado.inputView = self.pickerView;
    
    self.arrayUF = [HOOPerfilClienteViewController arrayUF];
    
}

+ (NSArray *)arrayUF{
    NSArray* array = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Distrito Federal", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];
    
    return array;
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
    return [self.arrayUF objectAtIndex:row];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.tfEstado.text=[self.arrayUF objectAtIndex:row];
}


// procedimento para o teclado ser ocultado
- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    [self.tfCidade resignFirstResponder];
    [self.tfEmail resignFirstResponder];
    [self.tfEndereco resignFirstResponder];
    [self.tfEstado resignFirstResponder];
    [self.tfTelefone resignFirstResponder];

}


- (void)atualizarDadosCliente{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *telefone = [formatter numberFromString:self.tfTelefone.text];
    NSNumber *tipo = [NSNumber numberWithInt:0];
    
    PFUser *user = [PFUser currentUser];
    
    
    user[@"endereco"] = self.tfEndereco.text;
    user[@"email"]= self.tfEmail.text;
    user[@"estado"] = self.tfEstado.text;
    user[@"cidade"] = self.tfCidade.text;
    user[@"telefone"] = telefone;
    user[@"tipo"] = tipo;
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Alerta!" andWithMessage:@"Alteração bem sucedida"];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        } else
        {
            UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Erro!" andWithMessage:@"Tente novamente"];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    }];
}

// salvando os dados dos clientes
- (IBAction)salvar:(id)sender
{
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.tfEmail.text isEqualToString:@""]  && ![self.tfCidade.text isEqualToString:@""] && ![self.tfEstado.text isEqualToString:@""] && ![self.tfTelefone.text isEqualToString:@""] && ![self.tfEndereco.text isEqualToString:@""])
    {
        //Método para salvar no Parse.com
        [self atualizarDadosCliente];
    }
    
    else
    {
        UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Alerta!" andWithMessage:@"Preencha todos os campos"];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    
}




@end
