//
//  FirstViewController.m
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import "SessoesViewController.h"
#import "Sessao.h"
#import <linkedin-sdk/LISDK.h>

@interface SessoesViewController ()

@end

@implementation SessoesViewController

@synthesize datas;
@synthesize dateFormatter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];


}


- (void)viewWillAppear:(BOOL)animated {
    datas = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSURL *url = [NSURL URLWithString:@"https://dc-events.herokuapp.com/sessoes"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error)
     {
         if (data.length > 0 && error == nil)
         {
             NSArray *result = [NSJSONSerialization JSONObjectWithData:data
                                                               options:0
                                                                 error:NULL];
             
             for (NSDictionary *item in result) {
                 Sessao *sessao = [[Sessao alloc] init ];
                 sessao.id = [item objectForKey:@"_id"];
                 sessao.nome = [item objectForKey:@"nome"];
                 sessao.descricao = [item objectForKey:@"descricao"];
                 sessao.dataInicio = [dateFormatter dateFromString:[item objectForKey:@"dataInicio"]];
                 sessao.dataFim = [dateFormatter dateFromString:[item objectForKey:@"dataFim"]];;
                 
                 NSString *data = [item objectForKey:@"dataInicio"];
                 NSMutableArray *s = [datas objectForKey:data];
                 if (s == nil){
                     s = [[NSMutableArray alloc] initWithCapacity:0];
                     [s addObject:sessao];
                     [datas setObject:s forKey:data];
                 }
                 else {
                     [s addObject:sessao];
                 }
                 
                 
             }
         }
         dispatch_async(dispatch_get_main_queue(), ^{
             [self.tableView reloadData];
         });
     }];
    [task resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSArray *s = [[datas allValues] objectAtIndex:section];
    
    return s.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    sectionName = [[datas allKeys] objectAtIndex:section];
    
    sectionName = [sectionName substringToIndex:10];
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Item" forIndexPath:indexPath];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Item"];
    }
    //Configure the cell...
    NSArray *sessoes = [[datas allValues] objectAtIndex:indexPath.section];
    Sessao *sessao = [sessoes objectAtIndex:indexPath.row];
    cell.textLabel.text = sessao.nome;
    cell.detailTextLabel.text = sessao.descricao;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //self.selectedLista = [listas objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"Items" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}
@end
