//
//  HOOAgendarServicoViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOAgendarServicoViewController.h"
#import "HOOLoginViewController.h"
#import "HOOAgendaOutroEnderecoViewController.h"
#import "HOOAgendaMesmoEnderecoViewController.h"
#import "HOOAgendarServicoTVCell.h"

@interface HOOAgendarServicoViewController ()<UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate>
{
    int tipoDeServico;
}

@end

@implementation HOOAgendarServicoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HOOAgendarServicoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.row == 0) {

        cell.labelTitle.text = @"Alvenaria";
        cell.imageBG.image = [UIImage imageNamed:@"alvenaria"];
        cell.imageIcon.image = [UIImage imageNamed:@"alvenariaIcon.png"];
    }
    else if (indexPath.row == 1) {
        cell.labelTitle.text = @"Chaveiro";
        cell.imageBG.image = [UIImage imageNamed:@"chaveiro"];
        cell.imageIcon.image = [UIImage imageNamed:@"chaveiroIcon"];
        
    }
    else if (indexPath.row == 2) {
        cell.labelTitle.text = @"Elétrica";
        cell.imageBG.image = [UIImage imageNamed:@"eletrica"];
        cell.imageIcon.image = [UIImage imageNamed:@"eletricaIcon"];
    }
    else if (indexPath.row == 3) {
        cell.labelTitle.text = @"Hidráulica";
        cell.imageBG.image = [UIImage imageNamed:@"hidraulica"];
        cell.imageIcon.image = [UIImage imageNamed:@"hidraulicaIcon"];
    }
    else if (indexPath.row == 4) {
        cell.labelTitle.text = @"Limpeza";
        cell.imageBG.image = [UIImage imageNamed:@"limpeza.png"];
        cell.imageIcon.image = [UIImage imageNamed:@"limpezaIcon.png"];
    }
    else if (indexPath.row == 5) {
        cell.labelTitle.text = @"Pintura";
        cell.imageBG.image = [UIImage imageNamed:@"pintura.png"];
        cell.imageIcon.image = [UIImage imageNamed:@"pinturaIcon"];
    }
    
    cell.imageBG.contentMode = UIViewContentModeScaleAspectFill;
    cell.labelTitle.layer.shadowColor = [[UIColor whiteColor] CGColor];
    cell.labelTitle.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    cell.labelTitle.layer.shadowOpacity = 1.0f;
    cell.labelTitle.layer.shadowRadius = 1.0f;
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        tipoDeServico = 1;
    }
    else if (indexPath.row == 1)
    {
        tipoDeServico = 2;

    }
    else if (indexPath.row == 2)
    {
        tipoDeServico = 3;

    }
    else if (indexPath.row == 3)
    {
        tipoDeServico = 4;

    }
    else if (indexPath.row == 4)
    {
        tipoDeServico = 5;

    }
    else if (indexPath.row == 5)
    {
        tipoDeServico = 6;
    }
    [self alerta];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"outroEndereco"]){
        HOOAgendaOutroEnderecoViewController *controller = (HOOAgendaOutroEnderecoViewController *)segue.destinationViewController;
        
        controller.tipoDeServico = tipoDeServico;
    }
    else if([segue.identifier isEqualToString:@"mesmoEndereco"]){
        HOOAgendaMesmoEnderecoViewController *controller = (HOOAgendaMesmoEnderecoViewController *)segue.destinationViewController;
        
        controller.tipoDeServico = tipoDeServico;
        
    }
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HOOLoginViewController *viewController = (HOOLoginViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self presentViewController:viewController animated:YES completion:nil];
        
    }
}

-(void)alerta{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"O serviço vai ser feito no seu endereço cadastrado ou em outro lugar?"
                                  message:nil
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    UIAlertAction* mesmoEndereco = [UIAlertAction actionWithTitle:@"No mesmo endereço"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action)
    {
        
        [self performSegueWithIdentifier:@"mesmoEndereco" sender:self];
                             
    }];
    
    
    
    UIAlertAction* outroEndereco = [UIAlertAction actionWithTitle:@"Em outro endereço"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
    {
        
        [self performSegueWithIdentifier:@"outroEndereco" sender:self];
        
    }];
    
    
    
    UIAlertAction* cancelar = [UIAlertAction actionWithTitle:@"Cancelar"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action)
    {
                                        
//        [self dismissViewControllerAnimated:alert completion:nil];
        
    }];
    
    
    [alert addAction:mesmoEndereco];
    [alert addAction:outroEndereco];
    [alert addAction:cancelar];
    
    [self presentViewController:alert animated:YES completion:nil];

}

@end
