//
//  HOOHistóricoClienteViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOHistoricoClienteViewController.h"
#import "HOODetalhesHistoricoServicoProfissionalViewController.h"
@interface HOOHistoricoClienteViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *arrayServicos;
@end

@implementation HOOHistoricoClienteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
}

- (void)initProperties{
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"User" equalTo:[PFUser currentUser]];
    self.arrayServicos = [query findObjects];
}


//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HOOHistoricoClienteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Limpeza"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"limpezaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Alvenaria"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"alvenariaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Hidráulica"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"hidraulicaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Pintura"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"pinturaIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Chaveiro"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"chaveiroIcon"];
    }
    else if ([[self.arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Elétrica"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"eletricaIcon"];
    }

    cell.labelTipoServico.text = [self.arrayServicos[indexPath.row] objectForKey:@"tipo"];
    cell.labelDataServico.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:[self.arrayServicos[indexPath.row] objectForKey:@"dataServico"]];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayServicos.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HOODetalhesServicoClienteViewController *destinationViewController = [segue destinationViewController];

    
    if ([segue.identifier isEqual:@"detalheHistoricoServico"]) {

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *idServico = [self.arrayServicos[indexPath.row] objectId];
        
        destinationViewController.idServico = idServico;
    } else {
        destinationViewController.idServico = nil;

    }
}


@end
