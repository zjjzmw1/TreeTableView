//
//  TreeTableViewController.h
//  TreeTableView
//
//  Created by Buddy on 28/4/14.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TreeTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

///可以展开合并的表格
@property (nonatomic, strong) UITableView *treeTableView;
///表格的数据
@property(strong, nonatomic)NSMutableArray *treeResultArray;
///判断是否展开或者合上的数组.
@property (strong, nonatomic)NSMutableArray *treeOpenArray;
///判断是否展开或者合上的字符串.
@property (strong, nonatomic)NSString *treeOpenString;

///点击section的方法。
-(void)tapAction:(UIButton *)sender;
@end
