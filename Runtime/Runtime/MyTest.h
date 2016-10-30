//
//  MyTest.h
//  Runtime
//
//  Created by 梦想 on 2016/10/20.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTest : NSObject{
    NSString *adress;
    
    @private
    int familyCount;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

+ (void)test3;

+ (NSString *)test4;

- (void)test5;

- (NSString *)test6;


@end
