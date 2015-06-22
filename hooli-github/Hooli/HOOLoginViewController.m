//
//  ViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOLoginViewController.h"


@interface HOOLoginViewController ()<UITextFieldDelegate>{
    UIFloatLabelTextField *emailTextField;
    UIFloatLabelTextField *senhaTextField;
}

@end

@implementation HOOLoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //adiciona um "tap gesture" que tem função de fazer o teclado desaparecer quando o usuário clicar na tela.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
    
    
    //cria o textfiel de email e declara seus propriedades.
    emailTextField = [UIFloatLabelTextField new];
    [emailTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    emailTextField.floatLabelActiveColor = [UIColor orangeColor];
    emailTextField.placeholder = @"Email";
    emailTextField.delegate = self;
    [self.subviewEmail addSubview:emailTextField];
    
   
   [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[emailTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[emailTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(emailTextField)]];
    
    //cria o textfiel de senha e declara seus propriedades.
    senhaTextField = [UIFloatLabelTextField new];
    [senhaTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    senhaTextField.floatLabelActiveColor = [UIColor orangeColor];
    senhaTextField.placeholder = @"Senha";
    senhaTextField.delegate = self;
    [self.subviewSenha addSubview:senhaTextField];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[senhaTextField]-0-|"
                                                                      options:NSLayoutFormatAlignAllBaseline
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(senhaTextField)]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[senhaTextField(45)]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(senhaTextField)]];
}

- (void)ocultaTeclado:(UITapGestureRecognizer *)sender
{
    [emailTextField resignFirstResponder];
    [senhaTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//método que faz os textfields vibrarem caso ocorra algum erro no login.
- (void) loginError{
   
}

//método que é chamado quando o usuário clica no botão de login.
- (IBAction)login:(id)sender {
    
    NSString *username = [emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [senhaTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //verifica se os textfields estão preenchidos.
    if ([username length] == 0 || [password length] == 0) {
        [self loginError];
    }
    
    //se os textfields estão preenchidos então tenta fazer login.
    else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            //se aconteceu algum error, então chama o  método "loginError".
            if (error) {
                [self loginError];
            }
            //se o login foi feito com sucesso.
            else {
                
                NSNumber* number = [[PFUser currentUser] objectForKey:@"tipo"];
                int tipo = [number intValue];
                
                //se o usuário é cliente então encaminha ele pro módulo cliente.
                if (tipo == 0){
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    UIViewController *viewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"User"];
                    [self presentViewController:viewController animated:YES completion:nil];
                
                }
                
                //se o usuário é profissional então encaminha ele pr módulo profissional.
                else if (tipo == 1){
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    UIViewController *viewController = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Pro"];
                    [self presentViewController:viewController animated:YES completion:nil];
                    
                }
            }
        }];
    }

}

//método que é chamada quando o usuário clica no botão de cadastro.
- (IBAction)cadastro:(id)sender {
    
    HOOEscolhaCadastroViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"escolhaCadastro"];
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalVC animated:YES completion:nil];
}


@end
