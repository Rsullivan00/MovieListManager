//
//  AddItemViewController.m
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import "AddItemViewController.h"
#import "ListViewController.h"
#import "Movie.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

@synthesize titleTF, ratingTF, releaseDateTF, directorTF, delegate;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) submit
{
    Movie *newMovie = [[Movie alloc] init];
    newMovie.title = titleTF.text;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    newMovie.rating = (int)[formatter numberFromString:ratingTF.text];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"DD MMM YYYY"];
    newMovie.releaseDate = [dateFormatter dateFromString:releaseDateTF.text];
    
    newMovie.director = directorTF.text;
    
    [self.delegate addItemViewController:self addMovie:newMovie];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
