//
//  ExampleObjCViewController.m
//  HomeSearch
//
//  Created by iOS Swift Course on 1/8/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

#import "ExampleObjCViewController.h"

@interface ExampleObjCViewController ()
@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;

@end

@implementation ExampleObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.exampleLabel.text = @"Hello, world";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
