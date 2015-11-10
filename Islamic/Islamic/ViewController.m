//
//  ViewController.m
//  Islamic
//
//  Created by Ahmed Salah on 11/2/15.
//  Copyright © 2015 ITworx. All rights reserved.
//

#import "ViewController.h"
#import "pageAppViewController.h"
#import "SurahTableViewController.h"
#define HesnElmuslim        1001
#define MawaketElSala       1002
#define alQur2an            1003
#define BarkiatTahne2a      1004
#define alQibla             1005
#define alTaree5            1006
#define asma2Allah          1007
#define SawteyatWeMar2yat   1008
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case HesnElmuslim:
        
        break;
        case MawaketElSala:
        
        break;
        case alQur2an:{

          SurahTableViewController  *suraViewCont = [[SurahTableViewController alloc] initWithNibName:@"SurahTableViewController" bundle:nil];
            [self.navigationController pushViewController:suraViewCont animated:YES];
        }
        break;
        case BarkiatTahne2a:
        
        break;
        case alQibla:
        
        break;
        case alTaree5:
        
        break;
        case asma2Allah:
        
        break;
        case SawteyatWeMar2yat:
        
        break;
        default:
        break;
    }
}
@end
