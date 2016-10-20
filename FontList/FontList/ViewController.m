//
//  ViewController.m
//  FontList
//
//  Created by  on 2016/10/20.
//  Copyright © 2016年 xywyxywy. All rights reserved.
//

#import "ViewController.h"


#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@interface ViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource1;
@property (nonatomic, strong) NSArray *dataSource2;
@property (nonatomic, strong) NSString *systemName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIFont *system = [UIFont systemFontOfSize:16.0];
    self.systemName = system.fontName;
    
    self.dataSource1 = [UIFont familyNames];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i<self.dataSource1.count; i++)
    {
        NSArray *obj = [UIFont fontNamesForFamilyName:self.dataSource1[i]];
        [temp addObject:obj];
    }
    self.dataSource2 = [NSArray arrayWithArray:temp];

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                              style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - Table Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource2.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource2[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MyViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSArray *list = _dataSource2[indexPath.section];
    NSString *name = list[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"是否放弃本次模拟考试____%@",name];
    cell.textLabel.font = [UIFont fontWithName:name size:16.0];
    cell.textLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];

    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    header.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH - 32 , 30)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:20.0];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    [header addSubview:label];
    
    label.text = _dataSource1[section];
    
    if ([label.text isEqualToString:self.systemName])
    {
        label.backgroundColor = [UIColor lightGrayColor];
    }
    
    return header;
}

@end
