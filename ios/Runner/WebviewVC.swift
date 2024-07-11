import AVFoundation
import SwiftyJSON
import UIKit
import WebKit

protocol WebviewVCDelegate {
    func exitVC()
}

class WebviewVC: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    @IBOutlet var vwContent: UIView!
    fileprivate var webView: WKWebView!
    
    let WEBVIEW_BRIDGE_NAME = "blanc_bridge"
    
    var _url = ""
    var jwt = ""
    var delegate: WebviewVCDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _url = "https://www.blancbyme.com/webview?redirect=%2Fai-curation"
        initWebview()
        loadURLWithString(_url)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func initWebview() {
        let config = WKWebViewConfiguration()
        let jsctrl = WKUserContentController()
        jsctrl.add(self, name: WEBVIEW_BRIDGE_NAME)
        config.userContentController = jsctrl
        
        webView = WKWebView(frame: CGRect.zero, configuration: config)
//        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.backgroundColor = .white
        webView.scrollView.backgroundColor = .white
        webView.scrollView.bounces = false
        webView.evaluateJavaScript("navigator.userAgent") { [weak webView] result, _ in
            if let webView = webView, let userAgent = result as? String {
                webView.customUserAgent = userAgent
            }
        }
        
        vwContent.addSubview(webView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-0-[webView]-0-|", options: [], metrics: nil, views: ["webView": webView as WKWebView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[webView]-0-|", options: [], metrics: nil, views: ["webView": webView as WKWebView]))
    }
    
    open func loadURLWithString(_ URLString: String) {
        if let URL = URL(string: URLString) {
            if URL.scheme != "", URL.host != nil {
                loadURL(URL)
            } else {
                loadURLWithString("http://\(URLString)")
            }
        }
    }
    
    /**
     Navigates to the URL.
     
     - parameter URL: The URL for a request.
     - parameter cachePolicy: The cache policy for a request. Optional. Default value is .UseProtocolCachePolicy.
     - parameter timeoutInterval: The timeout interval for a request, in seconds. Optional. Default value is 0.
     */
    open func loadURL(_ URL: Foundation.URL, cachePolicy: NSURLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 0) {
        webView.load(URLRequest(url: URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval))
    }
    
    /**
     Evaluates the given JavaScript string.
     - parameter javaScriptString: The JavaScript string to evaluate.
     - parameter completionHandler: A block to invoke when script evaluation completes or fails.
       
     The completionHandler is passed the result of the script evaluation or an error.
     */
    open func evaluateJavaScript(_ javaScriptString: String, completionHandler: ((AnyObject?, NSError?) -> Void)?) {
        webView.evaluateJavaScript(javaScriptString, completionHandler: completionHandler as! ((Any?, Error?) -> Void)?)
    }
      
    func callJavascript(callFunc: String) {
        print("===== To JAVASCRIPT =====")
        print(callFunc)
        webView.evaluateJavaScript(callFunc, completionHandler: nil)
    }
      
    // MARK: WKScriptMessageHandler Methods
      
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == WEBVIEW_BRIDGE_NAME {
            var temp = message.body as? String
            temp = temp?.replaceAll("{", with: "")
            temp = temp?.replaceAll("}", with: "")
            temp = temp?.replaceAll("\\", with: "")
            temp = temp?.replaceAll("\"", with: "")
            let arr = temp?.components(separatedBy: ",")
            if arr?.count == 2 {
                if arr![0] == "type:get_token" {
                    let arr1 = arr![1].components(separatedBy: ":")
                    if arr1.count == 2, arr1[0] == "callback" {
                        let callback_str = arr1[1]
                        print(callback_str)
                        var javaScript = String(format: "window.bridgeCallbacks['%@'].call(null, '{\"jwt\":\"%@\"}');", callback_str, jwt)
                        javaScript = javaScript.replaceAll("\\'", with: "\'")
                        webView.evaluateJavaScript(javaScript) { result, error in
                            if error == nil {
                                print(result)
                            }
                        }
                    }
                }
            }
//            let values: [String: Any] = temp as! Dictionary
//            print("===== From JAVASCRIPT =====")
//            print(values)
//            let funcName = values["type"] as? String
//
//            switch funcName {
//            case "get_token": do {
//                    let callback_str = values["callback"] as! String
//                    print(callback_str)
//                    let javaScript = String(format: "window.bridgeCallbacks['%@'].call(null, '{\"jwt\":\"%@\"}');", callback_str, jwt)
//                    webView.evaluateJavaScript(javaScript) { result, error in
//                        if error == nil {
//                            print(result)
//                        }
//                    }
//                }
//
//            default:
//                break
//            }
        }
    }
      
    // MARK: WKNavigationDelegate Methods
      
    open func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //
    }
      
    open func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if error._code == NSURLErrorCancelled {
            return
        }
          
        showError(error.localizedDescription)
    }
      
    open func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        if error._code == NSURLErrorCancelled {
            return
        }
        showError(error.localizedDescription)
    }
      
    open func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let cred = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, cred)
    }
      
    open func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {}
      
    open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {}
      
    open func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            print(url.absoluteString)
            if !(url.absoluteString.hasPrefix("http") || url.absoluteString.hasPrefix("file")) ||
                url.absoluteString.contains("https://itunes.apple.com")
            {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
      
    open func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
      
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {}
      
    // MARK: WKUIDelegate Methods
      
    open func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (_: UIAlertAction) -> Void in
            completionHandler()
        }))
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
      
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Swift.Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in completionHandler(false) })
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in completionHandler(true) })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
      
    // MARK: Some Private Methods
      
    fileprivate func showError(_ errorString: String?) {
        let alertView = UIAlertController(title: "오류", message: errorString, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }

    /////////////////////////////////////////////////////

    // MARK: - Click Events

    /////////////////////////////////////////////////////
    @IBAction func onBack(_ sender: Any) {
        if delegate != nil {
            delegate.exitVC()
        }
        dismiss(animated: false)
    }
}
