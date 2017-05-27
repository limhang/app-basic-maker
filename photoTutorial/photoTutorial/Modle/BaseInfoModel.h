//
//  BaseInfoModel.h
//  photoTutorial
//
//  Created by het on 2017/5/27.
//  Copyright © 2017年 jacob. All rights reserved.
//

#import <Foundation/Foundation.h>
@class detailInfo;
@interface BaseInfoModel : NSObject

@property (nonatomic,copy)NSArray *lists;

@end


@interface detailInfo : NSObject

@property (nonatomic,copy)NSString *des;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *webUrl;

@end
