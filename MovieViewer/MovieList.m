//
//  MovieList.m
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import "MovieList.h"
#import "Movie.h"

@implementation MovieList

@synthesize movieList;

/* Designated initializer */
-(id) init
{
    if (self = [super init])
    {
        self.movieList = [[NSMutableArray alloc] initWithObjects:
                          [[Movie alloc] init], nil];
    }
    
    return self;
}
    
@end
