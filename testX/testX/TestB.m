//
//  TestB.m
//  testX
//
//  Created by banxian on 2020/3/17.
//  Copyright © 2020 banxian. All rights reserved.
//

#import "TestB.h"
#import "TestX.h"
@implementation TestB

-(void)consumerFunc{
    
    [[TestX sharedInstance] consumerFunc];//最后X需要把加工过ExtMessage发送给B模块；
     
}

@end
