//
//  FrameUtilsTests.m
//  FrameUtilsTests
//
//  Created by Peter Sobkowski on 3/7/2014.
//  Copyright (c) 2014 psobko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIView+FrameUtils.h"

#define kTestX 100.0f
#define kTestY 150.0f
#define kTestWidth 120.0f
#define kTestHeight 300.0f
#define kTestFrame CGRectMake(kTestX, kTestY, kTestWidth, kTestHeight)

#define XCTAssertEqualFrames(frame1, frame2) XCTAssert(CGRectEqualToRect(frame1, frame2), @"Frame %@ should be %@", NSStringFromCGRect(frame1), NSStringFromCGRect(frame2))


@interface FrameUtilsTests : XCTestCase
{
    UIView *testView;
    UIView *testSiblingView;
    UIView *testParentView;
    //    UIView *testChildView;
}

@end

@implementation FrameUtilsTests

- (void)setUp
{
    [super setUp];
    
    UIViewController *viewController = [[UIViewController alloc] init];
    //    testParentView = viewController.view;
    
    testParentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 310)];//CGRectMake(60, 65, 200, 35)];
    [viewController.view addSubview:testParentView];
    
    testView = [[UIView alloc] initWithFrame:kTestFrame];//CGRectMake(60, 65, 200, 35)];
    [testParentView addSubview:testView];
    
    testSiblingView = [[UIView alloc] initWithFrame:CGRectMake(75, 150, 150, 400)];
    [viewController.view addSubview:testSiblingView];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - X/Y Setters And Getters

-(void)testXGetter
{
    XCTAssertEqual(testView.x, kTestX);
}

- (void)testXSetter
{
    testView.x = 50.0f;
    XCTAssertEqualFrames(testView.frame, CGRectMake(50.0f, kTestY, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.x += 20.0;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX+20.0, kTestY, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.x -= 20.0;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX-20.0, kTestY, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.x *= 2;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX*2, kTestY, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.x /= 2;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX/2, kTestY, kTestWidth, kTestHeight));
}

-(void)testMaxXGetter
{
    XCTAssertEqual(testView.maxX, CGRectGetMaxX(testView.frame));
}

-(void)testYGetter
{
    XCTAssertEqual(testView.y, kTestY);
}

- (void)testYSetter
{
    testView.y = 50.0f;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, 50.0f, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.y += 20.0;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY+20.0, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.y -= 20.0;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY-20.0, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.y *= 2;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY*2, kTestWidth, kTestHeight));
    
    [self resetView];
    
    testView.y /= 2;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY/2, kTestWidth, kTestHeight));
    
}

-(void)testMaxYGetter
{
    XCTAssertEqual(testView.maxY, CGRectGetMaxY(testView.frame));
}

- (void) testXYSetter
{
    [testView setX:75.0f andY:60.0f];
    XCTAssertEqualFrames(testView.frame, CGRectMake(75.0f, 60.0f, kTestWidth, kTestHeight));
}

#pragma mark - X/Y Offset

//- (void) testOffsetX
//{
//    [testView offsetX:10.0f];
//    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX+10.0f, kTestY, kTestWidth, kTestHeight));
//    
//    [self resetView];
//    
//    [testView offsetX:-10.0f];
//    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX-10.0f, kTestY, kTestWidth, kTestHeight));
//}
//
//- (void) testOffsetY
//{
//    [testView offsetY:10.0f];
//    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY+10.0f, kTestWidth, kTestHeight));
//    
//    [self resetView];
//    
//    [testView offsetY:-10.0f];
//    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY-10.0f, kTestWidth, kTestHeight));
//}

- (void) testOffsetXY
{
    [testView offsetX:25.0f andY:15.0f];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX+25.0f, kTestY+15.0f, kTestWidth, kTestHeight));
    
    [self resetView];
    
    [testView offsetX:25.0f andY:-15.0f];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX+25.0f, kTestY-15.0f, kTestWidth, kTestHeight));
    
    [self resetView];
    
    [testView offsetX:-25.0f andY:15.0f];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX-25.0f, kTestY+15.0f, kTestWidth, kTestHeight));
    
    [self resetView];
    
    [testView offsetX:-25.0f andY:-15.0f];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX-25.0f, kTestY-15.0f, kTestWidth, kTestHeight));
}

#pragma mark - Width/Height Setters and Getters

-(void)testWidthGetter
{
    XCTAssertEqual(testView.width, kTestWidth);
}

- (void)testWidthSetter
{
    testView.width = 200.0f;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY, 200.0f, kTestHeight));
    //TODO: test assignment operators
}

-(void)testHeightGetter
{
    XCTAssertEqual(testView.y, kTestY);
}

- (void)testHeightSetter
{
    testView.height = 200.0f;
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY, kTestWidth, 200.0f));
    
    //TODO: test assignment operators
}


- (void) testWidthHeightSetter
{
    [testView setWidth:75.0f andHeight:60.0f];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY, 75.0f, 60.0f));
    //TODO: test negative vals?
}

#pragma mark - Centering

- (void)testCenterXWithRect
{
    [testView centerXWithRect:testSiblingView.frame];
    XCTAssertEqualFrames(testView.frame, CGRectMake(90.0f, kTestY, kTestWidth, kTestHeight));
}

-(void)testCenterYWithRect
{
    [testView centerYWithRect:testSiblingView.frame];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, 200.0f, kTestWidth, kTestHeight));
}

-(void)testCenterWithRect
{
    [testView centerWithRect:testSiblingView.frame];
    XCTAssertEqualFrames(testView.frame, CGRectMake(90.0f, 200.0f, kTestWidth, kTestHeight));
}

- (void)testCenterXInParent
{
    [testView centerXInParent];
    XCTAssertEqualFrames(testView.frame, CGRectMake(90, kTestY, kTestWidth, kTestHeight));
}

-(void)testCenterYiInParent
{
    [testView centerYInParent];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, 5, kTestWidth, kTestHeight));
}

-(void)testCenterInParent
{
    [testView centerInParent];
    XCTAssertEqualFrames(testView.frame, CGRectMake(90, 5, kTestWidth, kTestHeight));
}

-(void)testCenterInRect
{
    [testView centerInRect:CGRectMake(20, 20, 400, 400)];
    XCTAssertEqualFrames(testView.frame, CGRectMake(140, 50, kTestWidth, kTestHeight));
}

-(void)testCetnerXInRect
{
    [testView centerXInRect:CGRectMake(20, 20, 400, 400)];
    XCTAssertEqualFrames(testView.frame, CGRectMake(140, kTestY, kTestWidth, kTestHeight));
}

-(void)testCenterYInRect
{
    [testView centerYInRect:CGRectMake(20, 20, 400, 400)];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, 50, kTestWidth, kTestHeight));
}

#pragma mark - Width/Height Scaling

- (void)testScaleSizeByFactor
{
    [testView scaleSizeByFactor:2.0];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY, kTestWidth*2.0, kTestHeight*2.0));
    
    [self resetView];
    
    [testView scaleSizeByFactor:0.5];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY, kTestWidth*0.5, kTestHeight*0.5));
    
    [self resetView];
    
    [testView scaleSizeByFactor:1.0];
    XCTAssertEqualFrames(testView.frame, CGRectMake(kTestX, kTestY, kTestWidth, kTestHeight));
}

#pragma mark - Helper Methods

-(void)resetView
{
    testView.frame = kTestFrame;
}

@end
