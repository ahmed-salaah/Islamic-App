//
//  FehrasCell.m
//  Islamic
//
//  Created by Ahmed Salah on 11/10/15.
//  Copyright © 2015 ITworx. All rights reserved.
//

#import "FehrasCell.h"

@implementation FehrasCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"FehrasCell" owner:nil options:nil]
                lastObject];
    
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
