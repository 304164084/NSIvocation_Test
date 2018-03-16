//
//  ViewController.m
//  NSInvocation_Test
//
//  Created by ZTL_Sui on 2018/3/16.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createInvocation];
}
/**
 * 使用场景：用于替换performSelector:withObject:执行方法的调用。 后面称为P方法
 * performSelector:方法最多
 * 在P中，withObject参数只能是id对象类型。使用NSDictionary包装，也不能直接指定值类型的数据。（需要后期转换）
 * 使用NSIvocation 可以直接指定相应类型。 也可以进行一层封装
 *
 **/

- (void)createPerform
{
    [self performSelector:@selector(showUName:age:height:) withObject:@"coderBS" withObject:@{@"age":@27, @"height":@187.0f}];
}
- (void)createInvocation
{
    NSLog(@"🔥start🔥");
    SEL selector = NSSelectorFromString(@"showUName:age:height:");
    NSMethodSignature *ms = [[self class] instanceMethodSignatureForSelector:selector];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:ms];
    invocation.target = self;
    invocation.selector = selector;
    
    NSString *name = @"BondSui";
    NSInteger age = 27;
    CGFloat height = 187.0f;
    /// 设置参数时，不能从0开始。消息发送——objc_msgSend(self,_cmd,...);0被self占用，1被_cmd占用
    [invocation setArgument:&name atIndex:2];
    [invocation setArgument:&age atIndex:3];
    [invocation setArgument:&height atIndex:4];
    
    [invocation invoke]; // 顺序执行
    NSLog(@"🔥the end🔥");
}

- (void)showUName:(NSString *)name age:(NSInteger)age height:(CGFloat)height
{
    NSLog(@"user info is\n{\n name->%@;\n age->%ld\n height->%f;\n}",name, age, height);
}


@end
