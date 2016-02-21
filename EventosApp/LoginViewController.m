//
//  LoginViewController.m
//  EventosApp
//
//  Created by Joao Sousa on 21/02/16.
//  Copyright © 2016 Joao Sousa. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize session;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(UIButton *)sender {
    
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [LISDKSessionManager
     createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, nil]
     state:nil
     showGoToAppStoreDialog:YES
     successBlock:^(NSString *returnState) {
         NSLog(@"%s","success called!");
         session = [[LISDKSessionManager sharedInstance] session];
         NSString *url = @"https://api.linkedin.com/v1/people/~:(id,email-address,headline,industry,first-name,last-name,formatted-name,picture-urls::(original),public-profile-url,picture-url)?format=json";
         [[LISDKAPIHelper sharedInstance] getRequest:url
                                             success:^(LISDKAPIResponse *response)
          {
              NSData *jsonData = [response.data dataUsingEncoding:NSUTF8StringEncoding];
              NSDictionary *result = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                     options:0
                                                                       error:NULL];
              appDelegate.participante = [[Participante alloc] init];
              appDelegate.participante.nome = [result objectForKey:@"formattedName"];
              appDelegate.participante.pictureUrl = [result objectForKey:@"pictureUrl"];
              appDelegate.participante.headline = [result objectForKey:@"headline"];
              appDelegate.participante.memberId = [result objectForKey:@"id"];
              appDelegate.participante.perfilLinkedIn = [result objectForKey:@"publicProfileUrl"];
              NSDictionary *pictures = [result objectForKey:@"pictureUrls"];
              appDelegate.participante.pictureUrl = [[pictures objectForKey:@"values"] objectAtIndex:0];
              [self createParticipant:appDelegate.participante];
              dispatch_async(dispatch_get_main_queue(), ^{
                  [self performSegueWithIdentifier:@"start" sender:sender];
              });
              
          }
                                               error:^(LISDKAPIError *error)
          {
              
          }];
         
     }
     errorBlock:^(NSError *error) {
         NSLog(@"%s","error called!");
     }
     ];
}

- (void)createParticipant:(Participante *)p{
    NSData *json = [p createJSONFromObject];
    NSURL *url = [NSURL URLWithString:@"https://dc-events.herokuapp.com/participantes/create"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *ses = [NSURLSession sharedSession];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [json length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: json];
    NSURLSessionDataTask *task = [ses dataTaskWithRequest:request
                                        completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error)
                                  {
                                      NSString *s = @"3232";
                                  }];
    
    [task resume];
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
