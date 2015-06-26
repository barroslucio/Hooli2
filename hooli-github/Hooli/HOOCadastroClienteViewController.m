//
//  HOOClienteViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOCadastroClienteViewController.h"
#import "HOOCadastroClienteTVCell.h"


@interface HOOCadastroClienteViewController() <UITextFieldDelegate>
{
    NSString *estado;
    NSString *cidade;
    NSString *endereco;
    NSString *telefone;
    NSString *senha;
    NSString *email;
    UITextField *_textFieldBeingEdited;
}

@end

@implementation HOOCadastroClienteViewController

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
    
    [cell.textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingChanged];
    cell.textField.delegate = self;
    
    return cell;
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (indexPath.row == 0){
        email = textField.text;
    }
    else if (indexPath.row == 1){
        email = textField.text;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}






// salvando os dados dos clientes
- (IBAction)salvar:(id)sender
{
    
    NSLog(@"%@",email);
   /*
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
*/
}

@end
