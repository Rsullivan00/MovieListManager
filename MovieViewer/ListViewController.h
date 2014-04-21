//
//  ViewController.h
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AddItemViewController.h"

@interface ListViewController : UIViewController <AddItemViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property int currentMovieNum;

- (BOOL)drawMovieByNumber: (int) num;
- (void)drawMovie:(Movie *) movie;

- (IBAction)drawNextMovie;
- (IBAction)drawPrevMovie;
- (IBAction)showStatsView;
- (IBAction)addMovie;

@end
