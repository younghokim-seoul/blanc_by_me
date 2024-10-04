//
//  AiResponseData.swift
//  Runner
//
//  Created by sycheon on 10/4/24.
//

struct AiResponseData : Codable {
    let data : AiResponseDataDetail?
    let meta : MetaData?
    let error : ErrorData?
}

struct AiResponseDataDetail : Codable {
    let id : Int
    let attributes : AiResponseDataAttributes?
}

struct AiResponseDataAttributes : Codable {
    let photoType: String?
    let classicalToothShade: Int?
    let device: String?
    let consultationNote: String?
    let createdAt: String?
    let updatedAt: String?
}

struct MetaData : Codable {

}

struct ErrorData : Codable {
    let status :Int?
    let name :String?
    let message : String?
    let details : ErrorDetailData?
}

struct ErrorDetailData : Codable {

}
