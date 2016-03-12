//
//  Header.h
//  HttpDemo02
//
//  Created by Mac on 15/9/2.
//  Copyright (c) 2015年 罗炜翔. All rights reserved.
//

#ifndef HttpDemo02_Header_h
#define HttpDemo02_Header_h

#define BASEURL @"http://192.168.10.43:8080/st/s"

#define GET_URL(_path_,_data_) [NSString stringWithFormat:@"%@/%@?%@",BASEURL,_path_,_data_]



#define ShowAlert(_message_) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:_message_ delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];\
[alert show];\
[alert release]\


#endif
