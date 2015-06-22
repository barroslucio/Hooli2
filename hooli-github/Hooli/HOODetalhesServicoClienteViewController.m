//
//  HOODetalhesServicoClienteViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 13/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesServicoClienteViewController.h"
#import "HOODetalhesProfissionalViewController.h"

@interface HOODetalhesServicoClienteViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *arrayListaPro;

@end

@implementation HOODetalhesServicoClienteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *propostas;
    
    // query para o serviço
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *object =[query getFirstObject];

    self.labelTipo.text = object[@"tipo"];
    self.labelDateAndHour.text = [NSString stringWithFormat: @"Data: %@", object[@"dataServico"]];
    self.textViewDescricao.text = object[@"descricao"];
    
    self.arrayListaPro = [[NSArray alloc] initWithArray:object[@"proCandidatos"]];
    
    self.textViewDescricao.editable = NO;

    
    PFQuery *propostasFeitas = [PFQuery queryWithClassName:@"Proposta"];
    propostas = [propostasFeitas findObjects];
    NSMutableArray *servicesToFilter = [@[] mutableCopy];
    for (NSDictionary *object in propostas) {
        
    PFObject *servico = (PFObject *) object[@"servico"];
        if([self.idServico isEqual:[servico objectId]])
        {
            [servicesToFilter addObject:object];
        }
    }
    
    self.arrayListaPro = servicesToFilter;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [self.arrayListaPro count];
}

// função para listar o nome e o preço dos profissionais
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HOOListaPropostasCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellPro"];
    cell.lbValor.text = [NSString stringWithFormat:@"R$ %@",[[self.arrayListaPro[indexPath.row] objectForKey:@"valor"] stringValue]];
    cell.lbNome.text = [self.arrayListaPro[indexPath.row] objectForKey:@"nomeCompleto"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// método para chamar os detalhes do profissional na próxima tela
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HOODetalhesProfissionalViewController *destinationViewController = [segue destinationViewController];
    
    
    if ([segue.identifier isEqual:@"detalhes"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *idProposta = [self.arrayListaPro[indexPath.row] objectId];
        destinationViewController.idProposta = idProposta; // mandando a proposta
        destinationViewController.idServico = self.idServico; // mandando o serviço 
    }
    else
    {
        destinationViewController.idProposta = nil;
        destinationViewController.idServico = nil;
        
    }
}


@end
