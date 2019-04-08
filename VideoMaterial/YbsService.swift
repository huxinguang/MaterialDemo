//
//  YbsService.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/8.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import Foundation
import Moya

enum YbsService {
    case verificationCode(mobile: String)
    case login(mobile: String,code: String)
    case logout(token: String)
}

extension YbsService: TargetType{

    var baseURL: URL {
        return URL(string: "http://62.234.107.173:8088")!
    }
    var path: String {
        switch self {
        case .verificationCode(_):
            return "/verificationCode"
        case .login(_,_):
            return "/login"
        case .logout(_):
            return "/logout"
        }
    }
    var method: Moya.Method {
        return .post
    }
    var task: Task {
        switch self {
        case let .verificationCode(mobile):
            return .requestParameters(parameters: ["mobile": mobile], encoding: JSONEncoding.default)
        case let .login(mobile, code):
            return .requestParameters(parameters: ["mobile": mobile,"code":code], encoding: JSONEncoding.default)
        case let .logout(token):
            return .requestParameters(parameters: ["token": token], encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        
        switch self {
            
        default:
            return "{\"code\": \(1024),\"message\": \("样本"),\"data\": \("数据")}".data(using: .utf8)!
        }
    }
        
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

