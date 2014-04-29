//
//  MyTestTreeViewController.h
//  TreeTableView
//
//  Created by Buddy on 28/4/14.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "TreeTableViewController.h"

@interface MyTestTreeViewController : TreeTableViewController

///创建自己的tableView和resultArray
@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *myResultArray;

@end
