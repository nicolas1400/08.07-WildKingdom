//
//  DetailViewController.m
//  WildKingdom
//
//  Created by Nicolas Semenas on 08/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "Detail1ViewController.h"

@interface Detail1ViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate, UITabBarControllerDelegate>


@property (nonatomic,strong) NSMutableArray * photos;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation Detail1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    NSDictionary *thisPhoto = [self.photos objectAtIndex:indexPath.row];
    NSString *imageURLString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",
                                thisPhoto[@"farm"],
                                thisPhoto[@"server"],
                                thisPhoto[@"id"],
                                thisPhoto[@"secret"]];
    
    UIImage *im = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURLString]]];
    recipeImageView.image = im;
    
    [cell.layer setBorderWidth: 2.0f];
    [cell.layer setBorderColor: [UIColor whiteColor].CGColor];
    
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=30ea12d567ebaa5ab8f977f32c5940f5&format=json&nojsoncallback=1&per_page=10&tags=lion"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.photos = [[NSMutableArray alloc] init];
        self.photos = [[result objectForKey:@"photos"] objectForKey:@"photo"];
        
        [self.myCollectionView reloadData];
    }
     
     ];
}



@end
