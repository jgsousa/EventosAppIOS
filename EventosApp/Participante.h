//
//  Participante.h
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Participante : NSObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * memberId;
@property (nonatomic, retain) NSString * pictureUrl;
@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSString * perfilLinkedIn;
@property (nonatomic, retain) NSString * eventoId;


-(NSData*)createJSONFromObject;
@end
