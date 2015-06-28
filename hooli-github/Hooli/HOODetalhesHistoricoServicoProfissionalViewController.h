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
+ (NSString *)dateFormatter:(NSString *)data;

@property (weak, nonatomic) IBOutlet UILabel *labelTipo;
@property (weak, nonatomic) IBOutlet UILabel *labelEndereco;
@property (weak, nonatomic) IBOutlet UILabel *labelData;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescricao;
@property (weak, nonatomic) IBOutlet UILabel *labelCidade;
@property (weak, nonatomic) IBOutlet UILabel *labelEstado;

- (IBAction)voltar:(id)sender;

@end
