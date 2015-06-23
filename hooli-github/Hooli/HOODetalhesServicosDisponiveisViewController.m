//
//  HOODetalhesServicosDisponiveisViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesServicosDisponiveisViewController.h"
#import "HOOHistoricoServicosProfissionalViewController.h"

@interface HOODetalhesServicosDisponiveisViewController ()<UITextFieldDelegate>{
    UIFloatLabelTextField *valorTextField;

}

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
    
    valorTextField = [UIFloatLabelTextField new];
    [valorTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    valorTextField.floatLabelActiveColor = [UIColor orangeColor];
    valorTextField.placeholder = @"Preço do Serviço";
    valorTextField.delegate = self;
    valorTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.subviewValor addSubview:valorTextField];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[valorTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(valorTextField)]];
    // Vertical
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[valorTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(valorTextField)]];
    

    
}

- (IBAction)enviarProposta:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *valor = [formatter numberFromString:valorTextField.text];
    
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
