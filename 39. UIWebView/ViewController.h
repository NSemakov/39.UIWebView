//
//  ViewController.h
//  39. UIWebView
//
//  Created by Admin on 22.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray* arrayOfPdf;
@property (strong,nonatomic) NSMutableArray* arrayOfURL;
@property (strong,nonatomic) NSMutableArray* arrayOfArraysPdfAndURL;
@end

