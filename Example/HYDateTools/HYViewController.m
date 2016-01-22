//
//  HYViewController.m
//  HYDateTools
//
//  Created by yclzone on 01/18/2016.
//  Copyright (c) 2016 yclzone. All rights reserved.
//

#import "HYViewController.h"
#import "HYDateTools.h"

@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [[NSDate date] hy_dateByAddingUnit:NSCalendarUnitDay
                                 value:-7];
    
//    NSInteger year = [[NSDate date] hy_year];
    
    NSDate *date = [NSDate date];
    
    NSLog(@"%zd-%zd-%zd %zd:%zd:%zd \n weekday:%zd \n weekOfMonth:%zd \n weekOfYear:%zd",
          date.hy_year, date.hy_month, date.hy_day,
          date.hy_hour, date.hy_minute, date.hy_second,
          date.hy_weekday,
          date.hy_weekOfMonth,
          date.hy_weekOfYear);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
