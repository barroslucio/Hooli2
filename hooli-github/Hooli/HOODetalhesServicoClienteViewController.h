//
//  HOODetalhesServicoClienteViewController.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 13/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOListaPropostasCell.h"
#import "HOODetalhesProfissionalViewController.h"
@interface HOODetalhesServicoClienteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelTipo;
@property (weak, nonatomic) IBOutlet UILabel *labelDateAndHour;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescricao;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)voltar:(id)sender;

@property (nonatomic) NSString *idServico;


@end
