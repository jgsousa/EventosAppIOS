//
//  Sessao.h
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sessao : NSObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * descricao;
@property (nonatomic, retain) NSDate * dataInicio;
@property (nonatomic, retain) NSDate * dataFim;

@end
