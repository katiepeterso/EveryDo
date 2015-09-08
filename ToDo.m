//
//  ToDo.m
//  EveryDo
//
//  Created by Katherine Peterson on 2015-09-08.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithName:(NSString *)name Description:(NSString *)description Priority:(int)priority
{
    self = [super init];
    if (self) {
        self.toDoName = name;
        self.toDoDescription = description;
        self.toDoPriority = priority;
        self.isToDoComplete = NO;
    }
    return self;
}

@end
