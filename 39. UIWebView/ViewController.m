//
//  ViewController.m
//  39. UIWebView
//
//  Created by Admin on 22.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "NVWebViewUIViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset=UIEdgeInsetsMake(20, 0, 0, 0);
    self.arrayOfPdf=[NSMutableArray new];
    self.arrayOfURL=[NSMutableArray new];
    self.arrayOfArraysPdfAndURL=[NSMutableArray new];
    
    
    NSString* pathPdf1=[[NSBundle mainBundle] pathForResource:@"CAMediaTiming cheat sheet.pdf" ofType:nil];
    NSURL* pdfURL1=[NSURL fileURLWithPath:pathPdf1];
    NSString* pathPdf2=[[NSBundle mainBundle] pathForResource:@"JQC.pdf" ofType:nil];
    NSURL* pdfURL2=[NSURL fileURLWithPath:pathPdf2];
    [self.arrayOfPdf addObjectsFromArray:@[pdfURL1,pdfURL2]];
    
    NSURL* urlRelative=[NSURL URLWithString:@"http://"];
    NSURL* url1=[NSURL URLWithString:@"vk.com" relativeToURL:urlRelative];
    
    NSURL* url2=[NSURL URLWithString:@"ya.ru" relativeToURL:urlRelative];
    [self.arrayOfURL addObjectsFromArray:@[url1,url2]];
    [self.arrayOfArraysPdfAndURL addObjectsFromArray:@[self.arrayOfPdf, self.arrayOfURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.arrayOfArraysPdfAndURL objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier=@"cell";
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:identifier];
    NSURL* currentURL=[[self.arrayOfArraysPdfAndURL objectAtIndex:indexPath.section]objectAtIndex:indexPath.row] ;
    cell.textLabel.text=[currentURL lastPathComponent];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.arrayOfArraysPdfAndURL count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"pdf files";
    } else {
        return @"url links";
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"segueShowWebView" sender:indexPath];
    
    
}
#pragma mark - UITableViewDelegate

#pragma mark - helpMethods
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueShowWebView"]) {
        NVWebViewUIViewController* webVC=segue.destinationViewController;
        NSURL* currentURL=[[self.arrayOfArraysPdfAndURL objectAtIndex:[(NSIndexPath *)sender section]]objectAtIndex:[(NSIndexPath *)sender row]];
        webVC.url=currentURL;
    }
}

@end
