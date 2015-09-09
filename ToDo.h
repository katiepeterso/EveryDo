//
//  ToDo.h
//  EveryDo
//
//  Created by Katherine Peterson on 2015-09-08.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *toDoName;
@property (nonatomic) NSString *toDoDescription;
@property (nonatomic) NSInteger toDoPriority;
@property (nonatomic) BOOL isToDoComplete;

- (instancetype)initWithName:(NSString *)name Description:(NSString *)description Priority:(NSInteger)priority;

@end
