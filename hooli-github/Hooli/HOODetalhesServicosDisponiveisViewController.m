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
#import "HOOShowAtributosTVCell.h"
#import "HOOShowDescricaoTVCell.h"

@interface HOODetalhesServicosDisponiveisViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>{

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
    PFObject *user = (PFObject *)self.servico[@"User"];
    PFQuery *queryUser = [PFQuery queryWithClassName:@"_User"];
    [queryUser whereKey:@"objectId" equalTo:[user objectId]];
    PFObject *objectUser =[queryUser getFirstObject];
    
    
    self.cidadeServico = objectUser[@"cidade"];
    self.estadoServico = objectUser[@"estado"];
    self.tipoServico = self.servico[@"tipo"];
    self.descricaoServico = self.servico[@"descricao"];
    self.enderecoServico = self.servico[@"endereco"];
    self.dataServico = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:self.servico[@"dataServico"]];

    
    
    
    self.valorTextField.placeholder = @"Preço do Serviço";
    self.valorTextField.delegate = self;
    self.valorTextField.keyboardType = UIKeyboardTypeNumberPad;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0){
        self.tableView.rowHeight = 76;

        HOOShowAtributosTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.textViewAtributo.editable = NO;
        cell.textViewAtributo.scrollEnabled = NO;
        cell.layer.masksToBounds = YES;

        cell.layer.shadowRadius = 50;
        if (indexPath.row == 0)
        {
        cell.labelTitle.text = @"Tipo:";
        cell.textViewAtributo.text = self.tipoServico;
        
        }
    
        if (indexPath.row == 1)
        {
            cell.labelTitle.text = @"Data:";
            cell.textViewAtributo.text = self.dataServico;
        
        }
    
        if (indexPath.row == 2)
        {
            cell.labelTitle.text = @"Endereço:";
            cell.textViewAtributo.scrollEnabled = YES;
            cell.textViewAtributo.text = self.enderecoServico;
        
        }
    
        if (indexPath.row == 3)
        {
            cell.labelTitle.text = @"Cidade:";
            cell.textViewAtributo.text = self.cidadeServico;
        
        }
    
        if (indexPath.row == 4)
        {
            cell.labelTitle.text = @"Estado:";
            cell.textViewAtributo.text = self.estadoServico;
        
        }
    
        return cell;

    } else {
        self.tableView.rowHeight = 120;

        HOOShowDescricaoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        cell.label.text = @"Descrição:";
        cell.textView.scrollEnabled = YES;
        cell.textView.text = self.descricaoServico;

        return cell;
    }
    
    
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
