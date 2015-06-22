//
//  HOOListaPropostasCell.m
//  Hooli
//
//  Created by Rodrigo DAngelo Silva Machado on 6/16/15.
//  Copyright (c) 2015 Hooli. All rights reserved.
//

#import "HOOListaPropostasCell.h"

@implementation HOOListaPropostasCell

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *CellIdentifier = @"Cell";
    HOOListaPropostasCell *cell = (HOOListaPropostasCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[HOOListaPropostasCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                            reuseIdentifier:CellIdentifier];
    }
    
    cell.lbNome.text = [object objectForKey:@"nomeCompleto"];
    cell.lbPreco.text = [object objectForKey:@"proposta"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Priority: %@", [object objectForKey:@"createdAt"]];
    
    return cell;
}*/

@end
