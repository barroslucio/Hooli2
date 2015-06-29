//
//  HOOServicosDisponiveisViewController.m
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOServicosDisponiveisViewController.h"
#import "HOOLoginViewController.h"
#import <Parse/Parse.h>
#import "HOOServicosDisponiveisTVCell.h"
#import "HOODetalhesServicosDisponiveisViewController.h"
#import "HOODetalhesHistoricoServicoProfissionalViewController.h"

@interface HOOServicosDisponiveisViewController (){
    NSString *strDate;

}

@end

@implementation HOOServicosDisponiveisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    [self initProperties];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initProperties
{
    
    NSDateFormatter *invertedDateFormatter = [[NSDateFormatter alloc] init];
    invertedDateFormatter.dateFormat = @"yyyy-MM-dd";
    strDate = [invertedDateFormatter stringFromDate:[NSDate date]];
    
    PFUser *user = [PFUser currentUser];
    
    
    PFQuery *propostasFeitas = [PFQuery queryWithClassName:@"Proposta"];
    [propostasFeitas whereKey:@"profissional" equalTo:[PFUser currentUser]];
    self.arrayPropostas = [propostasFeitas findObjects];

    PFQuery *servicosDisponiveis = [PFQuery queryWithClassName:@"Servico"];
    
    NSMutableArray *servicesToFilter = [@[] mutableCopy];
            for (NSDictionary *object in self.arrayPropostas) {
                PFObject *servico = (PFObject *) object[@"servico"];
                [servicesToFilter addObject:[servico objectId]];
            }
            NSLog(@"%ld", servicesToFilter.count);
            [servicosDisponiveis whereKey:@"objectId" notContainedIn:servicesToFilter];

    NSMutableArray *tipoServico = [@[] mutableCopy];
    
    if ([user[@"alvenaria"] isEqual:[NSNumber numberWithBool:YES]]){
        [tipoServico addObject:@"Alvenaria"];
    }
    if ([user[@"pintura"] isEqual:[NSNumber numberWithBool:YES]]){
        [tipoServico addObject:@"Pintura"];

        [servicosDisponiveis whereKey:@"tipo" equalTo:@"Pintura"];
    }
    if ([user[@"limpeza"] isEqual:[NSNumber numberWithBool:YES]]){
        [tipoServico addObject:@"Limpeza"];

        [servicosDisponiveis whereKey:@"tipo" equalTo:@"Limpeza"];
    }
    if ([user[@"chaveiro"] isEqual:[NSNumber numberWithBool:YES]]){
        [tipoServico addObject:@"Chaveiro"];

        [servicosDisponiveis whereKey:@"tipo" equalTo:@"Chaveiro"];
    }
    if ([user[@"hidraulica"] isEqual:[NSNumber numberWithBool:YES]]){
        [tipoServico addObject:@"Hidráulica"];

        [servicosDisponiveis whereKey:@"tipo" equalTo:@"Hidráulica"];
    }
    if ([user[@"eletrica"] isEqual:[NSNumber numberWithBool:YES]]){
        [tipoServico addObject:@"Elétrica"];

        [servicosDisponiveis whereKey:@"tipo" equalTo:@"Elétrica"];
    }
    [servicosDisponiveis whereKey:@"tipo" containedIn:tipoServico];

    self.arrayServicos =[servicosDisponiveis findObjects];
}

//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HOOServicosDisponiveisTVCell   *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Limpeza"])
    {
        cell.imagemServico.image = [UIImage imageNamed:@"limpezaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Alvenaria"])
    {
        cell.imagemServico.image = [UIImage imageNamed:@"alvenariaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Hidráulica"])
    {
        cell.imagemServico.image = [UIImage imageNamed:@"hidraulicaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Pintura"])
    {
        cell.imagemServico.image = [UIImage imageNamed:@"pinturaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Chaveiro"])
    {
        cell.imagemServico.image = [UIImage imageNamed:@"chaveiroIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Elétrica"])
    {
        cell.imagemServico.image = [UIImage imageNamed:@"eletricaIcon"];
    }

    
    cell.tipoServico.text = [self.arrayServicos[indexPath.row] objectForKey:@"tipo"];
    cell.dataServico.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:[self.arrayServicos[indexPath.row] objectForKey:@"dataServico"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrayServicos.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //pega o indice da linha que ofi clidade na tablea.
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    //envia essa informacao para EditViewController.
    HOODetalhesServicosDisponiveisViewController *destination = segue.destinationViewController;
    destination.servico = [self.arrayServicos objectAtIndex:indexPath.row];
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

@end
