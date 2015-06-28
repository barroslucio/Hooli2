//
//  HOOPerfilProfissionalViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/15/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOAlertControllerStyle.h"
#import "HOOServicosDisponiveisViewController.h"
#import "HOOPerfilClienteViewController.h"

@interface HOOPerfilProfissionalViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;


- (IBAction)salvar:(id)sender;

@end
