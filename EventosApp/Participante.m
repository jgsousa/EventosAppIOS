//
//  Participante.m
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import "Participante.h"

@implementation Participante

@synthesize nome;
@synthesize headline;
@synthesize pictureUrl;
@synthesize perfilLinkedIn;
@synthesize memberId;

-(NSData*)createJSONFromObject{
    NSError *error = nil;
    NSData *json;
    NSDictionary *dict = @{@"nome" : self.nome,
                           @"headline" : self.headline,
                           @"pictureUrl" : self.pictureUrl,
                           @"memberId": self.memberId,
                           @"perfilLinkedIn": self.perfilLinkedIn,
                           @"eventoId": @"56c9e1ac11b5690700f94b75"};
    if ([NSJSONSerialization isValidJSONObject:dict])
    {
        // Serialize the dictionary
        json = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        
        // If no errors, let's view the JSON
        if (json != nil && error == nil)
        {
            NSString *jsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
            
            NSLog(@"JSON: %@", jsonString);
            return json;
        }
    }
    return nil;
}
@end
