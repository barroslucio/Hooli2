//
//  HOOCadastroProffisionalViewController.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 08/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOAlertControllerStyle.h"
#import "HOOServicosDisponiveisViewController.h"
#import "HOOPerfilClienteViewController.h"

@interface HOOCadastroProfissionalViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;


@end
