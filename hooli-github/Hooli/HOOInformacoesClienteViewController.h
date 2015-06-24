//
//  HOOInformacoesClienteViewController.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 24/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface HOOInformacoesClienteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lbCidade;
@property (weak, nonatomic) IBOutlet UILabel *lbEstado;
@property (weak, nonatomic) IBOutlet UILabel *lbEmail;
@property (weak, nonatomic) IBOutlet UILabel *lbDDD;
@property (weak, nonatomic) IBOutlet UILabel *lbTelefone;
- (IBAction)voltar:(id)sender;

@property (nonatomic) NSString *idServico;
@property (nonatomic) NSString *idProposta;


@end
