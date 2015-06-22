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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self alerta];
    
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

    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"O serviço vai ser feito no seu endereço cadastrado ou em outro lugar?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"No mesmo endereço",
                            @"Em outro lugar",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [self performSegueWithIdentifier:@"mesmoEndereco" sender:self];
                    break;
                case 1:
                    [self performSegueWithIdentifier:@"outroEndereco" sender:self];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
}


@end
