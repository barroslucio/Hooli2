//
//  HOODetalhesHistoricoServicoProfissionalViewController.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HOODetalhesHistoricoServicoProfissionalViewController : UIViewController

@property (nonatomic) NSString *idServico;
@property (nonatomic) NSString *idProposta;

@property (nonatomic) NSString *enderecoServico;
@property (nonatomic) NSString *tipoServico;
@property (nonatomic) NSString *dataServico;
@property (nonatomic) NSString *cidadeServico;
@property (nonatomic) NSString *estadoServico;
@property (nonatomic) NSString *descricaoServico;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

+ (NSString *)dateFormatter:(NSString *)data;
- (IBAction)voltar:(id)sender;

@end
