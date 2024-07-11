//
//  StringUtil.swift

import Foundation
import UIKit

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
  
    var escaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
  
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
  
    var isCharacters: Bool {
        return !isEmpty && range(of: "[^0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ\\s]", options: .regularExpression) == nil
    }
  
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
  
    var isAlpha: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
  
    var isNumeric: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
  
    func localizedWithComment(comment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
  
    func widthToFit(_ height: CGFloat, _ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.width
    }
  
    func heightToFit(_ width: CGFloat, _ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
  
    mutating func matches(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range) }
        } catch {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
  
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0 ..< result.numberOfRanges).map { result.range(at: $0).location != NSNotFound
                ? nsString.substring(with: result.range(at: $0))
                : ""
            }
        }
    }
  
    var html2AttStr: NSMutableAttributedString? {
        do {
            return try NSMutableAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html,
                                                                             .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
  
    var html2Str: String {
        return self.html2AttStr?.string ?? ""
    }
  
    func hex2color() -> UIColor {
        var cString: String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
    
        if cString.count != 6 {
            return .gray
        }
    
        var rgbValue = UInt32(0)
        Scanner(string: cString).scanHexInt32(&rgbValue)
    
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
  
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
  
    subscript(i: Int) -> Character {
        return self[self.index(startIndex, offsetBy: i)]
    }
  
    subscript(i: Int) -> String {
        return String(self[i] as Character)
    }
  
    func replaceAll(_ of: String, with: String) -> String {
        return self.replacingOccurrences(of: of, with: with, options: .literal, range: nil)
    }
  
    func replaceFirst(_ target: String, withString replaceString: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }

    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }

    var htmlToString: String {
        return self.htmlToAttributedString?.string ?? ""
    }
}
