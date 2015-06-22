//
//  HOODetalhesProfissionalViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/17/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOODetalhesServicoClienteViewController.h"

@interface HOODetalhesProfissionalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbNome;
@property (weak, nonatomic) IBOutlet UILabel *lbEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lbCidade;
@property (weak, nonatomic) IBOutlet UILabel *lbEstado;

@property(nonatomic) NSString *idProposta;
@property(nonatomic) NSString *idServico;

- (IBAction)confirmar:(id)sender;
- (IBAction)voltar:(id)sender;

@end
