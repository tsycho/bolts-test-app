//
//  BFTestTasks.h
//  PortfolioAnalytics
//
//  Created by Asif Sheikh on 2/17/14.
//  Copyright (c) 2014 Asif Sheikh. All rights reserved.
//

@class BFTask;

@interface BFTestTasks : NSObject

@property(nonatomic, readonly) BFTask *parent;
@property(nonatomic, readonly) BFTask *child1;
@property(nonatomic, readonly) BFTask *child2;

@end
