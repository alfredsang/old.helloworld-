//
//  FirstTableViewController.h
//  old.helloworld
//
//  Created by sang alfred on 4/24/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageListViewController.h"
#import "ListViewController.h"


@interface FirstTableViewController : ListViewController
/**
 * table数据源
 */
@property(nonatomic,retain,readwrite) NSMutableArray *result_array;

@end
