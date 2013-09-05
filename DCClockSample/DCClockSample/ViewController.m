//
//  ViewController.m
//  DCClockSample
//
//  Created by 廣川政樹 on 2013/09/05.
//  Copyright (c) 2013年 Masaki Hirokawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSInteger countdownSec;
@property UILabel   *countdownLabel;
@property NSTimer   *countdownTimer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景指定
    self.view.backgroundColor = [UIColor underPageBackgroundColor];
    
    //カウントダウン秒数 (初期値)
    _countdownSec = 4000;
	
    //カウントダウンラベル配置
    _countdownLabel = [DCLabel planeLabel:CGRectMake(0, 0, 320, 48)
                                             text:[DCClock digitalClockTime:_countdownSec]
                                             font:[UIFont fontWithName:@"Helvetica" size:20]
                                        textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter
                                  backgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]];
    [self.view addSubview:_countdownLabel];
    
    //カウントダウンタイマー定義
    [DCTimer setTimer:1.0f delegate:self selector:@selector(countdownTimerEvent:) userInfo:nil];
}

//カウントダウンタイマーイベント
- (void)countdownTimerEvent:(NSTimer *)timer
{
    _countdownSec--;
    if (_countdownSec == 0) {
        [DCTimer clearTimer];
    }
    [self updateCountdownLabel:[DCClock digitalClockTime:_countdownSec]];
}

//カウントダウンラベル更新
- (void)updateCountdownLabel:(NSString *)remainingTime
{
    _countdownLabel.text = remainingTime;
}

@end
