//
//  HOOClienteViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "HOOAlertControllerStyle.h"
@interface HOOPerfilClienteViewController : UIViewController <UIViewControllerTransitioningDelegate>



@property (strong, nonatomic) IBOutlet UITableView *tableView;


//ARRAY DE ESTADOS
@property (nonatomic) NSArray* arrayUF;

//PIKER VIEW
@property (retain, nonatomic)  UIPickerView *pickerView;

- (IBAction)salvar:(id)sender;

+ (NSArray *)arrayUF;

@end
