//
//  PerfilViewController.h
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <linkedin-sdk/LISDK.h>
#import "Participante.h"
#import "AppDelegate.h"

@interface PerfilViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *autenticar;
@property (nonatomic, retain) LISDKSession *session;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (nonatomic, retain) Participante *participante;



@end
