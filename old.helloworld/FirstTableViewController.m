//
//  FirstTableViewController.m
//  old.helloworld
//
//  Created by sang alfred on 4/24/13.
//  Copyright (c) 2013 sang alfred. All rights reserved.
//

#import "FirstTableViewController.h"
#import "JSONKit.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
@synthesize result_array;

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
	// Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.view.backgroundColor = [UIColor clearColor];
    
    [self set_pull_down_enable:NO];
    
    NSString *dsFile = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ds.json"];

    
    NSData *myData = [[[NSData alloc] initWithContentsOfFile:dsFile] autorelease];
    
    NSArray *f = [myData objectFromJSONData];
    
    NSMutableArray *r = [NSMutableArray array];
    
    for (id i in f) {
        NSArray *newsArr = [i objectForKey:@"news"];
        
        for (NSDictionary *ddd in newsArr) {
            if ([[ddd objectForKey:@"image"] length]>0) {
                [r addObject:ddd];
            }
            
        }
    }
    
    self.result_array = r;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [self.result_array count];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected cell at section #%d and row #%d", indexPath.section, indexPath.row);
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }

    NSDictionary *d = [self.result_array objectAtIndex:indexPath.row];
    if ([d count]>0) {
        NSString *title = [d objectForKey:@"title"];
        cell.textLabel.text = [NSString stringWithFormat:@"#%d %@", indexPath.row,title];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"#%d  ", indexPath.row];
    }

    return cell;
}


@end
