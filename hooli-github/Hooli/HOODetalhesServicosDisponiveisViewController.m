//
//  HOODetalhesServicosDisponiveisViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesServicosDisponiveisViewController.h"
#import "HOOHistoricoServicosProfissionalViewController.h"

@interface HOODetalhesServicosDisponiveisViewController ()

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
            self.dataServico.text = self.servico[@"dataServico"];
 
    
    
}

- (IBAction)enviarProposta:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *valor = [formatter numberFromString:self.valorField.text];
    
    PFObject *proposta = [PFObject objectWithClassName:@"Proposta"];
    [proposta setObject: [PFUser currentUser] forKey:@"profissional"];
    [proposta setObject: self.servico forKey:@"servico"];
    [proposta setObject: valor forKey:@"valor"];
    [proposta saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if(succeeded){
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HOOHistoricoServicosProfissionalViewController *viewController = (HOOHistoricoServicosProfissionalViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HistoricoServicosPro"];
            [self presentViewController:viewController animated:YES completion:nil];
        }
    }];
}
@end
