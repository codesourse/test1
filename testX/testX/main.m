//
//  main.m
//  testX
//
//  Created by banxian on 2020/3/17.
//  Copyright © 2020 banxian. All rights reserved.
//
/*
生产消费处理。
假设在某个系统中，有个模块X需要为其它A和B两个模块服务。其主要作用为：
* 首先提供接口给A，A可以通过此接口将数据Message传递给X；
* 其次X需要将数据做一次加工，换成ExtMessage；
* 最后X需要把加工过ExtMessage发送给B模块；

注意点：
* 多线程安全性
* A可能有不止一个实例
* 将Message转换成ExtMessage比较耗时，不能阻塞A模块的调用
* X与A对接、A与B对接的接口随意命名
* 将Message转换成ExtMessage的实现可留空
*/
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestX.h"
#import "TestA.h"
#import "TestB.h"
int main(int argc, char * argv[]) {
    

    TestA *a = [[TestA alloc] init];
    [a producerFunc];
    
    TestB *b = [[TestB alloc] init];
    [b consumerFunc];
    
    
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
