//
//  TestA.m
//  testX
//
//  Created by banxian on 2020/3/17.
//  Copyright © 2020 banxian. All rights reserved.
//

#import "TestA.h"
#import "TestX.h"
 
@class ExtMessage;
@implementation TestA
-(void)producerFunc{
     
    Message *message = [[Message alloc] init];
    message.msg = @"hello";
    [[TestX sharedInstance] producerFunc:message];//首先提供接口给A，A可以通过此接口将数据Message传递给X；
    
}
@end
