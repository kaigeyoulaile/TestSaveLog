//
//  ViewController.m
//  TestSaveLog
//
//  Created by 吴凯 on 2019/6/15.
//  Copyright © 2019年 吴凯. All rights reserved.
//

#import "ViewController.h"
#import <SSZipArchive/SSZipArchive.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Klog(@"首页展示");
}
- (IBAction)buttonOneClick:(UIButton *)sender {
    Klog(@"按钮1点击");
}
- (IBAction)buttonTwoClick:(UIButton *)sender {
    Klog(@"按钮2点击");
}
- (IBAction)buttonThreeClick:(UIButton *)sender {
    Klog(@"按钮3点击");
}
- (IBAction)buttonFourClick:(UIButton *)sender {
    Klog(@"按钮4点击");
}

- (IBAction)zipButtonClick:(UIButton *)sender {
    [self zipInformation];
}
//压缩文件
- (void)zipInformation{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"log.log"];
    NSString *zipFileName = [NSString stringWithFormat:@"ziplog.zip"];
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];//日志文件路径
    NSString *zipFilePath = [documentDirectory stringByAppendingPathComponent:zipFileName];//压缩文件路径
    
    //删除已经存在的压缩文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:zipFilePath error:nil];
    
    //[SSZipArchive createZipFileAtPath:zipFilePath withContentsOfDirectory:logFilePath];
    [SSZipArchive createZipFileAtPath:zipFilePath withFilesAtPaths:[NSArray arrayWithObject:logFilePath]];
    
    //如果需要上传，可以将压缩文件转为nsdata
    //NSData *logData = [NSData dataWithContentsOfFile:zipFilePath];
}
@end
