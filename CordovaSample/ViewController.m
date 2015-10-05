/*
 Copyright 2015 XWebView
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

#import <WebKit/WebKit.h>
#import <XWebView/XWebView.h>
#import <Device/Device.h>
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WKWebView *webview = [[WKWebView alloc] initWithFrame:self.view.frame];
    webview.scrollView.bounces = NO;
    [self.view addSubview:webview];

    [webview loadCordovaPlugins:self];

    NSURL *root = [[NSBundle mainBundle] resourceURL];
    if (root) {
        NSError *error;
        NSURL *url = [root URLByAppendingPathComponent:@"index.html"];
        if ([url checkResourceIsReachableAndReturnError:&error]) {
            [webview loadFileURL:url allowingReadAccessToURL:root];
        } else {
            [webview loadHTMLString:error.description baseURL:nil];
        }
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
