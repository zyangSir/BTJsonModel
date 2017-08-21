
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
//  Created by Yangtsing.Zhang on 2017/8/21.
//  Copyright © 2017年 BeiTianSoftware. All rights reserved.
//

#import "BTJsonModel.h"

@implementation BTJsonModel

- (instancetype)initWithDictionary:(NSDictionary *)jsonDic{
    self = [super init];
    Class selfClass = [self class];
    if (self) {
        NSDictionary *keyMap = [selfClass localServerKeyMap];
        Class nsNullClass = [NSNull class];
        [keyMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSString *jsonKey = (NSString *)obj;
            NSString *objKey = (NSString *)key;
            id jsonObj = [jsonDic objectForKey: jsonKey];
            if (jsonObj == nil || [jsonObj isKindOfClass: nsNullClass]) {
                return;
            }
            [self setValue: jsonObj forKey: objKey];
        }];
    }
    
    return self;
    
}

- (NSDictionary *)jsonDictionary{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithCapacity: 10];
    Class selfClass = [self class];
    NSDictionary *keyMap = [selfClass localServerKeyMap];
    [keyMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *objKey = (NSString *)key;
        NSString *jsonKey = (NSString *)obj;
        id jsonObj = [self valueForKey: objKey];
        if (jsonObj) {
            [paramsDic setObject: jsonObj forKey: jsonKey];
        }
    }];
    
    return [NSDictionary dictionaryWithDictionary: paramsDic];
}

/**
 本地modelClass 属性名 与 服务端报文字段 映射关系表
 
 @return 键名映射关系表, 子类覆盖这个方法
 */
+ (NSDictionary *)localServerKeyMap{
    return @{};
}

@end
