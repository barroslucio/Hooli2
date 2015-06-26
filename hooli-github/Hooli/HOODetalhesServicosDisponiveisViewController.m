//
//  HOODetalhesServicosDisponiveisViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesServicosDisponiveisViewController.h"
#import "HOOHistoricoServicosProfissionalViewController.h"
#import "HOODetalhesHistoricoServicoProfissionalViewController.h"
@interface HOODetalhesServicosDisponiveisViewController ()<UITextFieldDelegate>{

}

@end

@implementation HOODetalhesServicosDisponiveisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   [self initProperties];
    NSLog(@"%@",self.servico);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initProperties
{
    self.tipoServico.text = self.servico[@"tipo"];
    self.dataServico.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:self.servico[@"dataServico"]];
    self.descricaoServico.text = self.servico[@"descricao"];
    self.descricaoServico.editable = NO;
    self.valorTextField.placeholder = @"Preço do Serviço";
    self.valorTextField.delegate = self;
    self.valorTextField.keyboardType = UIKeyboardTypeNumberPad;

}

- (void)alertStatusCadastro:(NSString *)status
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta!" message:status delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    NSLog(@"Cadastro do Profissional recuzado");
    
}


- (IBAction)enviarProposta:(id)sender
{
    NSString *statusCadastro;
    //VERIFICA SE AS TEXTFILDS ESTÃO TODAS PREENCHIDAS
    if (![self.valorTextField.text isEqualToString:@""])
    {
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
        NSNumber *valor = [formatter numberFromString:self.valorTextField.text];
    
        PFObject *proposta = [PFObject objectWithClassName:@"Proposta"];
        [proposta setObject: [PFUser currentUser] forKey:@"profissional"];
        [proposta setObject: self.servico forKey:@"servico"];
        [proposta setObject: valor forKey:@"valor"];
        [proposta saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
        {
            [self initProperties];
            if(succeeded)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Proposta realizada com sucesso!"
                                                                    message:@"Obrigado!"
                                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
                
                [self dismissViewControllerAnimated:YES completion:nil];

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
    else
    {
        statusCadastro = @"Preencha o valor da proposta!";
        [self alertStatusCadastro:statusCadastro];
    }
}


- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
