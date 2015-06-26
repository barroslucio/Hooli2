//
//  HOOInformacoesProfissionalViewController.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 23/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HOOInformacoesProfissionalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbNome;
@property (weak, nonatomic) IBOutlet UILabel *lbEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lbCidade;
@property (weak, nonatomic) IBOutlet UILabel *lbEstado;
@property (weak, nonatomic) IBOutlet UILabel *lbEmail;
@property (weak, nonatomic) IBOutlet UILabel *lbTelefone;
- (IBAction)voltar:(id)sender;

@property(nonatomic) NSString *idProfissional;

@end
