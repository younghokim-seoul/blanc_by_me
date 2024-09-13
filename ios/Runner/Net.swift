//
//  Net.swift
//  Blanc
//

import Alamofire
import SwiftyJSON
import UIKit

var SERVER_DOMAIN = "https://api.blancbyme.com"
var API_TOKEN = "Bearer 3da1ac61828ed59821e307bcabb09372877ae0cfec1c0d96e7cdc4352a7f538c155264bb2da2cd3bf122f33f72e61d98fce65dfe2e17769dc42830f81cd6fa24f46489eb76f9f8f4153e4e1c55063a7b3285e69194fc257651a04c058e02e3b1425471bc02ddfd9f63e822771d606d87ad148e82c085328e7438664a108cc566"
enum F_API: String {
    case UPLOAD_IMAGE = "/api/upload"
}

public enum Net {
    private static func convVal(_ bVal: Bool) -> String {
        return bVal ? "Y" : "N"
    }
    
    //
    
    // MARK: API response structure
    
    //
    public typealias SuccessBlock = (ResponseResult?) -> Void
    public typealias FailureBlock = (_ code: Int, _ err: String) -> Void
    
    open class ResponseResult {}
    
    open class StatusResult: ResponseResult {
        var msg: String!
    }
    
    // MARK: Helper function
    
    /**
     *  HTTP request.
     */
    private static func doRequestUrl(
        method: Alamofire.HTTPMethod,
        api: String,
        api_type: F_API,
        params: [String: AnyObject],
        header: [String: String],
        success: SuccessBlock?,
        failure: FailureBlock?
    ) {
//            let url = Server_Url + api + "?XDEBUG_SESSION_START=Star_Man"  //debug
        let url = SERVER_DOMAIN + api
        print("\n\(url)")
        print(params)
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
//        manager.session.configuration.allowsCellularAccess = true
        
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: header).responseString { response in // .URLEncoding JSONEncoding
            switch response.result {
            case .failure(let error):
                if let failure = failure {
                    print("\nAPI Call Failed!\nURL : \(url)\nError : \(error.localizedDescription)")
                    if let data = response.data {
                        let res = String(describing: data)
                        print("Response : \(res)")
                    }
                    failure(999, "server_connect_fail".localized)
                }
                return
            case .success(let json):
                
                let res = JSON(json.data(using: .utf8)! as Any)
                print(res)
            }
        }
    }

    /**
     *  File request.
     */
    private static func doRequestForFile(
        method: Alamofire.HTTPMethod,
        api: String,
        api_type: F_API,
        imgArray: [Data]! = [],
        imgMarkArray: [String]! = [],
        imgMark: String = "file",
        imgIndexable: Bool = false,
        vidArray: [Data]! = [],
        vidMarkArray: [String]! = [],
        vidMark: String = "video",
        vidIndexable: Bool = false,
        params: [String: AnyObject]?,
        header: [String: String],
        success: SuccessBlock?,
        failure: FailureBlock?
    ) {
//    let url = Server_Url + api.rawValue + "?XDEBUG_SESSION_START=Star_Man" // debug mode
        let url = SERVER_DOMAIN + api
        print(url)
        print(params ?? "params:")
        
        Alamofire.upload(multipartFormData: { MultipartFormData in
            if imgArray.count > 0 {
                for i in 0...imgArray.count - 1 {
                    var strName = imgMark
                    if imgIndexable {
                        strName += "\(i + 1)"
                    }
                    if i < imgMarkArray.count {
                        strName = imgMarkArray[i]
                    }
                    MultipartFormData.append(imgArray[i], withName: strName, fileName: "\(strName).jpg", mimeType: "image/jpg")
                }
            } else if vidArray.count > 0 {
                for i in 0...vidArray.count - 1 {
                    var strName = vidMark
                    if vidIndexable {
                        strName += "\(i + 1)"
                    }
                    if i < vidMarkArray.count {
                        strName = vidMarkArray[i]
                    }
                    MultipartFormData.append(vidArray[i], withName: strName, fileName: "\(strName).m4a", mimeType: "audio/m4a")
                }
            }
            
            for (key, value) in params! {
                let data = JSON(value).stringValue
                MultipartFormData.append(data.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, method: method, headers: header, encodingCompletion: { encodingResult in
            switch encodingResult {
            case .failure(let error):
                if let failure = failure {
                    print("\nAPI Call Failed!\nURL : \(url)\nError : \(error.localizedDescription)")
                    failure(999, "서버와의 연결이 원할하지 않습니다.")
                }
                
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { progress in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                upload.responseString { response in
                    let result = response.result.value ?? ""
                    print(result)
                }
                
                upload.responseJSON { _ in
//                        let json = JSON(response.result.value ?? "")
                    
//                        do {
//                            let data = try Net.parseResponse(api: api, data:json)
//                            if let success = success {
//                                success(data)
//                            }
//                        } catch _ {
//                            if let failure = failure {
//                                failure(-900, "Failed to parse server response(invalid object)")
//                            }
//                        }
                }
            }
            
        })
    }

    //
    
    // MARK: API call functions
    
    //
    /**
     *    upload image
     */
    public static func uploadImage(
        uploadfile: Data,
        success: SuccessBlock?,
        failure: FailureBlock?
    ) {
        let _url = F_API.UPLOAD_IMAGE.rawValue
        
        let value = "app_tooth_images/IOS_" + CommonUtil.bundleVer()
        let params = [
            "path": value,
        ] as [String: AnyObject]
        
        let header = [
            "Authorization": API_TOKEN,
        ] as [String: String]
        
        doRequestForFile(method: .post, api: _url, api_type: .UPLOAD_IMAGE, imgArray: [uploadfile], imgMark: "files", params: params, header: header, success: success, failure: failure)
    }
  
}
