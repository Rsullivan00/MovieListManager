//
//  AddItemViewController.h
//  MovieViewer
//
//  Created by rick michael sullivan on 4/20/14.
//  Copyright (c) 2014 Rick Sullivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@class AddItemViewController;

@protocol AddItemViewControllerDelegate <NSObject>
- (void) addItemViewController: (AddItemViewController *) controller addMovie: (Movie *) movie;
@end

@interface AddItemViewController : UIViewController

@property IBOutlet UITextField *titleTF;
@property IBOutlet UITextField *ratingTF;
@property IBOutlet UITextField *releaseDateTF;
@property IBOutlet UITextField *directorTF;

@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

- (IBAction) submit;
- (IBAction) back;
@end
