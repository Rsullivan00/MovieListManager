//
//  StatsViewController.m
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import "StatsViewController.h"
#import "Movie.h"

@implementation StatsViewController

@synthesize oldestMovie, movieCount, averageRating, bestMovie, worstMovie, movieList, statsLabel;

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
    
    [self setValues];
    [self printStats];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Designated initializer */
- (id) init
{
    if (self = [super init])
    {
        [self setValues];
    }
    
    return self;
}

- (void) setValues
{
    if (!movieList)
        return;
    
    int totalRating = 0, worstRating, bestRating;
    Movie *firstMovie = movieList[0];
    NSDate *oldestMovieDate = firstMovie.releaseDate;
    worstRating = bestRating = firstMovie.rating;
    
    oldestMovie = firstMovie.title;
    bestMovie = firstMovie.title;
    worstMovie = firstMovie.title;
    
    for (Movie *movie in movieList)
    {
        totalRating += movie.rating;
        if ([oldestMovieDate compare:movie.releaseDate] == NSOrderedDescending)
        {
            oldestMovie = movie.title;
            oldestMovieDate = movie.releaseDate;
        }
        
        if (worstRating > movie.rating)
        {
            worstMovie = movie.title;
            worstRating = movie.rating;
        }
        
        if (bestRating < movie.rating)
        {
            bestMovie = movie.title;
            bestRating = movie.rating;
        }
    }
    
    movieCount = movieList.count;
    averageRating = totalRating / movieCount;
}

- (void) printStats
{
    statsLabel.text = [NSString stringWithFormat:@"Movie count: %d\nAverage rating: %.1f\nOldest movie: %@\nLowest-rated movie: %@\nHighest-rated movie: %@", movieCount, averageRating, oldestMovie, worstMovie, bestMovie];
}

- (IBAction) back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
