//
//  HOOServicosDisponiveisTVCellTableViewCell.h
//  Hooli
//
//  Created by Lúcio Barros on 15/06/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOOServicosDisponiveisTVCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *tipoServico;
@property (strong, nonatomic) IBOutlet UILabel *dataServico;
@property (strong, nonatomic) IBOutlet UIImageView *imagemServico;

@end
