//
//  MyTestTreeViewController.m
//  TreeTableView
//
//  Created by Buddy on 28/4/14.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "MyTestTreeViewController.h"

@interface MyTestTreeViewController ()

@end

@implementation MyTestTreeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"可展开的表格";
    
    ///这里的resultArray可以根据需求自己定义。
    self.myResultArray = [NSMutableArray arrayWithArray:self.treeResultArray];
    ///这里的tableView可以根据需求自己定义。
    self.myTableView = self.treeTableView;

}

#pragma mark - =================自己写的tableView================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.myResultArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ///这里需要根据自己的resulArray数据结构重写父类了。
    int tempNum = (int)[[self.treeResultArray[section]objectForKey:@"country"] count];
    NSString *tempSectionString = [NSString stringWithFormat:@"%ld",(long)section];
    if ([self.treeOpenArray containsObject:tempSectionString]) {
        return tempNum;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *tempV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50)];
    tempV.backgroundColor = [UIColor colorWithRed:(236)/255.0f green:(236)/255.0f blue:(236)/255.0f alpha:1];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 2, 200, 30)];
    label1.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont fontWithName:@"Arial" size:20];
    label1.text = [self.treeResultArray[section] objectForKey:@"name"];
    
    UIImageView *tempImageV = [[UIImageView alloc]initWithFrame:CGRectMake(286, 20, 20, 11)];
    NSString *tempSectionString = [NSString stringWithFormat:@"%ld",(long)section];
    if ([self.treeOpenArray containsObject:tempSectionString]) {
        tempImageV.image = [UIImage imageNamed:@"close"];
        
    }else{
        tempImageV.image = [UIImage imageNamed:@"open"];
    }
    ///给section加一条线。
    CALayer *_separatorL = [CALayer layer];
    _separatorL.frame = CGRectMake(0.0f, 49.0f, [UIScreen mainScreen].bounds.size.width, 1.0f);
    _separatorL.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    [tempV addSubview:label1];
    [tempV addSubview:tempImageV];
    [tempV.layer addSublayer:_separatorL];
    
    UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.frame = CGRectMake(0, 0, 320, 50);
    [tempBtn addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    tempBtn.tag = section;
    [tempV addSubview:tempBtn];
    return tempV;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(void)tapAction:(UIButton *)sender{
    
    [super tapAction:sender];
    [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationFade];
}

///这个都没有执行。。。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ///下面这是类似section里面的就是国家。。。。
    static NSString *CellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = [[[self.myResultArray[indexPath.section]objectForKey:@"country"] objectAtIndex:indexPath.row] objectForKey:@"cityName"];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}














- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
