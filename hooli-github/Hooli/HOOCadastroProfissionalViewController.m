//
//  HOOCadastroProffisionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//


#import "HOOCadastroProfissionalViewController.h"
#import "HOOCadastroClienteTVCell.h"
#import "HOOCadastroProfissionalTVCell.h"


@interface HOOCadastroProfissionalViewController() <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
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

@implementation HOOCadastroProfissionalViewController
- (IBAction)salvar:(id)sender {
    [self cadastraProfissional];
}

-(void)textFieldDidBeginEditing:(nonnull UITextField *)textField{
    _textFieldBeingEdited = textField;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (indexPath.section == 0){
        
        HOOCadastroClienteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

        if (indexPath.row == 0)
        {
            cell.label.text = @"Nome";
            cell.textField.placeholder = @"Lúcio Barros";
            cell.image.image = [UIImage imageNamed:@"emailIcon"];
            
            
        }
        
        if (indexPath.row == 1)
        {
            cell.label.text = @"Email";
            cell.textField.placeholder = @"example@example.com";
            cell.image.image = [UIImage imageNamed:@"emailIcon"];

            
        }
        
        if (indexPath.row == 2)
        {
            cell.label.text = @"Senha";
            cell.textField.placeholder = @"*********";
            
        }
        
        if (indexPath.row == 3)
        {
            cell.label.text = @"Estado";
            cell.textField.placeholder = @"Amazonas";
            
        }
        
        if (indexPath.row == 4)
        {
            cell.label.text = @"Cidade";
            cell.textField.placeholder = @"Manaus";
            
        }
        
        if (indexPath.row == 5)
        {
            cell.label.text = @"Endereco";
            cell.textField.placeholder = @"Av. Djalma Batista, 136";
            
        }
        
        if (indexPath.row == 6)
        {
            cell.label.text = @"Telefone";
            cell.textField.placeholder = @"(92) 991234-9999";
            
        }
        if (indexPath.row == 7)
        {
            cell.label.text = @"RG";
            cell.textField.placeholder = @"2036525-0";
        }
        if (indexPath.row == 8)
        {
            cell.label.text = @"CPF";
            cell.textField.placeholder = @"770.690.244-09";
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
        }
        if (indexPath.row == 1)
        {
            cell.label.text = @"Chaveiro";
        }
        if (indexPath.row == 2)
        {
            cell.label.text = @"Elétrica";
        }
        if (indexPath.row == 3)
        {
            cell.label.text = @"Hidráulica";
        }
        if (indexPath.row == 4)
        {
            cell.label.text = @"Limpeza";
        }
        if (indexPath.row == 5)
        {
            cell.label.text = @"Pintura";
        }
        
        [cell.switchCell setOn:NO animated:NO];
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
        telefone = [f numberFromString:textField.text];    }
    if (indexPath.row == 7){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        rg = [f numberFromString:textField.text];    }
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

- (void)cadastraProfissional{
    PFUser *user = [PFUser user];
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
    
    user[@"hidraulica"] =  [NSNumber numberWithBool:hidraulica];
    user[@"pintura"] =  [NSNumber numberWithBool:pintura];
    user[@"limpeza"] =  [NSNumber numberWithBool:limpeza];
    user[@"eletrica"] =  [NSNumber numberWithBool:eletrica];
    user[@"alvenaria"] =  [NSNumber numberWithBool:alvenaria];
    user[@"chaveiro"] =  [NSNumber numberWithBool:chaveiro];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {   // Hooray! Let them use the app now.
            
        }
        else
        {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    alvenaria = NO;
    hidraulica = NO;
    pintura = NO;
    limpeza = NO;
    eletrica = NO;
    chaveiro = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
