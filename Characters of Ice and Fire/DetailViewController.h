//
//  DetailViewController.h
//  Characters of Ice and Fire
//
//  Created by Monika Tuchowska on 4/21/14.
//  Copyright (c) 2014 Monika Tuchowska. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITableView *infoTable;
@property (strong, nonatomic) IBOutlet UITextView *bio;
@property (strong, nonatomic) NSMutableArray *yourItemsArray;
@property (strong, nonatomic) NSString *firstName, *lastName, *filePath, *alias, *sigil;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
