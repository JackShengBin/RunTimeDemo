//
//  ViewController.m
//  Runtime
//
//  Created by 梦想 on 2016/10/20.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "ViewController.h"
#import "MyTest.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyTest *test = [[MyTest alloc] init];
    
//    [self getAllAttributesName:test];
//    [self getAllVarWithItem:test];
//    [self setIvarWithItem:test];
//    NSLog(@"test  %@", test);
//    [self getAllMethodWithItem:test];
    [self addMethodWithItem:test];
    [self getAllMethodWithItem:test];
}
/**
 获取类中属性名
 */
- (void)getAllAttributesName:(id)item{
    
    unsigned int outCount;
    //获取属性列表
    objc_property_t *list = class_copyPropertyList([item class], &outCount);
    //遍历
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = list[i];
        //获取属性名
        const char *pName = property_getName(property);
        NSLog(@"pName   %s", pName);
        NSString *name = [NSString stringWithUTF8String:pName];
        NSLog(@"name   %@", name);
    }
    free(list);
}
/**
 获取类中所有变量名和类型
 */
- (void)getAllVarWithItem :(id)item{
    unsigned int outCount;
    //获取变量列表
    Ivar *vars = class_copyIvarList([item class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar var = vars[i];
        
        const char *name = ivar_getName(var);
        const char *type = ivar_getTypeEncoding(var);
        NSLog(@"name  %s        \ttype  %s", name, type);
    }
    free(vars);
}
/**
 改变类中变量值
 */
- (void)setIvarWithItem:(id)item{
    unsigned int outCount;
    Ivar *list = class_copyIvarList([item class], &outCount);
    
    object_setIvar(item, list[0], @"山东菏泽");
    
    NSLog(@"%@", item);
}

/**
 获得类中所有对象方法名
 */
- (void)getAllMethodWithItem:(id)item{
    unsigned int outCount;
    Method *methods = class_copyMethodList([item class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        SEL name = method_getName(methods[i]);
        NSLog(@"%@", [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding]);
    }
}

/**
 给类中添加新的对象方法
 */
- (void)addMethodWithItem:(id)item{
//    第三个参数是返回值的类型 v是void,i是int，：是SEL，对象是@等
    class_addMethod([item class], @selector(addMethod1), (IMP)method, "v");
    
//    [item performSelector:@selector(addMethod1)];
    
}

void method(){
    NSLog(@"~~~~~");
}

- (void)addMethod1{
    NSLog(@"新添加的方法1");
}

@end










