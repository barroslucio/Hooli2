//
//  HOODetalhesHistoricoServicoProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesHistoricoServicoProfissionalViewController.h"

@interface HOODetalhesHistoricoServicoProfissionalViewController ()
@end

@implementation HOODetalhesHistoricoServicoProfissionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
    NSLog(@"\n---teste %@ - %@", self.idServico, self.idProposta);
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *object =[query getFirstObject];
    
    PFObject *user = (PFObject *)object[@"User"];
    
    PFQuery *queryUser = [PFQuery queryWithClassName:@"_User"];
    [queryUser whereKey:@"objectId" equalTo:[user objectId]];
    PFObject *objectUser =[queryUser getFirstObject];


    self.labelTipo.text = object[@"tipo"];
    self.labelData.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:[NSString stringWithFormat: @"%@", object[@"dataServico"]]];
    self.labelEndereco.text = object[@"endereco"];
    self.labelCidade.text = objectUser[@"cidade"];
    self.labelEstado.text = objectUser[@"estado"];
    self.textViewDescricao.text = object[@"descricao"];
    
    
}


- (void)initProperties{
    self.textViewDescricao.editable = NO;
}


//Método de classe para formatar a date que vem do Parse
+ (NSString *)dateFormatter:(NSString *)data{
    
    NSRange rangeAno = NSMakeRange(0, 4);
    NSRange rangeMes = NSMakeRange(5, 2);
    NSRange rangeDia = NSMakeRange(8, 2);
    
    NSString *formatter = [NSString stringWithFormat:@"%@/%@/%@",
                               [data substringWithRange:rangeDia],
                               [data substringWithRange:rangeMes],
                               [data substringWithRange:rangeAno]
                               ];
    
    return formatter;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
