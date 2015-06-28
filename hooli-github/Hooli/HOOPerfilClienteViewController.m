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
#import "HOOCadastroClienteTVCell.h"


@interface HOOPerfilClienteViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>{
    NSString *estado;
    NSString *cidade;
    NSString *endereco;
    NSNumber *telefone;
    NSString *stringTelefone;
    NSString *senha;
    NSString *email;
    UITextField *_textFieldBeingEdited;
}



@end

@implementation HOOPerfilClienteViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    PFUser *user = [PFUser currentUser];
    
    email = user.email;
    senha = user.password;
    cidade = user[@"cidade"];
    estado = user[@"estado"];
    endereco = user[@"endereco"];
    telefone = user[@"telefone"];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    
    self.arrayUF = [HOOPerfilClienteViewController arrayUF];
    
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
        
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

    HOOCadastroClienteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    if (indexPath.row == 0)
    {
        cell.label.text = @"Email";
        cell.textField.text = user.email;
        cell.image.image = [UIImage imageNamed:@"emailIcon"];
        
    }
    
    if (indexPath.row == 1)
    {
        cell.label.text = @"Senha";
        cell.textField.secureTextEntry = YES;
        cell.textField.placeholder = @"*********";
        
    }
    
    if (indexPath.row == 2)
    {
        cell.label.text = @"Estado";
        cell.textField.text = user[@"estado"];
        cell.textField.text = estado;
        cell.textField.inputView = self.pickerView;
        
    }
    
    if (indexPath.row == 3)
    {
        cell.label.text = @"Cidade";
        cell.textField.text = user[@"cidade"];
        
    }
    
    if (indexPath.row == 4)
    {
        cell.label.text = @"Endereco";
        cell.textField.text = user[@"endereco"];
        
    }
    
    if (indexPath.row == 5)
    {
        cell.label.text = @"Telefone";
        cell.textField.text = [user[@"telefone"] stringValue];
        
        
    }
  
    
    [cell.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    cell.textField.delegate = self;
    
    return cell;
    
    
}

- (void)textFieldDidChange:(id)sender
{
    CGPoint textFieldPositionPoint = [sender convertPoint:CGPointZero toView:[self tableView]];
    NSIndexPath *indexPath = [[self tableView] indexPathForRowAtPoint:textFieldPositionPoint];
    //NSLog(@"%ld",indexPath.row);
    UITextField* textField = sender;
    if (indexPath.row == 0){
        email = textField.text;
    }
    if (indexPath.row == 1){
        senha = textField.text;
    }
    if (indexPath.row == 2){
        estado = textField.text;
    }
    if (indexPath.row == 3){
        cidade = textField.text;
    }
    if (indexPath.row == 4){
        endereco = textField.text;
    }
    if (indexPath.row == 5){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        telefone = [f numberFromString:textField.text];
        stringTelefone = textField.text;
        
    }
    
    _textFieldBeingEdited = nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_textFieldBeingEdited){
        [_textFieldBeingEdited resignFirstResponder];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}





+ (NSArray *)arrayUF{
    NSArray* array = @[@"Acre", @"Alagoas", @"Amazonas", @"Amapá", @"Bahia", @"Ceará", @"Distrito Federal", @"Espírito Santo", @"Goiás", @"Maranhão", @"Minas Gerais", @"Mato Grosso do Sul", @"Mato Grosso", @"Pará", @"Paraíba", @"Pernambuco", @"Piauí", @"Paraná", @"Rio de Janeiro", @"Rio Grande do Norte", @"Rondônia", @"Roraima", @"Rio Grande do Sul", @"Santa Catarina", @"Sergipe", @"São Paulo", @"Tocantins"];
    
    return array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// procedimento para o teclado ser ocultado
- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{

}


- (void)atualizarDadosCliente{
    
    NSNumber *tipo = [NSNumber numberWithInt:0];
    
    PFUser *user = [PFUser currentUser];
    user.username = email;
    user.password = senha;
    user.email = email;
    
    user[@"telefone"] = telefone;
    user[@"endereco"] = endereco;
    user[@"cidade"] = cidade;
    user[@"estado"] = estado;
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
    if (![email isEqualToString:@""] && ![senha isEqualToString:@""] && ![cidade isEqualToString:@""]  && ![estado isEqualToString:@""] && ![endereco isEqualToString:@""] && telefone!=NULL)
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
