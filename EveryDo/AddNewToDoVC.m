//
//  AddNewToDoVC.m
//  EveryDo
//
//  Created by Katherine Peterson on 2015-09-08.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "AddNewToDoVC.h"

@interface AddNewToDoVC ()
@property (strong, nonatomic) IBOutlet UITextField *addNewTitleField;
@property (strong, nonatomic) IBOutlet UITextView *addNewDescriptionView;
@property (strong, nonatomic) IBOutlet UITextField *addNewPriorityField;
@property (strong, nonatomic) IBOutlet UIButton *addNewCompletionButton;
@property (nonatomic) BOOL completionButtonChecked;

@end

@implementation AddNewToDoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.addNewCompletionButton setTitle:@"\u2610" forState:UIControlStateNormal];
    self.completionButtonChecked = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}

- (IBAction)markComplete:(UIButton *)sender {
    
    if (self.completionButtonChecked) {
        [self.addNewCompletionButton setTitle:@"\u2610" forState:UIControlStateNormal];
        self.completionButtonChecked = NO;
    }
    else {
        [self.addNewCompletionButton setTitle:@"\u2611" forState:UIControlStateNormal];
        self.completionButtonChecked = YES;
    }
}

- (IBAction)addToDo:(UIButton *)sender {
    [self.delegate sendTitle:self.addNewTitleField.text Description:self.addNewDescriptionView.text Priority:self.addNewPriorityField.text.integerValue Completion:self.completionButtonChecked];
    [sender resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
