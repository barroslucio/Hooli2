//
//  HOODetalhesServicosDisponiveisViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOAlertControllerStyle.h"

@interface HOODetalhesServicosDisponiveisViewController : UIViewController

@property (nonatomic) PFObject *servico;

@property (nonatomic) NSString *enderecoServico;
@property (nonatomic) NSString *tipoServico;
@property (nonatomic) NSString *dataServico;
@property (nonatomic) NSString *cidadeServico;
@property (nonatomic) NSString *estadoServico;
@property (nonatomic) NSString *descricaoServico;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *valorTextField;
@property (weak, nonatomic) IBOutlet UIView *subviewValor;
- (IBAction)enviarProposta:(id)sender;

@end
