//
//  FirstViewController.h
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessoesViewController : UITableViewController

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) NSMutableDictionary *datas;

@end

