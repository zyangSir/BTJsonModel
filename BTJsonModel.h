
// ----------------------------------------------------------------------
// Simple & Lite Class for JSON data packing、unpacking between OC Model and Json
//
// Original Version: (c) 2017 Yangtsing.Zhang (zyang.sir@gmail.com)
// ----------------------------------------------------------------------
// This code may be used without restriction in any software, commercial,
// free, or otherwise. There are no attribution requirements, and no
// requirement that you distribute your changes, although bugfixes and
// enhancements are welcome.
//
// If you do choose to re-distribute the source code, you must retain the
// copyright notice and this license information. I also request that you
// place comments in to identify your changes.
//
// For information on how to use these classes, take a look at the
// included README.txt file
// ----------------------------------------------------------------------


//
//  小巧，轻量级的Json模型
//  用于 本地Model<-->服务端Json 快速互转
//  根据后端业务请求返回数据格式，自行子类化该类
//  实现 + (NSDictionary *)localServerKeyMap 方法即可

//
//  Created by Yangtsing.Zhang on 2017/8/21.
//  Copyright © 2017年 BeiTianSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTJsonModel : NSObject

/**
 用服务端返回的Json报文初始化一个OC数据模型 实例
 
 @param jsonDic 来自服务端的json报文
 @return 初始化的ZTCUserInfo 实例
 */
- (instancetype)initWithDictionary: (NSDictionary *)jsonDic;


/**
 返回1个描述该Model实例的字典，注意: 属性为nil的不会被加入字典
 这就意味着，如果想要往服务端传空串，一定要赋值上@""
 
 @return 该model实例的描述字典
 */
- (NSDictionary *)jsonDictionary;

@end
