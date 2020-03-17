//
//  TestX.h
//  testX
//
//  Created by banxian on 2020/3/17.
//  Copyright © 2020 banxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "ExtMessage.h"

//singleton
#undef    QTS_SINGLETON
#define   QTS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef    QTS_DEF_SINGLETON
#define   QTS_DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}


//implementation
#undef QTS_Implementation
#define   QTS_Implementation( __name )\
@implementation __name\
@end

#undef    QTS_Implementation_Unend
#define   QTS_Implementation_Unend( __name )\
@implementation __name\


NS_ASSUME_NONNULL_BEGIN

@interface TestX : NSObject

-(void)producerFunc:(Message *)message;
-(void)consumerFunc;
QTS_SINGLETON (TestX)
@end

NS_ASSUME_NONNULL_END
