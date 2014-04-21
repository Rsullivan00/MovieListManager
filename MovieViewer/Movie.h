//
//  Movie.h
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property NSString *title;
@property int rating;
@property NSDate *releaseDate;
@property NSString *director;

-(id) init;
-(id) initWithTitle: (NSString *) newTitle
             rating: (int) newRating
        releaseDate: (NSDate *) newReleaseDate
           director: (NSString *) newDirector;
@end
