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

- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)alerta
{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Deseja contratar?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Sim",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [self contratar];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
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
                                     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                     HOOAgendarServicoViewController *viewController = (HOOAgendarServicoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"User"];
                                     [self presentViewController:viewController animated:YES completion:nil];
                                     
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
