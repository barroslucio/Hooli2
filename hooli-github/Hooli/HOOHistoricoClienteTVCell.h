//
//  HOOHIstoricoClienteTVCell.h
//  Hooli
//
//  Created by Lúcio Barros on 21/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOOHistoricoClienteTVCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imagemTipoServico;
@property (strong, nonatomic) IBOutlet UILabel *labelTipoServico;
@property (strong, nonatomic) IBOutlet UILabel *labelDataServico;
@property (weak, nonatomic) IBOutlet UILabel *labelPropostas;

@end
