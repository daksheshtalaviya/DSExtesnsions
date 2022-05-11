//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import UIKit
import MobileCoreServices

extension String {
    //MARK: -
    
    var trim : String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var url : URL? {
        var urlWeb = URL(string: self.trim)
        if urlWeb == nil {
            urlWeb = URL(string: self.trim.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")
        }
        return urlWeb
    }
    
    var urlPath : URL? {
        let path = URL(fileURLWithPath: self.trim)
        return path
    }
    
    var toImage: UIImage? {
        UIImage(named: self)
    }
    
    func isValidRegex(regex: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: self)
        return isValid
    }
    
    var containSpecialCharacter : Bool {
        let regex = try? NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        let match = regex?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, self.count))
        let exist = (match != nil)
        return exist
    }
    
    var isFloatValue : Bool {
        let allowedCharacters = "0123456789."
        let isValid = allowedCharacters.contains(self)
        return isValid
    }
    
    var isDecimalValue : Bool {
        let isValid = (self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil)
        return !isValid
    }
    
    //MARK: -
    
    func lengthMax(Length length:Int) -> Bool {
        return (self.count <= length)
    }
    
    func lengthMin(Length length:Int) -> Bool {
        return (self.count >= length)
    }
    
    func lengthEqual(Length length:Int) -> Bool {
        let isValid = (self.count == length)
        return isValid
    }
    
    //MARK: -
    
    var removeWhiteSpaceAndNewLine : String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var removeSpecialCharacter : String {
        let charSet = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        let strFilter = String(self.filter {charSet.contains($0)})
        return strFilter
    }
    
    var removeAlphabets : String {
        let charSet = Set("0123456789")
        let strFilter = String(self.filter {charSet.contains($0)})
        return strFilter
    }
    
    //MARK: -
    
    var encode : String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    var decode : String {
        return self.removingPercentEncoding ?? ""
    }
    
    func html(_ font:UIFont? = nil, _ colorHex: String = "#8B8B8B") -> String {
        let strHTML = "<span style=\"font-family: \(font?.fontName ?? ""); font-size: \(font?.pointSize ?? 1.0); color: \(colorHex)\">\(self)</span>"
        return strHTML
    }
    
    func attributeString(_ dictAttribute: [NSAttributedString.Key : Any]? = nil) -> NSMutableAttributedString? {
        
        var attrStr: NSMutableAttributedString? = NSMutableAttributedString.init(string: self, attributes: dictAttribute)
        if let htmlData = self.data(using: .utf8, allowLossyConversion: true) {
            let dictOption = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
            
            attrStr = try? NSMutableAttributedString.init(data: htmlData, options: dictOption, documentAttributes: nil)
            if let attrStr = attrStr, let attributes = dictAttribute, attrStr.string.count > 0 {
                let range = NSMakeRange(0, (attrStr.string.count))
                attrStr.addAttributes(attributes, range: range)
                attrStr.addAttributes(attributes, range: ((attrStr.string as NSString).range(of: attrStr.string)))
            }
            return attrStr
        }
        
        return attrStr
    }
    
    func height(withMaxWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withMaxHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    var base64Encode : String? {
        let dataStr = self.data(using: .utf8)
        let strText = dataStr?.base64EncodedString()
        return strText
    }
    
    var base64Decode : String? {
        if let dataStr = Data(base64Encoded: self) {
            let strText = String(data: dataStr, encoding: .utf8)
            return strText
        }
        return nil
    }
    
    var mimeTypeFromPath: String {
        let url = URL(fileURLWithPath: self)
        let pathExtension = url.pathExtension
        
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as CFString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
    
    func toData(_ encode: String.Encoding = .utf8) -> Data? {
        return self.data(using: encode)
    }
    
    func toJsonObject(withEncode encode: String.Encoding = .utf8, withReadingOptions options: JSONSerialization.ReadingOptions = .mutableContainers) -> Any? {
        return self.toData(encode)?.toJsonObject(withReadingOptions: options)
    }
    
    func toJsonObjectFromPath() -> [String: Any]? {
        return NSDictionary(contentsOfFile: self) as? [String: Any]
    }
    
    //MARK: -
    
    func toFont(size: CGFloat = 15.0) -> UIFont? {
        return UIFont(name: self, size: size)
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var toIntValue: Int? {
        Int(self)
    }
}

@objc extension NSString {
    
    var toImage: UIImage? {
        return UIImage(named: self as String)
    }
}

extension String {
    
    func shareText(from controller: UIViewController) {
        DSLog.log(self)
        
        // set up activity view controller
        let textToShare = [ self ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = controller.view
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        DispatchQueue.main.async {
            // present the view controller
            controller.present(activityViewController, animated: true, completion: nil)
        }
    }
}
