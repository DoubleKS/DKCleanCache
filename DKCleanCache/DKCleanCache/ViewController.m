//
//  ViewController.m
//  DKCleanCache
//
//  Created by doublek on 2017/6/27.
//  Copyright © 2017年 doublek. All rights reserved.
//

#import "ViewController.h"
#import "DKCleanCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.center = self.view.center;
    button.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(clearCaches) forControlEvents:UIControlEventTouchUpInside];
}


-(void)clearCaches{
    
    
    //获取当前需要清除文件的路径
    NSString *path = [DKCleanCache getDocumentDirectory];
    //文件大小
    CGFloat totalCaches = [DKCleanCache sizeWithFilePath:path];
    
    NSString *message = [NSString stringWithFormat:@"缓存大小为%.2fM",totalCaches];
    
   //提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您确定要清楚缓存?" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"清除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
        //清除文件
        BOOL resust = [DKCleanCache clearCachesFromDirectoryPath:path];
        
        if (resust) {
            NSLog(@"成功清除%.2fM文件",totalCaches);
        }
  
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
