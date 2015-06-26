//
//  HOOInformacoesProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 23/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOInformacoesProfissionalViewController.h"

@interface HOOInformacoesProfissionalViewController ()

@end

@implementation HOOInformacoesProfissionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initOutlets];

}
- (void)initOutlets{
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"objectId" equalTo:self.idProfissional];
    PFObject *profissional = [query getFirstObject];
    self.lbNome.text = [profissional objectForKey:@"nome"];
    self.lbEndereco.text = [profissional objectForKey:@"endereco"];
    self.lbCidade.text = [profissional objectForKey:@"cidade"];
    self.lbEstado.text = [profissional objectForKey:@"estado"];
    self.lbEmail.text = [profissional objectForKey:@"email"];
    self.lbTelefone.text = [[profissional objectForKey:@"telefone"] stringValue];
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

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
