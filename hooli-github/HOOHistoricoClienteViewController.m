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
{
    int type; //gambView pra escolher qual array vai ser mostrado na tableView

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *arrayServicosPendentes;
@property (nonatomic) NSArray *arrayServicosEscolhidos;

@end

@implementation HOOHistoricoClienteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
}

- (void)initProperties{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"User" equalTo:[PFUser currentUser]];
    NSArray *arrayServicos = [query findObjects];
    
    NSMutableArray *proEscolhidos = [@[] mutableCopy];
    NSMutableArray *proPendentes = [@[] mutableCopy];

    for (NSDictionary *object in arrayServicos) {
        
        PFObject *servico = (PFObject *)object[@"proEscolhido"];
        if (  servico == nil) {
            [proPendentes addObject:object];
        }else{
            [proEscolhidos addObject:object];
        }

    }
    self.arrayServicosPendentes = proPendentes;
    self.arrayServicosEscolhidos = proEscolhidos;
    
    type = 0;

}




//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arrayServicos;
    if (type == 0) {
        arrayServicos = self.arrayServicosPendentes;
    } else {
        arrayServicos = self.arrayServicosEscolhidos;

    }
    
    HOOHistoricoClienteTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if ([[arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Limpeza"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"limpezaIcon"];
    }
    else if ([[arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Alvenaria"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"alvenariaIcon"];
    }
    else if ([[arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Hidráulica"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"hidraulicaIcon"];
    }
    else if ([[arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Pintura"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"pinturaIcon"];
    }
    else if ([[arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Chaveiro"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"chaveiroIcon"];
    }
    else if ([[arrayServicos[indexPath.row] objectForKey:@"tipo"]  isEqual: @"Elétrica"])
    {
        cell.imagemTipoServico.image = [UIImage imageNamed:@"eletricaIcon"];
    }

    cell.labelTipoServico.text = [arrayServicos[indexPath.row] objectForKey:@"tipo"];
    cell.labelDataServico.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:[arrayServicos[indexPath.row] objectForKey:@"dataServico"]];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (type==0) {
        return self.arrayServicosPendentes.count;
    } else {
        return self.arrayServicosEscolhidos.count;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(type == 0)
    {
        [self performSegueWithIdentifier:@"detalheHistoricoServico" sender:self];

    }else{
        [self performSegueWithIdentifier:@"detalheProfissionalEscolhido" sender:self];

    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
    if ([segue.identifier isEqual:@"detalheHistoricoServico"]) {
        
        HOODetalhesServicoClienteViewController *destinationViewController = [segue destinationViewController];

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *idServico;
        idServico = [self.arrayServicosPendentes[indexPath.row] objectId];
        destinationViewController.idServico = idServico;
    } else if ([segue.identifier isEqual:@"detalheProfissionalEscolhido"]) {
        HOOInformacoesProfissionalViewController *destinationViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFObject *object = (PFObject *)self.arrayServicosEscolhidos[indexPath.row][@"proEscolhido"];
        
        NSString *idProfissional = [object objectId];

        
        destinationViewController.idProfissional = idProfissional;

    }
    
//    else {
//        destinationViewController.idServico = nil;
//
//    }
}


- (IBAction)segmentedAction:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            type = 0;
            [self.tableView reloadData];
            break;
        case 1:
            type = 1;
            [self.tableView reloadData];
            break;
        default:
            break;
    }

}
@end
