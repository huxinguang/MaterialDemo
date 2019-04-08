//
//  YbsNetworkUtil.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/8.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias AFSNetSuccessBlock = (NSDictionary,SwiftyJSON.JSON) -> Void;
typealias AFSNetFaliedBlock = (AFSErrorInfo) -> Void;
typealias AFSProgressBlock = (Double) -> Void;

class YbsNetworkUtil: NSObject {
    static let share = YbsNetworkUtil();
    
    private var manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: configuration)
    }();
    
    // POST请求
    func post(url: String, parameters: Parameters?, successBlock: @escaping AFSNetSuccessBlock,faliedBlock: @escaping AFSNetFaliedBlock){
        //let encodStr = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed);
        let headers : HTTPHeaders = ["Content-Type":"application/json;charset=utf-8"];
        self.manager.request(url, method: HTTPMethod.post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).validate().responseJSON(completionHandler: { (response) in
            self.handleResponse(response: response, successBlock: successBlock, faliedBlock: faliedBlock);
            
        });
        
    }
    
    // GET请求
    func get(url:String, successBlock:@escaping AFSNetSuccessBlock, faliedBlock:@escaping AFSNetFaliedBlock){
        let headers: HTTPHeaders = ["Content-Type":"application/json;charset=utf-8"]; // http
        self.manager.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON(completionHandler: { (response) in
                self.handleResponse(response: response, successBlock: successBlock, faliedBlock: faliedBlock);
        });
        
    }

    // 上传图片
    func postImage(image: UIImage, url: String, param: Parameters?, progressBlock: @escaping AFSProgressBlock, successBlock: @escaping AFSNetSuccessBlock, faliedBlock: @escaping AFSNetFaliedBlock){
        let imageData = image.jpegData(compressionQuality: 0.5)
        let headers = ["content-type":"multipart/form-data"];
        // 默认60s超时
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            /** 采用post表单上传,参数解释：
             *  withName:和后台服务器的name要一致;
             *  fileName:可以充分利用写成用户的id，但是格式要写对;
             *  mimeType：规定的，要上传其他格式可以自行百度查一下
             */
            let data = imageData != nil ? imageData! : Data();
            multipartFormData.append(data, withName: "file", fileName: "img.png", mimeType: "image/png");
            //如果需要上传多个文件,就多添加几个
            //multipartFormData.append(imageData, withName: "file", fileName: "123456.jpg", mimeType: "image/jpeg")
            
        },to: url,headers: headers,encodingCompletion: { encodingResult in
            switch encodingResult {
                case .success(let upload, _, _):
                    //获取上传进度
                    upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                             progressBlock(progress.fractionCompleted);
                            
                        };
                    //连接服务器成功后，对json的处理
                    upload.responseJSON { response in
                        self.handleResponse(response: response, successBlock: successBlock, faliedBlock: faliedBlock);
                    }
                    
                case .failure(let encodingError):
                    self.handleRequestError(error: encodingError as NSError, faliedBlock: faliedBlock);
                    }
                
        })
        
    }
    
    // 处理服务器响应数据
    private func handleResponse(response: DataResponse<Any>, successBlock: AFSNetSuccessBlock, faliedBlock: AFSNetFaliedBlock){
        if let error = response.result.error { // 服务器未返回数据
            self.handleRequestError(error: error as NSError, faliedBlock: faliedBlock);
        }else if let value = response.result.value { // 服务器返回数据
            if (value as? NSDictionary) == nil { // 返回格式不对
                self.handleRequestSuccessWithFaliedBlock(faliedBlock: faliedBlock)
            }else{
                self.handleRequestSuccess(value: value, successBlock: successBlock, faliedBlock: faliedBlock);
            }
        }
    }
    
    // 处理请求成功数据
    private func handleRequestSuccess(value: Any, successBlock: AFSNetSuccessBlock, faliedBlock: AFSNetFaliedBlock){
        let json = JSON(value);
        if json["code"].int != nil && json["code"].int! == 1 { // 拦截
            successBlock(value as! NSDictionary,json);
        }else if json["code"].int != nil { // 获取服务器返回失败原因
            var errorInfo = AFSErrorInfo();
            errorInfo.code = json["code"].int!;
            errorInfo.message = json["msg"].string != nil ? json["msg"].string! : "不认识的错误";
            faliedBlock(errorInfo);
            
        }
    }


    // 处理请求失败数据
    private func handleRequestError(error: NSError,faliedBlock: AFSNetFaliedBlock){
        var errorInfo = AFSErrorInfo();
        errorInfo.code = error.code;
        errorInfo.error = error;
        if ( errorInfo.code == -1009 ) {
            errorInfo.message = "无网络连接";
        }else if ( errorInfo.code == -1001 ){
            errorInfo.message = "请求超时";
        }else if ( errorInfo.code == -1005 ){
            errorInfo.message = "网络连接丢失(服务器忙)";
        }else if ( errorInfo.code == -1004 ){
            errorInfo.message = "服务器没有启动";
        }else if ( errorInfo.code == 404 || errorInfo.code == 3){
        
        }
        faliedBlock(errorInfo);
    
    }
    
    // 服务器返回数据解析出错
    private func handleRequestSuccessWithFaliedBlock(faliedBlock:AFSNetFaliedBlock){
        var errorInfo = AFSErrorInfo();
        errorInfo.code = -1;
        errorInfo.message = "数据解析出错";
    }

}

// 访问出错具体原因

struct AFSErrorInfo {
    var code    = 0
    var message = ""
    var error   = NSError();
}


