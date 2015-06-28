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


@interface HOOCadastroProfissionalViewController() <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>{
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
    NSString *stringTelefone;
    NSNumber *rg;
    NSString *stringRG;
    NSNumber *cpf;
    NSString *stringCPF;
    NSString *nome;
    

}



@end

@implementation HOOCadastroProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    email = [[NSString alloc] init];
    senha = [[NSString alloc] init];
    cidade = [[NSString alloc] init];
    estado = [[NSString alloc] init];
    endereco = [[NSString alloc] init];
    stringTelefone = [[NSString alloc] init];
    stringCPF = [[NSString alloc] init];
    stringRG = [[NSString alloc] init];
    nome = [[NSString alloc] init];
    
    alvenaria = NO;
    hidraulica = NO;
    pintura = NO;
    limpeza = NO;
    eletrica = NO;
    chaveiro = NO;
    
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


- (IBAction)salvar:(id)sender {
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
     if (![email isEqualToString:@""] && ![senha isEqualToString:@""] && ![cidade isEqualToString:@""]  && ![estado isEqualToString:@""] && ![endereco isEqualToString:@""] && ![stringTelefone isEqualToString:@""] && ![stringRG isEqualToString:@""] && ![stringCPF isEqualToString:@""] && ![nome isEqualToString:@""])
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
            cell.textField.text = estado;
            cell.textField.inputView = self.pickerView;

            
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
        telefone = [f numberFromString:textField.text];
        stringTelefone = textField.text;
    }
    if (indexPath.row == 7){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        rg = [f numberFromString:textField.text];
        stringRG = textField.text;
    }
    if (indexPath.row == 8){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        cpf = [f numberFromString:textField.text];
        stringCPF = textField.text;
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
    
    user[@"tipo"] = [NSNumber numberWithInt:1];

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
            UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Cadastro bem sucedido!" message:@"Agora você pode enviar propostas para os serviços disponíveis" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                 {
                                     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                     HOOServicosDisponiveisViewController *viewController = (HOOServicosDisponiveisViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Pro"];
                                     [self presentViewController:viewController animated:YES completion:nil];
                                     
                                     
                                 }];
            
            
            [alert addAction:ok];
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
