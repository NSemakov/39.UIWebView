//
//  NVWebViewUIViewController.h
//  39. UIWebView
//
//  Created by Admin on 22.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVWebViewUIViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSURL* url;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonForward;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonRefresh;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonClose;

- (IBAction)actionBarButtonBack:(UIBarButtonItem *)sender;
- (IBAction)actionBarButtonForward:(UIBarButtonItem *)sender;
- (IBAction)actionBarButtonRefresh:(UIBarButtonItem *)sender;
- (IBAction)actionBarButtonClose:(UIBarButtonItem *)sender;
@end
