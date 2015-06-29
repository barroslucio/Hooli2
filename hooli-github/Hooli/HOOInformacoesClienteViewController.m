//
//  HOOInformacoesClienteViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 24/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOInformacoesClienteViewController.h"

@interface HOOInformacoesClienteViewController ()

@end

@implementation HOOInformacoesClienteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *queryServico = [PFQuery queryWithClassName:@"Servico"];
    [queryServico whereKey:@"objectId" equalTo:self.idServico];
    
    PFObject *user = (PFObject *)[queryServico getFirstObject][@"User"];
    
    PFQuery *queryUser = [PFQuery queryWithClassName:@"_User"];
    [queryUser whereKey:@"objectId" equalTo:[user objectId]];
    
    PFObject *objectUser = [queryUser getFirstObject];
    
    self.lbEmail.text = [objectUser objectForKey:@"email"];
    self.lbEndereco.text = [objectUser objectForKey:@"endereco"];
    self.lbCidade.text = [objectUser objectForKey:@"cidade"];
    self.lbEstado.text = [objectUser objectForKey:@"estado"];
    self.lbTelefone.text = [[objectUser objectForKey:@"telefone"] stringValue];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
