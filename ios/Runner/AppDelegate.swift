import AVFoundation
import Flutter
import SwiftyJSON
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var _result: FlutterResult?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let deviceChannel = FlutterMethodChannel(name: "blanc.flutter.methodchannel/iOS",
                                                 binaryMessenger: controller.binaryMessenger)
        prepareMethodHandler(deviceChannel: deviceChannel)
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
        deviceChannel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "lux" {
                self._result = result

                let res = JSON(call.arguments as Any)
                let type = res["type"].stringValue
                let jwt = res["jwt"].stringValue
                
                let mainStoryboardIpad = UIStoryboard(name: "Main", bundle: nil)
                let cameraVC: ShootingVC = mainStoryboardIpad.instantiateViewController(withIdentifier: "ShootingVC") as! ShootingVC
                cameraVC.pageType = type
                cameraVC.jwt = jwt
                cameraVC.modalPresentationStyle = .fullScreen
                self.window?.rootViewController?.present(cameraVC, animated: false)
            } else {
                result(FlutterMethodNotImplemented)
                return
            }
        }
    }
}
