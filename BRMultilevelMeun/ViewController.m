//
//  ViewController.m
//  BRMultilevelMeun
//
//  Created by gitBurning on 15/4/17.
//  Copyright (c) 2015年 BR. All rights reserved.
//

#import "ViewController.h"
#import "MultilevelMenu.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray * lis=[NSMutableArray arrayWithCapacity:0];
    
   
    /**
     *  构建需要数据 2层或者3层数据 (ps 2层也当作3层来处理)
     */
    NSInteger countMax=6;
    for (int i=0; i<countMax; i++) {
        
        rightMeun * meun=[[rightMeun alloc] init];
        meun.meunName=[NSString stringWithFormat:@"菜单%d",i];
        NSMutableArray * sub=[NSMutableArray arrayWithCapacity:0];
        for ( int j=0; j <countMax+1; j++) {
            
            rightMeun * meun1=[[rightMeun alloc] init];
            meun1.meunName=[NSString stringWithFormat:@"%d头菜单%d",i,j];
            
            [sub addObject:meun1];
            
            //meun.meunNumber=2;
            
            NSMutableArray *zList=[NSMutableArray arrayWithCapacity:0];
            if (j%2==0) {
                
                for ( int z=0; z <countMax+2; z++) {
                    
                    rightMeun * meun2=[[rightMeun alloc] init];
                    meun2.meunName=[NSString stringWithFormat:@"%d层菜单%d",j,z];
                    
                    [zList addObject:meun2];
                    
                }
            }
            
            meun1.nextArray=zList;
        }
        
       
        meun.nextArray=sub;
        [lis addObject:meun];
    }
    
    /**
     *  适配 ios 7 和ios 8 的 坐标系问题
     */
    self.automaticallyAdjustsScrollViewInsets=NO;

    /**
     默认是 选中第一行
     
     :returns: <#return value description#>
     */
    MultilevelMenu * view=[[MultilevelMenu alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) WithData:lis withSelectIndex:^(NSInteger left, NSInteger right,rightMeun* info) {
        
        NSLog(@"点击的 菜单%@",info.meunName);
    }];
    
    
    view.needToScorllerIndex=0;

    view.isRecordLastScroll=YES;
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
