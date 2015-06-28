//
//  HOOClienteViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOCadastroClienteViewController.h"
#import "HOOCadastroClienteTVCell.h"


@interface HOOCadastroClienteViewController() <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>{
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

@implementation HOOCadastroClienteViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    email = [[NSString alloc] init];
    senha = [[NSString alloc] init];
    cidade = [[NSString alloc] init];
    estado = [[NSString alloc] init];
    endereco = [[NSString alloc] init];
    stringTelefone = [[NSString alloc] init];
    
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
    
    HOOCadastroClienteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (indexPath.row == 0)
    {
        cell.label.text = @"Email";
        cell.textField.placeholder = @"example@example.com";

    }
    
    if (indexPath.row == 1)
    {
        cell.label.text = @"Senha";
        cell.textField.placeholder = @"*********";

    }
    
    if (indexPath.row == 2)
    {
        cell.label.text = @"Estado";
        cell.textField.placeholder = @"Amazonas";
        cell.textField.text = estado;
        cell.textField.inputView = self.pickerView;

    }
    
    if (indexPath.row == 3)
    {
        cell.label.text = @"Cidade";
        cell.textField.placeholder = @"Manaus";

    }
    
    if (indexPath.row == 4)
    {
        cell.label.text = @"Endereco";
        cell.textField.placeholder = @"Av. Djalma Batista, 136";
        
    }
    
    if (indexPath.row == 5)
    {
        cell.label.text = @"Telefone";
        cell.textField.placeholder = @"(92) 991234-9999";
        
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)cadastraCliente{
    
        PFUser *user = [PFUser user];
    
        user.username = email;
        user.password = senha;
        user.email = email;
    
        user[@"telefone"] = telefone;
        user[@"endereco"] = endereco;
        user[@"cidade"] = cidade;
        user[@"estado"] = estado;
    
        
            
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error)
            {   // Hooray! Let them use the app now.
                
//                UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Obrigado!" andWithMessage:@"Cadastro bem sucedido"];
                UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Cadastro bem sucedido" message:@"Agora você pode agendar serviços residenciais através do Hooli" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                {
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    HOOAgendarServicoViewController *viewController = (HOOAgendarServicoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"User"];
                    [self presentViewController:viewController animated:YES completion:nil];

                                         
                }];
                
                
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
                
            }
            else
            {
                NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
                
                UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Erro!" andWithMessage:@"Verifique sua conexão com a Internet.\nVerifique se seu e-mail é válido.\n\nTente novamente"];
                [self presentViewController:alert animated:YES completion:nil];

            }
        }];

}



// salvando os dados dos clientes
- (IBAction)salvar:(id)sender
{
    
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![email isEqualToString:@""] && ![senha isEqualToString:@""] && ![cidade isEqualToString:@""]  && ![estado isEqualToString:@""] && ![endereco isEqualToString:@""] && ![stringTelefone isEqualToString:@""])
    {
        //Método para salvar no Parse.com
        [self cadastraCliente];
    }

    else
    {
        UIAlertController *alert = [HOOAlertControllerStyle styleSimpleWithTitle:@"Alerta!" andWithMessage:@"Preencha todos os campos"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }

}

@end
