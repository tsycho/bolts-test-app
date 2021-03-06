//
//  BFTestTasks.m
//  PortfolioAnalytics
//
//  Created by Asif Sheikh on 2/17/14.
//  Copyright (c) 2014 Asif Sheikh. All rights reserved.
//

#import "BFTestTasks.h"

#import "BFTask.h"
#import "BFTaskCompletionSource.h"

@implementation BFTestTasks

- (instancetype)init {
  self = [super init];
  if (self) {
    _delayedTask = [BFTask taskWithDelay:2000];
    _parent = [[self class] childTaskForParent:_delayedTask withName:@"parent"];
    _child1 = [[self class] childTaskForParent:_parent withName:@"child1"];
    _child2 = [[self class] childTaskForParent:_parent withName:@"child2"];

    NSLog(@"delayedTask: %@", _delayedTask);
    NSLog(@"parent: %@", _parent);
    NSLog(@"child1: %@", _child1);
    NSLog(@"child2: %@", _child2);
    NSLog(@"");
  }
  return self;
}

#pragma mark - Private

+ (BFTask *)childTaskForParent:(BFTask *)parent withName:(NSString *)taskName {
  return [parent continueWithBlock:^id(BFTask *task) {
    if (task.isCancelled) {
      NSLog(@"%@ cancelled: %@", taskName, task);
    } else if (task.isCompleted) {
      NSLog(@"%@ completed: %@", taskName, task);
    }
    return taskName;
  }];
}

@end
