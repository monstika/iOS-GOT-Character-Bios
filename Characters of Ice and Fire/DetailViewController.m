//
//  DetailViewController.m
//  Characters of Ice and Fire
//
//  Created by Monika Tuchowska on 4/21/14.
//  Copyright (c) 2014 Monika Tuchowska. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"firstName"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *firstName = [[_detailItem valueForKey:@"firstName"] description];
    NSString *lastName = [[_detailItem valueForKey:@"lastName"] description];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@", firstName,lastName];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, 2000.0)];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    _scrollView.contentInset = contentInsets;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
