//
//  PhotoBaseWebView.m
//  photoTutorial
//
//  Created by het on 2017/5/24.
//  Copyright © 2017年 jacob. All rights reserved.
//

#import "PhotoBaseWebView.h"

@interface PhotoBaseWebView ()

@end

@implementation PhotoBaseWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]];
    [self.view addSubview: webView];
    [webView loadRequest:request];}



@end
