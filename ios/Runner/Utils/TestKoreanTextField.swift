//
//  TestKoreanTextField.swift
//
//  Created by Yuji Hato on 12/3/14.
//

import Foundation
import UIKit

class TestKoreanTextField: UITextField {
    func tryLoggingPrimaryLanguageInfoOnKeyboard() {
        print("Total number of keyboards. : \(UITextInputMode.activeInputModes.count)")
        for keyboardInputModes in UITextInputMode.activeInputModes{
            if let language = keyboardInputModes.primaryLanguage{
               dump(language)
            }
        }
    }
    
    var languageCode: String?{
        didSet {
            if self.isFirstResponder{
                self.resignFirstResponder();
                self.becomeFirstResponder();
            }
        }
    }
    
    override var textInputMode: UITextInputMode?{
        print("Total number of keyboards. : \(UITextInputMode.activeInputModes.count)")
        
        if let languageCode = self.languageCode {
            for keyboardInputModes in UITextInputMode.activeInputModes {
                if let language = keyboardInputModes.primaryLanguage {
                    if language == languageCode {
                        print("success")
                        return keyboardInputModes;
                    }
                }
            }
        }
        print("failed")
        return super.textInputMode;
    }
}
