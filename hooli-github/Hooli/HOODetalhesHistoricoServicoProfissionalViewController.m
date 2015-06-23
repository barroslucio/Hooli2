//
//  HOODetalhesHistoricoServicoProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesHistoricoServicoProfissionalViewController.h"

@interface HOODetalhesHistoricoServicoProfissionalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelTipo;

@property (weak, nonatomic) IBOutlet UILabel *labelData;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescricao;
@end

@implementation HOODetalhesHistoricoServicoProfissionalViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self initProperties];
//    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
//    [query whereKey:@"objectId" equalTo:self.idServico];
//    PFObject *object =[query getFirstObject];
//    
//    self.labelTipo.text = object[@"tipo"];
//    self.labelData.text = [NSString stringWithFormat: @"Date: %@", object[@"dataServico"]];
//    self.textViewDescricao.text = object[@"descricao"];
}
- (void)initProperties{
    self.textViewDescricao.editable = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
