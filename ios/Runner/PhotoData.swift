//
//  PhotoData.swift
//  Runner
//
//  Created by sycheon on 10/4/24.
//
import Foundation

struct PhotoData : Codable {
    var id : Int?
    var url : String?
    var width : Int?
    var height : Int?
    var size : Double?
    var provider : String?
}
