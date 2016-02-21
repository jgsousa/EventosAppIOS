//
//  LoginViewController.h
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <linkedin-sdk/LISDK.h>
#import "Participante.h"
#import "AppDelegate.h"

@interface LoginViewController : UIViewController

@property (nonatomic, retain) LISDKSession *session;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, retain) Participante *participante;

-(void)createParticipant:(Participante *)p;
@end
