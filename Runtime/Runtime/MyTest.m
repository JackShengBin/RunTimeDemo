//
//  MyTest.m
//  Runtime
//
//  Created by 梦想 on 2016/10/20.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "MyTest.h"

@interface MyTest (){
    
    @private
    NSString *brotherName;
}

@property (nonatomic, copy) NSString *sisterName;

@end

@implementation MyTest

- (instancetype)init{
    if (self = [super init]) {
        _name = @"林同";
        _age = 22;
        _sisterName = @"林雪";
        adress = @"山东省菏泽市";
        familyCount = 4;
        brotherName = @"林海";
        
    }
    return self;
}

- (NSString *)description{
//    NSLog(@"\n_name  %@\n_age  %d\nadress  %@\nfamilyCount  %d\nbrotherName  %@", _name, _age, adress, familyCount, brotherName);
    return [NSString stringWithFormat:@"\n_name  %@\n_age  %d\nadress  %@\nfamilyCount  %d\nbrotherName  %@", _name, _age, adress, familyCount, brotherName];
}


- (void)test1{
    NSLog(@"%s", __func__);
}

- (NSString *)test2{
    NSLog(@"%s", __func__);
    return @"test2";
}

+ (void)test3{
    NSLog(@"%s", __func__);
}

+ (NSString *)test4{
    NSLog(@"%s", __func__);
    return @"test4";
}

- (void)test5{
    NSLog(@"%s", __func__);
}

- (NSString *)test6{
    NSLog(@"%s", __func__);
    
    return @"test6";
}



@end
