## OC数据模型与JSON数据互转类    
  
#### 解决了什么    
&emsp;&emsp;&emsp;当业务需求涉及到服务端时，免不了要根据后端的JSON数据返回形式来编写对应的解析Class，来把JSON数据转换成OC Model供后续使用。而当接口比较多，数据返回形式比较多时，这一步骤就很耗时，严重影响效率。而有了BTJsonModel，你要做的仅仅是:   

       1.子类化BTJsonModel  
       2.实现下本地属性名与JSON数据字段名的映射关系表     
       
   &emsp;&emsp;&emsp;之后就能愉快地和来自服务端的JSON数据打交道了。 
   
#### 特点   
代码精简，使用方便     

#### 怎样使用
根据后端的JSON返回形式，子类化这个类，覆盖以下方法:     
         `+ (NSDictionary *)localServerKeyMap;`  
         
  并实现映射关系表   
         
    /**
      本地modelClass 与 服务端报文  键名映射关系表
      @return 键名映射关系表
    */
    + (NSDictionary *)localServerKeyMap{
    	//左侧为本地属性名，右侧是服务端报文
        NSDictionary *map = @{
                               @"avatarURLStr": @"avatar",
                               @"user_id" : @"user_id",
                               @"mobileNo" : @"mobile",
                               @"name" : @"name",
                               @"sex" : @"gender",
                               @"birthDate" : @"birthday",
                               @"hometown" : @"hometown",
                            };
       return map;
    }
         
          
   之后使用以下两个方法:  
         
    - (instancetype)initWithDictionary:(NSDictionary *)jsonDic;
    - (NSDictionary *)jsonDictionary;`    
         
   便可实现OC Model 与 JSON 业务数据的互相转换。  
   
   
   
## Lite Exchanger between OC data model And Json    
       
#### What problem it solved   
&emsp;&emsp;&emsp;When functions need to comunicate with server, you need to write some data model classes to **pack** or **unpack** Json data accroding to the specific server api. And when there were lots of these server api、json format，you need to spend a huge number of time to do such things. But now with BTJsonModel, all you need to do are 2 steps:     

       1.subclass BTJsonModel  
       2.implement a mapping table       
       
   &emsp;&emsp;&emsp;then you could comunicate with json data happily.
#### Features   
neat code, easy to use

#### How to use
subclass BTJsonModel，override the flowing method:    
         `+ (NSDictionary *)localServerKeyMap;`   
         
  implement it like the flowing:   
         
    /**
      oc modelClass & server json mapping table
      @return mapping table
    */
    + (NSDictionary *)localServerKeyMap{
    	//left is local objective-C prperty name
    	//right is json key name
        NSDictionary *map = @{
                              @"avatarURLStr": @"avatar",
                              @"user_id" : @"user_id",
                              @"mobileNo" : @"mobile",
                              @"name" : @"name",
                              @"sex" : @"gender",
                              @"birthDate" : @"birthday",
                              @"hometown" : @"hometown",
                            };
       return map;
    }
         


then use two following instance methods where you need do translation between OC model and Json data:  
         
    - (instancetype)initWithDictionary:(NSDictionary *)jsonDic;
    - (NSDictionary *)jsonDictionary;   
 
