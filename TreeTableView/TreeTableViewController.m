//
//  TreeTableViewController.m
//  TreeTableView
//
//  Created by Buddy on 28/4/14.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "TreeTableViewController.h"
@interface TreeTableViewController ()

@end

@implementation TreeTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.treeOpenArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ///下面是所需要的数据结构。
    ///一个国家放两个城市。
    NSMutableDictionary *cityDict1 = [NSMutableDictionary dictionary];
    [cityDict1 setObject:@"北京" forKey:@"cityName"];
    NSMutableDictionary *cityDict2 = [NSMutableDictionary dictionary];
    [cityDict2 setObject:@"上海" forKey:@"cityName"];
    NSMutableDictionary *cityDict3 = [NSMutableDictionary dictionary];
    [cityDict3 setObject:@"广州" forKey:@"cityName"];
    NSMutableDictionary *cityDict4 = [NSMutableDictionary dictionary];
    [cityDict4 setObject:@"郑州" forKey:@"cityName"];
    
    NSMutableArray *country1 = [NSMutableArray arrayWithObjects:cityDict1,cityDict2,cityDict3,cityDict4, nil];
    NSMutableDictionary *countryDict1 = [NSMutableDictionary dictionaryWithObject:country1 forKey:@"country"];
    [countryDict1 setObject:@"中国" forKey:@"name"];
    ///另一个国家放令两个城市。
    NSMutableDictionary *cityDict21 = [NSMutableDictionary dictionary];
    [cityDict21 setObject:@"华盛顿" forKey:@"cityName"];
    NSMutableDictionary *cityDict22 = [NSMutableDictionary dictionary];
    [cityDict22 setObject:@"迈阿密" forKey:@"cityName"];
    NSMutableDictionary *cityDict23 = [NSMutableDictionary dictionary];
    [cityDict23 setObject:@"波士顿" forKey:@"cityName"];
    NSMutableDictionary *cityDict24 = [NSMutableDictionary dictionary];
    [cityDict24 setObject:@"费城" forKey:@"cityName"];
    NSMutableArray *country2 = [NSMutableArray arrayWithObjects:cityDict21,cityDict22,cityDict23,cityDict24, nil];
    NSMutableDictionary *countryDict2 = [NSMutableDictionary dictionaryWithObject:country2 forKey:@"country"];
    [countryDict2 setObject:@"美国" forKey:@"name"];
    
    ///另一个国家放令两个城市。
    NSMutableDictionary *cityDict31 = [NSMutableDictionary dictionary];
    [cityDict31 setObject:@"华盛顿" forKey:@"cityName"];
    NSMutableDictionary *cityDict32 = [NSMutableDictionary dictionary];
    [cityDict32 setObject:@"迈阿密" forKey:@"cityName"];
    NSMutableDictionary *cityDict33 = [NSMutableDictionary dictionary];
    [cityDict33 setObject:@"波士顿" forKey:@"cityName"];
    NSMutableDictionary *cityDict34 = [NSMutableDictionary dictionary];
    [cityDict34 setObject:@"费城" forKey:@"cityName"];
    NSMutableArray *country3 = [NSMutableArray arrayWithObjects:cityDict31,cityDict32,cityDict33,cityDict34, nil];
    NSMutableDictionary *countryDict3 = [NSMutableDictionary dictionaryWithObject:country3 forKey:@"country"];
    [countryDict3 setObject:@"美国" forKey:@"name"];
    
    self.treeResultArray = [NSMutableArray arrayWithObjects:countryDict1,countryDict2,countryDict3, nil];
    
    
    ///原来下面几句都在viewDidLoad 里面，所以很卡。。。
    if (self.treeTableView==nil||self.treeTableView==NULL) {
        self.treeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-64) style:UITableViewStylePlain];
        self.treeTableView.delegate = self;
        self.treeTableView.dataSource = self;
        self.treeTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self.view addSubview:self.treeTableView];
        if ([self.treeTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.treeTableView setSeparatorInset:UIEdgeInsetsZero];
        }
    }
}

#pragma mark - =================自己写的tableView================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int tempCount = (int)self.treeResultArray.count;
    return tempCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    self.treeOpenString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    
    if ([self.treeOpenArray containsObject:self.treeOpenString]) {
        [self.treeOpenArray removeObject:self.treeOpenString];
    }else{
        [self.treeOpenArray addObject:self.treeOpenString];
    }
    ///下面一句是用的时候刷新的。
//    [self.treeTableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationFade];
    
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
    cell.textLabel.text = [[[self.treeResultArray[indexPath.section]objectForKey:@"country"] objectAtIndex:indexPath.row] objectForKey:@"cityName"];
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
