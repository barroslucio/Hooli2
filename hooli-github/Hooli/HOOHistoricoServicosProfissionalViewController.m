//
//  HOOHistoricoServicosProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOHistoricoServicosProfissionalViewController.h"

@interface HOOHistoricoServicosProfissionalViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *arrayIdServicosPendentes;
    NSMutableArray *arrayIdPropostaEscolhida;

    int type; //gambView pra escolher qual array vai ser mostrado na tableView

}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedAction:(id)sender;
@property (nonatomic) NSArray *arrayServicosEscolhido;
@property (nonatomic) NSArray *arrayServicosPendentes;

@end

@implementation HOOHistoricoServicosProfissionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    [self requisicoes];
    arrayIdServicosPendentes = [[NSMutableArray alloc] init];
    arrayIdPropostaEscolhida = [[NSMutableArray alloc] init];

}
- (void)initProperties{
    type = 0;
}

-(void)requisicoes{
    
    //Requisição dos serviços que já foi escolhido
    PFQuery *queryEscolhido = [PFQuery queryWithClassName:@"Servico"];
    [queryEscolhido whereKey:@"proEscolhido" equalTo:[PFUser currentUser]];
    
    self.arrayServicosEscolhido = [[NSArray alloc] initWithArray:[queryEscolhido findObjects]];
    
    //Requisição dos serviços em aguardo de aceitação
    PFQuery *queryPendentes = [PFQuery queryWithClassName:@"Proposta"];
    [queryPendentes whereKey:@"profissional" equalTo:[PFUser currentUser]];
    NSArray *pendentesArray = [queryPendentes findObjects];
    NSMutableArray *pendentesMutableArray = [@[] mutableCopy];
    for (NSDictionary *object in pendentesArray) {
        
        PFObject *proposta = (PFObject *)object[@"servico"];

        if ([self servicosEscolhidos:self.arrayServicosEscolhido senvicoPendente:proposta] == YES) {
            [pendentesMutableArray addObject:object];
        }
    }
    
    self.arrayServicosPendentes = [[NSArray alloc] initWithArray:pendentesMutableArray];

}

//Validação se o serviço pendente já foi escolhido
- (BOOL)servicosEscolhidos:(NSArray *)escolhidos senvicoPendente:(PFObject *)pendente{

    for (NSDictionary *servico in escolhidos) {
        
        if ([servico isEqual:pendente]) {
            return NO;
        }

    }
    return YES;

}


//TABLE VIEW
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (type==0) {
        
        PFObject *object = self.arrayServicosEscolhido[indexPath.row]; //Dicionário recebe o objeto do array de propostas.
        PFQuery *query = [PFQuery queryWithClassName:@"Proposta"];
        [query whereKey:@"servico" equalTo:object];
        PFObject *proposta = [query getFirstObject];
        
        [arrayIdPropostaEscolhida addObject:proposta];
        
        cell.textLabel.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:object[@"dataServico"]];
        
        cell.detailTextLabel.text = [proposta[@"valor"] stringValue];
        

    } else {
        
        NSLog(@"\n-%@", [self.arrayServicosPendentes[indexPath.row] objectId]);

        NSDictionary *object = self.arrayServicosPendentes[indexPath.row]; //Dicionário recebe o objeto do array de propostas.
        PFObject *servico = (PFObject *) object[@"servico"]; //PFobject recebe o campo "servico" da classe Proposta
        PFQuery *queryServico = [PFQuery queryWithClassName:@"Servico"];
        [queryServico whereKey:@"objectId" equalTo:[servico objectId]]; //Faz requisição do serviço que tem objectId igual ao objeto do array de propostas
        PFObject *objectServico = [queryServico getFirstObject];
        [arrayIdServicosPendentes addObject:objectServico];
        
        cell.textLabel.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:objectServico[@"dataServico"]];
        
        cell.detailTextLabel.text = [[self.arrayServicosPendentes[indexPath.row] objectForKey:@"valor"] stringValue];
        
        
    }

    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (type==0) {
        return self.arrayServicosEscolhido.count;
    } else {
        return self.arrayServicosPendentes.count;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HOODetalhesHistoricoServicoProfissionalViewController *destinationViewController = [segue destinationViewController];
    
    
    if ([segue.identifier isEqual:@"detalhes"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *idServico;
        NSString *idProposta;


        if (type==0) {
            idServico = [self.arrayServicosEscolhido[indexPath.row] objectId];
            idProposta = [arrayIdPropostaEscolhida[indexPath.row] objectId];

        }
        else {
            idProposta = [self.arrayServicosPendentes[indexPath.row] objectId];
            idServico = [arrayIdServicosPendentes[indexPath.row] objectId];

        }
        destinationViewController.idServico = idServico;
        destinationViewController.idProposta = idProposta;
    } else {
        destinationViewController.idServico = nil;
        
    }
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
