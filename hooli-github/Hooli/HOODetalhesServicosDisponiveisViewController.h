//
//  HOODetalhesServicosDisponiveisViewController.h
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "UIFloatLabelTextField.h"

@interface HOODetalhesServicosDisponiveisViewController : UIViewController

    @property (nonatomic) PFObject *servico;
    @property (strong, nonatomic) IBOutlet UILabel *tipoServico;
    @property (strong, nonatomic) IBOutlet UILabel *dataServico;
    @property (strong, nonatomic) IBOutlet UILabel *horaServico;
@property (strong, nonatomic) IBOutlet UITextField *valorField;
@property (weak, nonatomic) IBOutlet UIView *subviewValor;
- (IBAction)enviarProposta:(id)sender;

@end
