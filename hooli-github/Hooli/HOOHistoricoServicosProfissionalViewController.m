//
//  HOOHistoricoServicosProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOHistoricoServicosProfissionalViewController.h"
#import "HOOHistoricoServicoProfissionalTVCell.h"

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
    
    HOOHistoricoServicoProfissionalTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (type==0) {
        
        PFObject *object = self.arrayServicosEscolhido[indexPath.row]; //Dicionário recebe o objeto do array de propostas.
        PFQuery *query = [PFQuery queryWithClassName:@"Proposta"];
        [query whereKey:@"servico" equalTo:object];
        PFObject *proposta = [query getFirstObject];
        
        [arrayIdPropostaEscolhida addObject:proposta];
        
        cell.labelPrincipal.text = [object objectForKey:@"tipo"];
        cell.labelData.text = [HOOHistoricoServicosProfissionalViewController dateFormatter:[NSString stringWithFormat: @"%@", object[@"dataServico"]]]
        ;
        cell.labelSecundario.text = [NSString stringWithFormat:@"R$ %@",[proposta[@"valor"] stringValue]];
        
        if ([[object objectForKey:@"tipo"]  isEqual: @"Limpeza"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"limpezaIcon"];
        }
        else if ([[object objectForKey:@"tipo"]  isEqual: @"Alvenaria"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"alvenariaIcon"];
        }
        else if ([[object objectForKey:@"tipo"]  isEqual: @"Hidráulica"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"hidraulicaIcon"];
        }
        else if ([[object objectForKey:@"tipo"]  isEqual: @"Pintura"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"pinturaIcon"];
        }
        else if ([[object objectForKey:@"tipo"]  isEqual: @"Chaveiro"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"chaveiroIcon"];
        }
        else if ([[object objectForKey:@"tipo"]  isEqual: @"Elétrica"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"eletricaIcon"];
        }
        
        
    } else {
        
        NSLog(@"\n-%@", [self.arrayServicosPendentes[indexPath.row] objectId]);

        NSDictionary *objectProposta = self.arrayServicosPendentes[indexPath.row]; //Dicionário recebe o objeto do array de propostas.
        
        PFObject *servico = (PFObject *) objectProposta[@"servico"]; //PFobject recebe o campo "servico" da classe Proposta
        PFQuery *queryServico = [PFQuery queryWithClassName:@"Servico"];
        [queryServico whereKey:@"objectId" equalTo:[servico objectId]]; //Faz requisição do serviço que tem objectId igual ao objeto do array de propostas
        PFObject *objectServico = [queryServico getFirstObject];
        [arrayIdServicosPendentes addObject:objectServico];
        
        cell.labelPrincipal.text = [objectServico objectForKey:@"tipo"];
        cell.labelData.text = [HOOHistoricoServicosProfissionalViewController dateFormatter:[NSString stringWithFormat: @"%@", objectServico[@"dataServico"]]]
;

        cell.labelSecundario.text = [NSString stringWithFormat:@"R$ %@",[[objectProposta objectForKey:@"valor"] stringValue]];
        
        if ([[objectServico objectForKey:@"tipo"]  isEqual: @"Limpeza"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"limpezaIcon"];
        }
        else if ([[objectServico objectForKey:@"tipo"]  isEqual: @"Alvenaria"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"alvenariaIcon"];
        }
        else if ([[objectServico objectForKey:@"tipo"]  isEqual: @"Hidráulica"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"hidraulicaIcon"];
        }
        else if ([[objectServico objectForKey:@"tipo"]  isEqual: @"Pintura"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"pinturaIcon"];
        }
        else if ([[objectServico objectForKey:@"tipo"]  isEqual: @"Chaveiro"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"chaveiroIcon"];
        }
        else if ([[objectServico objectForKey:@"tipo"]  isEqual: @"Elétrica"])
        {
            cell.imagemTipoServico.image = [UIImage imageNamed:@"eletricaIcon"];
        }
        
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(type == 0)
    {
        [self performSegueWithIdentifier:@"detalhesCliente" sender:self];
        
    }else{
        [self performSegueWithIdentifier:@"detalhesServico" sender:self];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *idServico;
    NSString *idProposta;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

    if ([segue.identifier isEqual:@"detalhesCliente"]) {
        
        HOODetalhesHistoricoServicoProfissionalViewController *destinationViewController = [segue destinationViewController];

        idServico = [self.arrayServicosEscolhido[indexPath.row] objectId];
        idProposta = [arrayIdPropostaEscolhida[indexPath.row] objectId];


        destinationViewController.idServico = idServico;
        destinationViewController.idProposta = idProposta;
         
    } else if ([segue.identifier isEqual:@"detalhesServico"]) {
        
        HOOInformacoesClienteViewController *destinationViewController = [segue destinationViewController];
        
        idProposta = [self.arrayServicosPendentes[indexPath.row] objectId];
        idServico = [arrayIdServicosPendentes[indexPath.row] objectId];
        
        destinationViewController.idServico = idServico;
        destinationViewController.idProposta = idProposta;


        
    }}

//Método de classe para formatar a date que vem do Parse
+ (NSString *)dateFormatter:(NSString *)data{
    
    NSRange rangeAno = NSMakeRange(0, 4);
    NSRange rangeMes = NSMakeRange(5, 2);
    NSRange rangeDia = NSMakeRange(8, 2);
    
    NSString *formatter = [NSString stringWithFormat:@"%@/%@/%@",
                           [data substringWithRange:rangeDia],
                           [data substringWithRange:rangeMes],
                           [data substringWithRange:rangeAno]
                           ];
    
    return formatter;
    
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
