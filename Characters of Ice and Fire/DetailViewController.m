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
    _yourItemsArray = [[NSMutableArray alloc] initWithObjects:@"item 01", @"item 02", @"item 03", nil];
    [super viewDidLoad];
    
    _firstName = [[_detailItem valueForKey:@"firstName"] description];
    _lastName = [[_detailItem valueForKey:@"lastName"] description];
    _filePath = [[_detailItem valueForKey:@"info"] description];
    _sigil = [[_detailItem valueForKey:@"sigil"] description];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@", _firstName,_lastName];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, 2000.0)];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    _scrollView.contentInset = contentInsets;
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource: _filePath ofType:@"txt"];
    NSError *err = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath
                                                       encoding:NSUTF8StringEncoding
                                                          error:&err];
    if (fileContents == nil) {
        NSLog(@"Error reading file");
    } else {
        _bio.text = fileContents;
    }
    
    CGFloat fixedWidth = _bio.frame.size.width;
    CGSize newSize = [_bio sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = _bio.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    _bio.frame = newFrame;
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_yourItemsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //[self configureCell:cell atIndexPath:indexPath];
    cell.textLabel.text = @"HI I AM A CELL";
    cell.detailTextLabel.text = @"meow";
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
