//
//  CustomViewController.m
//  CustomCartridge
//
//  Created by 张杰 on 2017/12/18.
//  Copyright © 2017年 张杰. All rights reserved.
//

//说明：此界面UI可以自定义，可以做出选项UI，或者展示UI等。

#import "CustomViewController.h"

@interface CustomViewController ()<UITableViewDelegate,UITableViewDataSource>
- (IBAction)close:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settheroundedcorners];//如果有需求，可以设置圆角显示。
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"choiceCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell" forIndexPath:indexPath];
    if (self.itemArr.count > 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.itemArr[indexPath.row]];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.itemArr.count > 0) {
        self.labeltitle(self.itemArr[indexPath.row]);
    }
    if (self.self.itemIDArr.count>0) {
        self.labeltitleID([NSString stringWithFormat:@"%@",self.itemIDArr[indexPath.row]]);
    }
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)close:(UIButton *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
