//
//  AppDelegate.h
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Participante.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) Participante *participante;

@end

