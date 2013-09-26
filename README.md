DCClock
=====================

Objective-Cで指定した秒数から時・分・秒数を取得する「DCClock」クラスです。

秒数からデジタル時計形式の文字列取得も行えます。1桁の数字の桁数を増やして文字列として取得する機能も付属しています。

主な機能は下記の3つです。

##主な機能

1. 指定した秒数から時・分・秒数を数値／文字列で取得
2. デジタル時計形式で文字列を取得
3. 1桁の数字の桁数を指定した分だけ増やして文字列取得

##サンプルソースコード

```objective-c
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
```
