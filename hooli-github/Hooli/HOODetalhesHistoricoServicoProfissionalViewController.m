//
//  HOODetalhesHistoricoServicoProfissionalViewController.m
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOODetalhesHistoricoServicoProfissionalViewController.h"

@interface HOODetalhesHistoricoServicoProfissionalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelTipo;

@property (weak, nonatomic) IBOutlet UILabel *labelData;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescricao;
@end

@implementation HOODetalhesHistoricoServicoProfissionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initProperties];
    NSLog(@"\n---teste%@", self.idServico);
    PFQuery *query = [PFQuery queryWithClassName:@"Servico"];
    [query whereKey:@"objectId" equalTo:self.idServico];
    PFObject *object =[query getFirstObject];
    

    self.labelTipo.text = object[@"tipo"];
    self.labelData.text = [HOODetalhesHistoricoServicoProfissionalViewController dateFormatter:[NSString stringWithFormat: @"%@", object[@"dataServico"]]];
    self.textViewDescricao.text = object[@"descricao"];
    
    
}


- (void)initProperties{
    self.textViewDescricao.editable = NO;
}


//Método de classe para formatar a date que vem do Parse
+ (NSString *)dateFormatter:(NSString *)data{
    
    NSRange rangeAno = NSMakeRange(0, 4);
    NSRange rangeMes = NSMakeRange(5, 2);
    NSRange rangeDia = NSMakeRange(8, 2);
    
    NSString *formatter = [NSString stringWithFormat:@"%@-%@-%@",
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
