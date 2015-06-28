//
//  HOOPerfilProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOPerfilProfissionalViewController.h"
#import "HOOCadastroClienteTVCell.h"
#import "HOOCadastroProfissionalTVCell.h"

@interface HOOPerfilProfissionalViewController ()<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    UITextField *_textFieldBeingEdited;
    BOOL alvenaria;
    BOOL chaveiro;
    BOOL eletrica;
    BOOL limpeza;
    BOOL hidraulica;
    BOOL pintura;
    
    NSString *email;
    NSString *senha;
    NSString *endereco;
    NSString *cidade;
    NSString *estado;
    NSNumber *telefone;
    NSNumber *rg;
    NSNumber *cpf;
    NSString *nome;

}



@end

@implementation HOOPerfilProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFUser *user = [PFUser currentUser];
    
    email = user.email;
    senha = user.password;
    nome = user[@"nome"];
    cidade = user[@"cidade"];
    estado = user[@"estado"];
    endereco = user[@"endereco"];
    cpf = user[@"cpf"];
    rg = user[@"rg"];
    telefone = user[@"telefone"];
    
    alvenaria = user[@"alvenaria"];
    chaveiro = user[@"chaveiro"];
    eletrica = user[@"eletrica"];
    hidraulica = user[@"hidraulica"];
    limpeza = user[@"limpeza"];
    pintura = user[@"pintura"];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    
    self.arrayUF = [HOOPerfilClienteViewController arrayUF];
    
    
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
    estado =[self.arrayUF objectAtIndex:row];
    [self.tableView reloadData];
}
//--pikerview

