//
//  NVWebViewUIViewController.m
//  39. UIWebView
//
//  Created by Admin on 22.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVWebViewUIViewController.h"

@interface NVWebViewUIViewController ()

@end

@implementation NVWebViewUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSURLRequest* request=[NSURLRequest requestWithURL:self.url];
    //NSURLRequest* request=[[NSURLRequest alloc]initWithURL:self.url];
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionBarButtonBack:(UIBarButtonItem *)sender {
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}
- (IBAction)actionBarButtonForward:(UIBarButtonItem *)sender{
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}
- (IBAction)actionBarButtonRefresh:(UIBarButtonItem *)sender{
    [self.webView stopLoading];
    [self.webView reload];
}
- (IBAction)actionBarButtonClose:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self refreshButtonEnablingStatus];
    [self.activityIndicator startAnimating];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];


}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%@",[error debugDescription]);
}
#pragma mark - help methods
- (void) refreshButtonEnablingStatus {
    self.barButtonBack.enabled=[self.webView canGoBack];
    self.barButtonForward.enabled=[self.webView canGoForward];
}
@end
