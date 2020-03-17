//
//  TestX.m
//  testX
//
//  Created by banxian on 2020/3/17.
//  Copyright © 2020 banxian. All rights reserved.
//



#import "TestX.h"

@interface TestX ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) ExtMessage *ext;
@end

@implementation TestX

QTS_DEF_SINGLETON( TestX );

//生产者生成数据
-(void)producerFunc:(Message *)message
{
    dispatch_queue_t t = dispatch_queue_create("aaaa", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(t, ^{
        
        while (YES) {
            dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
            [self msgExchange:message];//其次X需要将数据做一次加工，换成ExtMessage；
            dispatch_semaphore_signal(self.semaphore);
        }
 
    });
}

//消费者消费数据
-(void)consumerFunc{

    dispatch_queue_t t1 = dispatch_queue_create("bbbb", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(t1, ^{
        
        while (YES) {
            if (self.ext.msg !=nil) {
                dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
                NSLog(@"消费了%@",self.ext.msg);
                self.ext.msg = nil;
                dispatch_semaphore_signal(self.semaphore);
            }
        }
    });
}

-(void)msgExchange:(Message *)message
{
    int t = random()%10;
    self.ext.msg = [NSString stringWithFormat:@"%@,%d",message.msg,t];
    NSLog(@"生产了%@",self.ext.msg);
}

- (ExtMessage *)ext{
    if (!_ext) {
        _ext = [[ExtMessage alloc] init];
    }
    return  _ext;
}

- (dispatch_semaphore_t)semaphore{
    if (!_semaphore) {
        _semaphore = dispatch_semaphore_create(1);
    }
    return _semaphore;
}

@end
