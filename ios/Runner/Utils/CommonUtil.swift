//
//  CommonUtil.swift

import AdSupport
import CommonCrypto
import typealias CommonCrypto.CC_LONG
import func CommonCrypto.CC_MD5
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import CoreLocation
import Foundation
import SwiftyJSON
import UIKit

class CommonUtil {
    static func bundleID() -> String {
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    }
    
    static func bundleVer() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    static func systemVer() -> String {
        return UIDevice.current.systemVersion
    }
    
    static func buildNum() -> String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    static func getAppVersion() -> String! {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
    }
    
    // 번들아이디 얻기
    static func getAppBundleID() -> String! {
        return Bundle.main.bundleIdentifier
    }
    
    static func modelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1": return "iPod Touch 5"
        case "iPod7,1": return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
        case "iPhone4,1": return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2": return "iPhone 5"
        case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
        case "iPhone7,2": return "iPhone 6"
        case "iPhone7,1": return "iPhone 6 Plus"
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3": return "iPhone 7"
        case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
        case "iPhone8,4": return "iPhone SE"
        case "iPhone10,1", "iPhone10,4": return "iPhone 8"
        case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6": return "iPhone X"
        case "iPhone11,2": return "iPhone XS"
        case "iPhone11,4", "iPhone11,6": return "iPhone XS Max"
        case "iPhone11,8": return "iPhone XR"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
        case "iPad5,3", "iPad5,4": return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad Mini 3"
        case "iPad5,1", "iPad5,2": return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8": return "iPad Pro"
        case "AppleTV5,3": return "Apple TV"
        case "i386", "x86_64": return "Simulator"
        default: return identifier
        }
    }
    
    static func deviceName() -> String {
        return UIDevice.current.name
    }
    
    static func deviceUUID() -> String! {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static func deviceIDFA() -> String! {
        var idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        return idfa
    }
    
    static func topViewController() -> UIViewController? {
        var topVC: UIViewController? = UIApplication.shared.keyWindow!.rootViewController
        while topVC != nil, topVC?.presentedViewController != nil {
            topVC = topVC?.presentedViewController
        }
        
        return topVC
    }
    
    static func validEmail(_ exp: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: exp)
    }
    
    static func validUrl(_ string: String?) -> Bool {
        if string != nil, let url = URL(string: string!) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    static func loadUrl(_ wvView: UIWebView, _ str: String) {
        return wvView.loadRequest(URLRequest(url: URL(string: str)!))
    }
    
    static func formatNum(_ val: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter.string(from: NSNumber(value: val))!
    }
    
    static func formatNum(_ val: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter.string(from: NSNumber(value: val))!
    }
    
    static func formatNum(_ val: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter.string(from: NSNumber(value: val))!
    }
    
    // check http url
    static func verifyUrl(urlString: String?) -> Bool {
        // Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    static func isExistSpecilChar(str: String) -> Bool {
//    let characterset = NSCharacterSet(charactersIn: "!@$%^&*()_+-=[]{};':,.<>?~`")
//    if str.rangeOfCharacter(from: characterset.inverted) == nil {
//      print("string contains special characters")
//      return true
//    } else {
//      return false
//    }
        let regx = "!@$%^&*()_+-=[]{};':,.<>?~`₩¥$£\\"
        for chr in str {
            if regx.contains(chr) {
                return true
            }
        }
        return false
    }
    
    static func isExistEngNumChar(str: String) -> Bool {
        let regx = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        for chr in str {
            if !regx.contains(chr) {
                return false
            }
        }
        return true
    }
    
    static func isExistNumChar(str: String) -> Bool {
        let regx = "0123456789"
        for chr in str {
            if regx.contains(chr) {
                return true
            }
        }
        return false
    }
    
    static func isExistEngChar(str: String) -> Bool {
        let regx = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for chr in str {
            if regx.contains(chr) {
                return true
            }
        }
        return false
    }
    
    // 공백 체크
    static func isExistBackspace(str: String) -> Bool {
        for chr in str {
            if chr == " " {
                return true
            }
        }
        return false
    }
   
    static func callPhone(_ strPhone: String) {
        let formatedNumber = strPhone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        if let url = URL(string: "tel://\(formatedNumber)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    static func removeAllSubviews(_ view: UIView) {
        for item in view.subviews {
            item.removeFromSuperview()
        }
    }
    
    static func getLineCount(_ label: UILabel) -> Int {
        // Call self.layoutIfNeeded() if your view uses auto layout
        let myText = label.text! as NSString
        
        let rect = CGSize(width: label.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font], context: nil)
        
        return Int(ceil(CGFloat(labelSize.height) / label.font.lineHeight))
    }
    
    //////////////////////////////////////////////////////////////////////
    
    // MARK: - load & store value
    
    //////////////////////////////////////////////////////////////////////
    
    static func bool(_ key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func setBool(_ value: Bool, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func int(_ key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func setInt(_ value: Int, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func string(_ key: String) -> String! {
        return UserDefaults.standard.string(forKey: key) as String?
    }
    
    static func setString(_ value: String!, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func data(_ key: String) -> AnyObject! {
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    
    static func setData(_ value: AnyObject!, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func archivedData(_ key: String) -> AnyObject! {
        if let data = UserDefaults.standard.object(forKey: key) as? NSData {
            return NSKeyedUnarchiver.unarchiveObject(with: data as Data) as AnyObject?
        }
        return nil
    }
    
    static func setArchivedData(_ value: AnyObject!, forKey: String) {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        UserDefaults.standard.set(data, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func showToast(_ msg: String) {
        let mdtoast = MDToast()
        mdtoast.text = msg
        mdtoast.show()
    }
    
    public static func getDateFromStamp(_ time: Int, type: String) -> String! {
        let date = NSDate(timeIntervalSince1970: TimeInterval(time) / 1000)
        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
//        dateFormatter.timeZone = TimeZone(abbreviation: "KST") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = type // Specify your format that you want
        let strDate = dateFormatter.string(from: date as Date)
        return strDate
    }
    
    /**
     * Get the string of second time
     */
    static func diffTime4(_ p_sec: Int) -> String {
        let curTimestamp = NSDate().timeIntervalSince1970
        var w_nMillis = Int64(curTimestamp * 1000 - TimeInterval(p_sec))
//    var w_nMillis: Int64 = Int64(p_sec) * 1000
        
        let w_nDays: Int64 = w_nMillis / (24 * 3600 * 1000)
        w_nMillis -= w_nDays * (24 * 3600 * 1000)
        let w_nHours: Int64 = w_nMillis / (3600 * 1000)
        w_nMillis -= w_nHours * (3600 * 1000)
        let w_nMins: Int64 = w_nMillis / (60 * 1000)
        w_nMillis -= w_nMins * (60 * 1000)
        let w_nSecs: Int64 = w_nMillis / 1000
        
        var w_strRet = ""
        
        if w_nDays > 0 {
            if w_nDays >= 30 {
                let date = Date(timeIntervalSince1970: TimeInterval(p_sec) / 1000)
                let dateFormatter = DateFormatter()
                dateFormatter.timeZone = .current
                dateFormatter.locale = NSLocale.current
                dateFormatter.dateFormat = "yyyy.MM.dd"
                w_strRet = dateFormatter.string(from: date)
            } else {
                w_strRet = String(format: "%d일 전", w_nDays)
            }
            
        } else if w_nHours > 0 {
            w_strRet = String(format: "%d시간 전", w_nHours)
        } else if w_nMins > 0 {
            w_strRet = String(format: "%d분 전", w_nMins)
        } else if w_nSecs > 0 {
            w_strRet = String(format: "%d초 전", w_nSecs)
        } else {
            w_strRet = String("방금")
        }
        
        return w_strRet
    }
    
    /**
     * Get the string of diff time
     */
    static func diffTime(_ p_sec: Int) -> String {
//        var w_nDiffMillis: Int64 = Int64(p_sec) * 1000
        
        let curTimestamp = NSDate().timeIntervalSince1970
        let time = Int64(curTimestamp - (TimeInterval(p_sec) / 1000))
        var w_nDiffMillis = time * 1000
        
        let w_nWeeks = w_nDiffMillis / (7 * 24 * 3600 * 1000)
        w_nDiffMillis -= w_nWeeks * (7 * 24 * 3600 * 1000)
        let w_nDiffDays: Int64 = w_nDiffMillis / (24 * 3600 * 1000)
        w_nDiffMillis -= w_nDiffDays * (24 * 3600 * 1000)
        let w_nDiffHours: Int64 = w_nDiffMillis / (3600 * 1000)
        w_nDiffMillis -= w_nDiffHours * (3600 * 1000)
        let w_nDiffMins: Int64 = w_nDiffMillis / (60 * 1000)
        w_nDiffMillis -= w_nDiffMins * (60 * 1000)
        let w_nDiffSeconds: Int64 = w_nDiffMillis / 1000
        
        var w_strExpression = ""
        
        let date = Date(timeIntervalSince1970: TimeInterval(p_sec) / 1000)
        let dateFormatter = DateFormatter()
//    dateFormatter.timeZone = TimeZone(abbreviation: "GMT") // Set timezone that you want
        dateFormatter.timeZone = .current
        dateFormatter.locale = NSLocale.current // Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy" // Specify your format that you want
        let strYear = dateFormatter.string(from: date)
        let strCurrentYear = dateFormatter.string(from: Date())
        
        if strYear != strCurrentYear {
            dateFormatter.dateFormat = "yyyy.MM.dd"
            w_strExpression = dateFormatter.string(from: date)
        } else if w_nWeeks > 0 {
            w_strExpression = String(format: "%d일전", w_nDiffDays)
        } else if w_nDiffDays > 0 {
            w_strExpression = String(format: "%d일전", w_nDiffDays)
        } else if w_nDiffHours > 0 {
            w_strExpression = String(format: "%d시간전", w_nDiffHours)
        } else if w_nDiffMins > 0 {
            w_strExpression = String(format: "%d분전", w_nDiffMins)
        } else if w_nDiffSeconds >= 0 {
            // w_strExpression = String(format:"%dsec", w_nDiffSeconds)
            w_strExpression = "방금"
        }
        
        return w_strExpression
    }
    
    // 2019-01-06 00:00:00 -> 2019.01.06 PM 00:00
    static func convertUpdateTime(strDate: String) -> String {
        var makeDateTime = ""
        let arrDates = strDate.components(separatedBy: " ")
        
        let makeDate = arrDates[0].replacingOccurrences(of: "-", with: ".", options: .literal, range: nil)
        let time = arrDates[1]
        let hour = time[time.index(time.startIndex, offsetBy: 0)..<time.index(time.endIndex, offsetBy: -6)]
        let min = time[time.index(time.startIndex, offsetBy: 3)..<time.index(time.endIndex, offsetBy: -3)]
        let nHour = Int(hour)
        if nHour! > 12 {
            makeDateTime = String(format: "%@ %@ %02d:%@", makeDate, "pm".localized, nHour! - 12, String(min))
        } else {
            makeDateTime = String(format: "%@ %@ %02d:%@", makeDate, "am".localized, nHour!, String(min))
        }
        
        return makeDateTime
    }
    
    /**
     * 날짜차 계산
     */
    static func diffDay(_ p_sec: Int) -> Int {
        let curTimestamp = NSDate().timeIntervalSince1970
        let time = Int64(curTimestamp - (TimeInterval(p_sec) / 1000))
        
        let day = Int(time / 60 / 60 / 24)
        
        return day
    }
    
    /**
     * 시간차 계산
     */
    static func diffHour(_ p_sec: Int) -> Int {
        let curTimestamp = NSDate().timeIntervalSince1970
        let time = Int64(curTimestamp - (TimeInterval(p_sec) / 1000))
        
        let hour = Int(time / 60 / 60)
        
        return hour
    }
    
    static func convertNum(data: String) -> String! {
        var result: String = ""
        
        let arr = data.components(separatedBy: "-")
        result = String(format: "%@-%@-%@-%@", arr[0], "****", arr[2], "****")
        
        return result
    }
    
    // phone num format  3-4-4
    static func getDashPhoneNum(num: String) -> String! {
        var result: String = ""
        
        let first = String(num[num.index(num.startIndex, offsetBy: 0)..<num.index(num.startIndex, offsetBy: 3)])
        let second = String(num[num.index(num.startIndex, offsetBy: 3)..<num.index(num.startIndex, offsetBy: 7)])
        let third = String(num.suffix(4))
                
        result = String(format: "%@-%@-%@", first, second, third)
        
        return result
    }
    
    // 문자열에서 링크 얻어내기
    static func extractLinks(data: String) -> [String] {
        var arrLinks: [String] = []
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: data, options: [], range: NSRange(location: 0, length: data.utf16.count))
        
        for match in matches {
            guard let range = Range(match.range, in: data) else { continue }
            let url = data[range]
            print(url)
//      let makeurl = url.lowercased()
//      if makeurl.contains("https://") || makeurl.contains("http://") {
//        arrLinks.append(String(url))
//      }
            arrLinks.append(String(url))
        }
        return arrLinks
    }
    
    // 두 지점 사이 거리
    static func getDistanceFromPlace(startlat: Double, startlng: Double, endlat: Double, endlng: Double) -> Double {
        var result = 0.0
        
        if startlat == 0 || startlng == 0 || endlat == 0 || endlng == 0 {
            return result
        }
        
        let coordinate₀ = CLLocation(latitude: startlat, longitude: startlng)
        let coordinate₁ = CLLocation(latitude: endlat, longitude: endlng)
        result = coordinate₀.distance(from: coordinate₁) / 1000
        
        return result
    }
    
    static func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    static func hexStringToUIColor(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func sha256(string: String) -> String? {
        guard let messageData = string.data(using: String.Encoding.utf8) else { return nil }
        var digestData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes { digestBytes in
            messageData.withUnsafeBytes { messageBytes in
                CC_SHA256(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData.map { String(format: "%02hhx", $0) }.joined()
    }
    
    static func hmsFrom(seconds: Int, completion: @escaping (_ hours: Int, _ minutes: Int, _ seconds: Int) -> ()) {
        completion(seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    static func getStringFrom(seconds: Int) -> String {
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
    
    // delete local file
    static func deleteLocalFile(filename: String) {
        // Get destination url in document directory for file
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let documentDirectoryFileUrl = documentsDirectory.appendingPathComponent(filename)
      
        // Delete file in document directory
        if FileManager.default.fileExists(atPath: documentDirectoryFileUrl.path) {
            do {
                try FileManager.default.removeItem(at: documentDirectoryFileUrl)
            } catch {
                print("Could not delete file: \(error)")
            }
        }
    }
    
    static func deleteAllFiles() {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsUrl,
                                                                       includingPropertiesForKeys: nil,
                                                                       options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            for fileURL in fileURLs {
                if fileURL.pathExtension == "mp4" {
                    try FileManager.default.removeItem(at: fileURL)
                }
            }
        } catch { print(error) }
    }
    
    // check local file exist
    static func checkIfFileExist(filename: String) -> Bool {
        // Get destination url in document directory for file
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return false }
        let outputUrl = documentsDirectory.appendingPathComponent(filename)
      
        // Print if file exists in document directory or not
        return FileManager.default.fileExists(atPath: outputUrl.path) ? true : false
    }
    
    static func textLimit(existingText: String?,
                          newText: String,
                          limit: Int) -> Bool
    {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
    
    static func getBit(data: UInt8, position: Int) -> UInt8 {
        return ((data >> position) & 1)
    }
    
    static func getBit(data: UInt8, from: Int, to: Int) -> UInt8 {
        var ret: UInt8 = 0
        
        for i in from..<to + 1 {
            let value: UInt8 = getBit(data: data, position: i)
            ret = (UInt8)(ret | ((value << (i - from)) & 0xFF))
        }
        return ret
    }
    
    static func writeBit(data: UInt8, from: Int, len: Int, value: UInt8) -> UInt8 {
        var mid: UInt8 = 0
        
        for i in from..<from + len {
            mid = (UInt8)(mid | (1 << i))
        }
    
        mid = ~mid
    
        let data1: UInt8 = (UInt8)(data & mid)
        let value1: UInt8 = (UInt8)(value << from)
    
        let result: UInt8 = (UInt8)(data1 | value1)
        return result
    }
    
}

extension Double {
    func round(_ digits: Int = 2) -> Double {
        let multiplier = pow(10, Double(digits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first

        let bottomPadding = keyWindow?.safeAreaInsets.bottom
        return bottomPadding! > 0
    }
}

public extension UIDevice {
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1": return "iPod touch (5th generation)"
            case "iPod7,1": return "iPod touch (6th generation)"
            case "iPod9,1": return "iPod touch (7th generation)"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
            case "iPhone4,1": return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2": return "iPhone 5"
            case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
            case "iPhone7,2": return "iPhone 6"
            case "iPhone7,1": return "iPhone 6 Plus"
            case "iPhone8,1": return "iPhone 6s"
            case "iPhone8,2": return "iPhone 6s Plus"
            case "iPhone8,4": return "iPhone SE"
            case "iPhone9,1", "iPhone9,3": return "iPhone 7"
            case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
            case "iPhone10,1", "iPhone10,4": return "iPhone 8"
            case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6": return "iPhone X"
            case "iPhone11,2": return "iPhone XS"
            case "iPhone11,4", "iPhone11,6": return "iPhone XS Max"
            case "iPhone11,8": return "iPhone XR"
            case "iPhone12,1": return "iPhone 11"
            case "iPhone12,3": return "iPhone 11 Pro"
            case "iPhone12,5": return "iPhone 11 Pro Max"
            case "iPhone12,8": return "iPhone SE (2nd generation)"
            case "iPhone13,1": return "iPhone 12 mini"
            case "iPhone13,2": return "iPhone 12"
            case "iPhone13,3": return "iPhone 12 Pro"
            case "iPhone13,4": return "iPhone 12 Pro Max"
            case "iPhone14,4": return "iPhone 13 mini"
            case "iPhone14,5": return "iPhone 13"
            case "iPhone14,2": return "iPhone 13 Pro"
            case "iPhone14,3": return "iPhone 13 Pro Max"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad (3rd generation)"
            case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad (4th generation)"
            case "iPad6,11", "iPad6,12": return "iPad (5th generation)"
            case "iPad7,5", "iPad7,6": return "iPad (6th generation)"
            case "iPad7,11", "iPad7,12": return "iPad (7th generation)"
            case "iPad11,6", "iPad11,7": return "iPad (8th generation)"
            case "iPad12,1", "iPad12,2": return "iPad (9th generation)"
            case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
            case "iPad5,3", "iPad5,4": return "iPad Air 2"
            case "iPad11,3", "iPad11,4": return "iPad Air (3rd generation)"
            case "iPad13,1", "iPad13,2": return "iPad Air (4th generation)"
            case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad mini"
            case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad mini 3"
            case "iPad5,1", "iPad5,2": return "iPad mini 4"
            case "iPad11,1", "iPad11,2": return "iPad mini (5th generation)"
            case "iPad14,1", "iPad14,2": return "iPad mini (6th generation)"
            case "iPad6,3", "iPad6,4": return "iPad Pro (9.7-inch)"
            case "iPad7,3", "iPad7,4": return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return "iPad Pro (11-inch) (1st generation)"
            case "iPad8,9", "iPad8,10": return "iPad Pro (11-inch) (2nd generation)"
            case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7": return "iPad Pro (11-inch) (3rd generation)"
            case "iPad6,7", "iPad6,8": return "iPad Pro (12.9-inch) (1st generation)"
            case "iPad7,1", "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
            case "iPad8,11", "iPad8,12": return "iPad Pro (12.9-inch) (4th generation)"
            case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11": return "iPad Pro (12.9-inch) (5th generation)"
            case "AppleTV5,3": return "Apple TV"
            case "AppleTV6,2": return "Apple TV 4K"
            case "AudioAccessory1,1": return "HomePod"
            case "AudioAccessory5,1": return "HomePod mini"
            case "i386", "x86_64", "arm64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default: return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }

        return mapToDevice(identifier: identifier)
    }()
}
