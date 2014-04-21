//
//  Movie.m
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import "Movie.h"

@implementation Movie

@synthesize title, rating, releaseDate, director;

/* Designated initializer */
-(id) init
{
    if (self = [super init])
    {
        title = @"No title";
        rating = 0;
        releaseDate = [NSDate date];
        director = @"Rick Sullivan";
    }
    
    return self;
}

-(id) initWithTitle: (NSString *) newTitle
             rating: (int) newRating
        releaseDate: (NSDate *) newReleaseDate
           director: (NSString *) newDirector
{
    self = [self init];
    self.title = newTitle;
    self.rating = newRating;
    self.releaseDate = newReleaseDate;
    self.director = newDirector;
    
    return self;
}

@end
