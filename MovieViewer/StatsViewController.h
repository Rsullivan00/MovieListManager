//
//  StatsViewController.h
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController

@property NSString *oldestMovie;
@property int movieCount;
@property float averageRating;
@property NSString *bestMovie;
@property NSString *worstMovie;

@property NSMutableArray *movieList;
@property(weak, nonatomic) IBOutlet UILabel *statsLabel;

- (id) init;
- (void) setValues;
- (void) printStats;
- (IBAction) back;
@end
