//
//  TableViewController.m
//  ViewController
//
//  Created by Ios8dian on 2017/9/22.
//  Copyright © 2017年 ping222s. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<NSTableViewDataSource,NSTableViewDelegate>

@property (strong,nonatomic)NSMutableArray *dataArr;

@property (weak) IBOutlet NSButton *removeBtn;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    _dataArr = [NSMutableArray arrayWithObjects:@"111",@"222",@"333", nil];
    _removeBtn.enabled = NO;
}


- (IBAction)clickRemove:(id)sender {
    
    if (_tableview.selectedRow>=0) {
        [_dataArr removeObjectAtIndex:_tableview.selectedRow];
        [_tableview reloadData];
    }
}

- (IBAction)clickAdd:(id)sender {
    [_dataArr addObject:@""];
    [_tableview reloadData];
    
    NSInteger row = _dataArr.count - 1;
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:row];
    [self.tableview selectRowIndexes:set byExtendingSelection:YES]; //选中
}

// MARK: - NSTableViewDelegate

- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row{
    NSLog(@"didAddRowView");
}

- (void)tableView:(NSTableView *)tableView didRemoveRowView:(NSTableRowView *)rowView forRow:(NSInteger)row{
    NSLog(@"didRemoveRowView");
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    NSLog(@"shouldSelectRow");
    return YES;
}

- (BOOL)selectionShouldChangeInTableView:(NSTableView *)tableView{
    NSLog(@"selectionShouldChangeInTableView");
    return YES;
}

- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn{
    NSLog(@"didClickTableColumn");
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    NSLog(@"tableViewSelectionDidChange");
    if (_tableview.selectedRow>=0){
        _removeBtn.enabled = YES;
    }else{
        _removeBtn.enabled = NO;
    }
}

- (void)tableViewSelectionIsChanging:(NSNotification *)notification{
    NSLog(@"tableViewSelectionIsChanging");
}

// MARK: - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return _dataArr.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    return _dataArr[row];
}

@end
