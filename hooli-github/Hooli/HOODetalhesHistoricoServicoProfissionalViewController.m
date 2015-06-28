//
//  HOODetalhesHistoricoServicoProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesHistoricoServicoProfissionalViewController.h"
#import "HOOShowAtributosTVCell.h"
#import "HOOShowDescricaoTVCell.h"

@interface HOODetalhesHistoricoServicoProfissionalViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
@end

@implementation HOODetalhesHistoricoServicoProfissionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    
    NSLog(@"\n---teste %@ - %@", self.idServico, self.idProposta);
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *object =[query getFirstObject];
    
    PFObject *user = (PFObject *)object[@"User"];
    
    PFQuery *queryUser = [PFQuery queryWithClassName:@"_User"];
    [queryUser whereKey:@"objectId" equalTo:[user objectId]];
    PFObject *objectUser =[queryUser getFirstObject];


    self.tipoServico = object[@"tipo"];
    self.cidadeServico = objectUser[@"cidade"];
    self.estadoServico = objectUser[@"estado"];
    self.descricaoServico = object[@"descricao"];
    self.enderecoServico = object[@"endereco"];
    self.dataServico = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:object[@"dataServico"]];

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0){
        self.tableView.rowHeight = 76;
        HOOShowAtributosTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.textViewAtributo.editable = NO;
        cell.textViewAtributo.scrollEnabled = NO;
        
        if (indexPath.row == 0)
        {
            cell.labelTitle.text = @"Tipo:";
            cell.textViewAtributo.text = self.tipoServico;
            
        }
        
        if (indexPath.row == 1)
        {
            cell.labelTitle.text = @"Data:";
            cell.textViewAtributo.text = self.dataServico;
            
        }
        
        if (indexPath.row == 2)
        {
            cell.labelTitle.text = @"Endereço:";
            cell.textViewAtributo.scrollEnabled = YES;
            cell.textViewAtributo.text = self.enderecoServico;
            
        }
        
        if (indexPath.row == 3)
        {
            cell.labelTitle.text = @"Cidade:";
            cell.textViewAtributo.text = self.cidadeServico;
            
        }
        
        if (indexPath.row == 4)
        {
            cell.labelTitle.text = @"Estado:";
            cell.textViewAtributo.text = self.estadoServico;
            
        }
        
        return cell;
        
    } else {
        self.tableView.rowHeight = 120;

        HOOShowDescricaoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        cell.label.text = @"Descrição:";
        cell.textView.editable = NO;
        cell.textView.scrollEnabled = YES;
        cell.textView.scrollsToTop = YES;
        cell.textView.text = self.descricaoServico;
        
        return cell;
    }
    
    
}


- (void)initProperties{
}


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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
