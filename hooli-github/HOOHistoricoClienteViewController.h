//
//  HOOHistóricoClienteViewController.h
//  Hooli
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 11/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOODetalhesServicoClienteViewController.h"
#import "HOOHistoricoClienteTVCell.h"

@interface HOOHistoricoClienteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedAction:(id)sender;

@end
