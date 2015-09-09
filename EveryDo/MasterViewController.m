//
//  MasterViewController.m
//  EveryDo
//
//  Created by Katherine Peterson on 2015-09-08.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"
#import "AddNewToDoVC.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource, AddNewToDoDelegate>

@property NSMutableArray *toDoTasks;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    ToDo *laundry = [[ToDo alloc]initWithName:@"Laundry" Description:@"Take dirty clothes to the laundromat. Wash and dry clothes in two separate loads, one for light-colored clothes and one for dark-colored clothes." Priority:3];
    ToDo *run = [[ToDo alloc]initWithName:@"Go for a Run" Description:@"Run a seven mile loop, starting from home, including the stairs up Crescent Heights Hill. The pace should be such that the whole run is moderately hard work." Priority:2];
    ToDo *groceries = [[ToDo alloc]initWithName:@"Get Groceries" Description:@"Purchase eggs, coffee cream, two steaks and 40 ice cream bars from Lukes after dropping Chris off for work." Priority:3];
    ToDo *pullWeeds = [[ToDo alloc]initWithName:@"Pull Weeds" Description:@"Pull weeds from the walkway and garden boxes in the back yard." Priority:1];
    
    run.isToDoComplete = YES;
    
    NSArray *toDoArray = @[laundry, run, groceries, pullWeeds];
    self.toDoTasks = [NSMutableArray new];
    [self.toDoTasks addObjectsFromArray:toDoArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Segues and Delegates

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.toDoTasks[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

- (void)insertNewObject:(id)sender {
    if (!self.toDoTasks) {
        self.toDoTasks = [[NSMutableArray alloc] init];
    }
    
    AddNewToDoVC *addNewVC = (AddNewToDoVC *)[self.storyboard instantiateViewControllerWithIdentifier: @"AddNewToDoVC"];
    addNewVC.delegate = self;
    [self presentViewController:addNewVC animated:YES completion:nil];
}

-(void)sendTitle:(NSString *)title Description:(NSString *)description Priority:(NSInteger)priority Completion:(BOOL)isComplete {
    ToDo *userAddedToDo = [[ToDo alloc]initWithName:title Description:description Priority:priority];
    userAddedToDo.isToDoComplete = isComplete;
    [self.toDoTasks addObject:userAddedToDo];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoTasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *toDoCell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];

    ToDo *task = self.toDoTasks[indexPath.row];
//    toDoCell.titleLabel.text = task.toDoName;
    toDoCell.descriptionLabel.text = task.toDoDescription;
    toDoCell.priorityImage.image = [UIImage imageNamed:[[NSString stringWithFormat:@"%ld", (long)task.toDoPriority]stringByAppendingString:@"StarsSmall"]];
    
    if (task.isToDoComplete) {
        NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:task.toDoName attributes:attributes];
        
        toDoCell.titleLabel.attributedText = attributedString;
        
    } else {
        toDoCell.titleLabel.text = task.toDoName;
    }

    return toDoCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoTasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end