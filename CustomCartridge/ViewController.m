//
//  ViewController.m
//  CustomCartridge
//
//  Created by 张杰 on 2017/12/15.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"
#import "ShowViewController.h"
@interface ViewController ()
- (IBAction)choice:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
- (IBAction)customBtn:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)choice:(UIButton *)sender {
    NSArray *arr = @[@"111",@"222",@"333"];
    NSArray *arrID = @[@"111ID",@"222ID",@"333ID"];
    CustomViewController *customVc = [[CustomViewController alloc]init];
    customVc.itemArr = [NSMutableArray arrayWithArray:arr];
    customVc.itemIDArr = [NSMutableArray arrayWithArray:arrID];
    customVc.topAndBottomHight = 50;//上下间距
    customVc.leftAndRightWide = 50;//左右间距
    //上下左右间距可调，详见NeedViewController
    customVc.labeltitle = ^(NSString *title){
        NSLog(@"title ========= %@",title);
        self.textLabel.text = title;
    };
    customVc.labeltitleID = ^(NSString *titleID){
        NSLog(@"titleID ========= %@",titleID);
    };
    [self presentViewController:customVc animated:YES completion:nil];
}
- (IBAction)customBtn:(UIButton *)sender {
    ShowViewController *customVc = [[ShowViewController alloc]init];
    customVc.topAndBottomHight = 50;//上下间距
    customVc.leftAndRightWide = 50;//左右间距
    //如需反向传值，可以参考CustomViewController
    [self presentViewController:customVc animated:YES completion:nil];
    
}
@end
