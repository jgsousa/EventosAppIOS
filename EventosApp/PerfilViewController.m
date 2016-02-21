//
//  PerfilViewController.m
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import "PerfilViewController.h"


@interface PerfilViewController ()

@end

@implementation PerfilViewController

@synthesize session;
@synthesize name;
@synthesize headline;
@synthesize picture;
@synthesize autenticar;
@synthesize participante;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:appDelegate.participante.pictureUrl]];
    picture.image = [UIImage imageWithData:imageData];
    self.name.text = appDelegate.participante.nome;
    self.headline.text = appDelegate.participante.headline;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onAuthenticatePress:(UIButton *)sender {


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
