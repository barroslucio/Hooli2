//
//  HOOClienteViewController.h
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/9/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface HOOCadastroClienteViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)salvar:(id)sender;
@end
