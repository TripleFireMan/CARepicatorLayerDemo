//
//  CYEmitterDemoTests.m
//  CYEmitterDemoTests
//
//  Created by 成焱 on 2017/5/6.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CYEmitterDemoTests : XCTestCase

@end

@implementation CYEmitterDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSLog(@"sleep one second");
//        sleep(1);
        NSLog(@"this is demo");
//        NSMutableArray *array = [NSMutableArray array];
//        for (NSInteger i = 0; i < 1000000; i++) {
//            NSObject *newObj = [NSObject new];
//            [array addObject:newObj];
//        }
        
        
    }];
}

@end