-(void)textFieldDidBeginEditing:(nonnull UITextField *)textField{
    _textFieldBeingEdited = textField;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PFUser *user = [PFUser currentUser];
    
    if (indexPath.section == 0){
        
        HOOCadastroClienteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        if (indexPath.row == 0)
        {
            cell.label.text = @"Nome";
            cell.textField.text = user[@"nome"];
            cell.image.image = [UIImage imageNamed:@"emailIcon"];
            
            
        }
        
        if (indexPath.row == 1)
        {
            cell.label.text = @"Email";
            cell.textField.text = user.email;
            cell.image.image = [UIImage imageNamed:@"emailIcon"];
            
            
        }
        
        if (indexPath.row == 2)
        {
            cell.label.text = @"Senha";
            cell.textField.secureTextEntry = YES;
            cell.textField.placeholder = @"*********";

            
        }
        
        if (indexPath.row == 3)
        {
            cell.label.text = @"Estado";
            cell.textField.text = user[@"estado"];
            cell.textField.text = estado;
            cell.textField.inputView = self.pickerView;
            
        }
        
        if (indexPath.row == 4)
        {
            cell.label.text = @"Cidade";
            cell.textField.text = user[@"cidade"];
            
        }
        
        if (indexPath.row == 5)
        {
            cell.label.text = @"Endereco";
            cell.textField.text = user[@"endereco"];
            
        }
        
        if (indexPath.row == 6)
        {
            cell.label.text = @"Telefone";
            cell.textField.text = [user[@"telefone"] stringValue];

            
        }
        if (indexPath.row == 7)
        {
            cell.label.text = @"RG";
            cell.textField.text = [user[@"rg"] stringValue];

        }
        if (indexPath.row == 8)
        {
            cell.label.text = @"CPF";
            cell.textField.text = [user[@"cpf"] stringValue];

        }
        [cell.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        cell.textField.delegate = self;
        
        return cell;
        
    }
    else{
        HOOCadastroProfissionalTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSwitch"];
        
        if (indexPath.row == 0)
        {
            cell.label.text = @"Alvenaria";
            cell.switchCell.on = alvenaria;
        }
        if (indexPath.row == 1)
        {
            cell.label.text = @"Chaveiro";
            cell.switchCell.on = chaveiro;
        }
        if (indexPath.row == 2)
        {
            cell.switchCell.on = eletrica;
            cell.label.text = @"Elétrica";
        }
        if (indexPath.row == 3)
        {
            cell.switchCell.on = hidraulica;
            cell.label.text = @"Hidráulica";
        }
        if (indexPath.row == 4)
        {
            cell.switchCell.on = limpeza;
            cell.label.text = @"Limpeza";
        }
        if (indexPath.row == 5)
        {
            cell.switchCell.on = pintura;
            cell.label.text = @"Pintura";
        }
        
        [cell.switchCell addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        
        return cell;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (void)textFieldDidChange:(id)sender
{
    CGPoint textFieldPositionPoint = [sender convertPoint:CGPointZero toView:[self tableView]];
    NSIndexPath *indexPath = [[self tableView] indexPathForRowAtPoint:textFieldPositionPoint];
    //NSLog(@"%ld",indexPath.row);
    UITextField* textField = sender;
    if (indexPath.row == 0){
        nome = textField.text;
    }
    if (indexPath.row == 1){
        email = textField.text;
    }
    if (indexPath.row == 2){
        senha = textField.text;
    }
    if (indexPath.row == 3){
        estado = textField.text;
    }
    if (indexPath.row == 4){
        cidade = textField.text;
    }
    if (indexPath.row == 5){
        endereco = textField.text;
    }
    if (indexPath.row == 6){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        telefone = [f numberFromString:textField.text];
    }
    if (indexPath.row == 7){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        rg = [f numberFromString:textField.text];
    }
    if (indexPath.row == 8){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        cpf = [f numberFromString:textField.text];
    }
    
    _textFieldBeingEdited = nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_textFieldBeingEdited){
        [_textFieldBeingEdited resignFirstResponder];
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0)
    {
        return @"Dados Pessoais";
    }
    else{
        return @"Serviços";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 9;
    }else {
        return 6;
    }
}

- (void) switchChanged:(id)sender {
    CGPoint switchPositionPoint = [sender convertPoint:CGPointZero toView:[self tableView]];
    NSIndexPath *indexPath = [[self tableView] indexPathForRowAtPoint:switchPositionPoint];
    NSLog(@"%ld",indexPath.row);
    UISwitch* switchControl = sender;
    NSLog( @"The switch is %@", switchControl.on ? @"ON" : @"OFF" );
    if (indexPath.row == 0){
        alvenaria = switchControl.on;
    }
    if (indexPath.row == 1){
        chaveiro = switchControl.on;
    }
    if (indexPath.row == 2){
        eletrica = switchControl.on;
    }
    if (indexPath.row == 3){
        hidraulica = switchControl.on;
    }
    if (indexPath.row == 4){
        limpeza = switchControl.on;
    }
    if (indexPath.row == 5){
        pintura = switchControl.on;
    }
}



- (IBAction)salvar:(id)sender{
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    

    if (![email isEqualToString:@""] && ![senha isEqualToString:@""] && ![cidade isEqualToString:@""]  && ![estado isEqualToString:@""] && ![endereco isEqualToString:@""] && ![nome isEqualToString:@""] && telefone!=NULL && rg!=NULL && cpf!=NULL)
    {

        //VERIFICA SE ALGUMA PROFISSÃO FOI MARCADA
        if (alvenaria || chaveiro || eletrica || hidraulica || limpeza || pintura) {

            //Método para salvar no Parse.com
            [self cadastraProfissional];
            
        } else {
            UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Alerta!" andWithMessage:@"Selecione pelo menos um tipo se serviço"];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        
    }
    
    else
    {
        UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Alerta!" andWithMessage:@"Preencha todos os campos"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    
}

- (void)cadastraProfissional{
    
    NSNumber *tipo = [NSNumber numberWithInt:1];

    
    PFUser *user = [PFUser currentUser];
    user.username = email;
    user.password = senha;
    user.email = email;
    
    user[@"nome"] = nome;
    user[@"telefone"] = telefone;
    user[@"endereco"] = endereco;
    user[@"cidade"] = cidade;
    user[@"estado"] = estado;
    user[@"rg"] = rg;
    user[@"cpf"] = cpf;
    user[@"tipo"] = tipo;

    
    user[@"hidraulica"] =  [NSNumber numberWithBool:hidraulica];
    user[@"pintura"] =  [NSNumber numberWithBool:pintura];
    user[@"limpeza"] =  [NSNumber numberWithBool:limpeza];
    user[@"eletrica"] =  [NSNumber numberWithBool:eletrica];
    user[@"alvenaria"] =  [NSNumber numberWithBool:alvenaria];
    user[@"chaveiro"] =  [NSNumber numberWithBool:chaveiro];
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Perfil atualizado!" andWithMessage:@""];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        }
        else
        {
            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            
            UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Erro!" andWithMessage:@"Verifique sua conexão com a Internet \nVerifique se seu e-mail é válido/nTente novamente"];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
