//
//  HOOEscolhaCadastroViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 18/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOEscolhaCadastroViewController.h"
#import "HOOCadastroClienteViewController.h"
#import "HOOCadastroProfissionalViewController.h"

@interface HOOEscolhaCadastroViewController ()

@end

@implementation HOOEscolhaCadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//método que é chamado quando o usuário clica no botão de cancelar.
- (IBAction)cancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//método chamado caso o usuário queira se cadastrar como cliente.
- (IBAction)cliente:(id)sender {
    
    HOOCadastroClienteViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cadastroUsuario"];
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];

}


//método chamado caso o usuário queira se cadastrar como profissional.
- (IBAction)profissional:(id)sender {
    
    HOOCadastroProfissionalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cadastroPro"];
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
    
}





@end
