//
//  HOODetalhesProfissionalViewController.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/17/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesProfissionalViewController.h"
#import "HOOHistoricoClienteViewController.h"
@interface HOODetalhesProfissionalViewController () <UIActionSheetDelegate>
{
    PFObject *profissional;
}

@end

@implementation HOODetalhesProfissionalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self mostraDadosProfissional];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)mostraDadosProfissional
{
    // query para a proposta
    PFQuery *query = [PFQuery queryWithClassName:@"Proposta"];
    [query whereKey:@"objectId" equalTo:self.idProposta];
    PFObject *objectProposta =[query getFirstObject];

    // acessa o id do profissional que mandou a proposta
    profissional = (PFObject *) objectProposta[@"profissional"];
    
    // query para as informações do profissional
    PFQuery *query2 = [PFQuery queryWithClassName:@"_User"];
    [query2 whereKey:@"objectId" equalTo:[profissional objectId]];
    
    // object para o usuário
    PFObject *usuario =[query2 getFirstObject];
    self.lbNome.text = usuario[@"username"];
    self.lbEndereco.text = usuario[@"endereco"];
    self.lbEstado.text = usuario[@"estado"];
    self.lbCidade.text = usuario[@"cidade"];
}




- (IBAction)confirmar:(id)sender
{
    [self alerta];
    
}


-(void)alerta
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"O serviço vai ser feito no seu endereço cadastrado ou em outro lugar?"
                                  message:nil
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    UIAlertAction* sim = [UIAlertAction actionWithTitle:@"Sim"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
                                    {
                                        
                                        [self contratar];
                                        
                                    }];
    
    UIAlertAction* cancelar = [UIAlertAction actionWithTitle:@"Cancelar"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * action)
                               {
                                   
                                   [self dismissViewControllerAnimated:alert completion:nil];
                                   
                               }];
    
    
    [alert addAction:sim];
    [alert addAction:cancelar];
    
    [self presentViewController:alert animated:YES completion:nil];

}


- (void)contratar
{
    // query para o serviço
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *servico =[query getFirstObject];
    
    // setando o serviço para o profissional no parse
    [servico setObject:profissional forKey:@"proEscolhido"];
    
    [servico saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
           
            UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Profissional contratado!" message:@"Agora ambos tem acesso ao telefone do outro" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                 {
                                     [self.navigationController popToRootViewControllerAnimated:YES];
                                 }];
            
            
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            } else {
            
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Erro"
                                                                message:@"Tente novamente"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            }
    }];
    
}



@end
