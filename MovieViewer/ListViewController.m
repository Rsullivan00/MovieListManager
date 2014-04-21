//
//  ViewController.m
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import "ListViewController.h"
#import "Movie.h"
#import "StatsViewController.h"
#import "AddItemViewController.h"

@implementation ListViewController

@synthesize titleLabel, ratingLabel, releaseDateLabel, directorLabel, currentMovieNum;

static NSMutableArray *movieList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (!movieList)
    {
        movieList = [self defaultMovieList];
    }
    
        [self drawMovieByNumber:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)drawMovieByNumber: (int) num
{
    if (num < 0 || num >= movieList.count) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Movie does not exist" message:@"Selection invalid" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        
        [alert show];
        return false;
    }
    
    [self drawMovie: [movieList objectAtIndex:num]];
    return true;
}
     
- (void)drawMovie:(Movie *) movie
{
    titleLabel.text = movie.title;
    ratingLabel.text = [NSString stringWithFormat:@"Rating: %d/10", movie.rating];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy"];
    releaseDateLabel.text = [NSString stringWithFormat:@"Release date: %@", [dateFormatter stringFromDate:movie.releaseDate]];
    directorLabel.text = [NSString stringWithFormat:@"Director: %@", movie.director];
}

- (IBAction)drawNextMovie
{
    if ([self drawMovieByNumber: currentMovieNum + 1])
        currentMovieNum++;
}

- (IBAction)drawPrevMovie
{
    if ([self drawMovieByNumber: currentMovieNum - 1])
        currentMovieNum--;
}

- (IBAction)showStatsView
{
    UIStoryboard *storyboard = self.storyboard;
    
    StatsViewController *statsViewController = [storyboard instantiateViewControllerWithIdentifier:@"StatsViewController"];
    statsViewController.movieList = movieList;
    [self presentViewController:statsViewController animated:YES completion:NULL];
}

- (IBAction)addMovie
{
    UIStoryboard *storyboard = self.storyboard;
    
    AddItemViewController *addItemViewController = [storyboard instantiateViewControllerWithIdentifier:@"AddItemViewController"];
    addItemViewController.delegate = self;
    [self presentViewController:addItemViewController animated:YES completion:NULL];
}

- (NSMutableArray *)defaultMovieList
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"DD MMM YYYY"];

    return [[NSMutableArray alloc] initWithObjects:
            [[Movie alloc] initWithTitle:@"Gravity"
                                  rating:9
                             releaseDate:[dateFormatter dateFromString:@"11 Nov 2013"]
                                director:@"Alfonso Cuaron"],
            [[Movie alloc] initWithTitle:@"The Worlf of Wall Street"
                                  rating:8
                             releaseDate:[dateFormatter dateFromString:@"15 Dec 2013"]
                                director:@"Martin Scorsese"],
            [[Movie alloc] initWithTitle:@"Frozen"
                                  rating:8
                             releaseDate:[dateFormatter dateFromString:@"08 Feb 2014"]
                                director:@"Jennifer Lee"],
            [[Movie alloc] initWithTitle:@"Titanic"
                                  rating:7
                             releaseDate:[dateFormatter dateFromString:@"11 Nov 2005"]
                                director:@"James Cameron"],
            nil];
}

- (void) addItemViewController: (AddItemViewController *) controller addMovie: (Movie *) movie
{
    [movieList addObject:movie];
}


@end
