import Flutter
import UIKit

@available(iOS 10.3, *)
public class SwiftAppIconChangerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_icon_changer", binaryMessenger: registrar.messenger())
        let instance = SwiftAppIconChangerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard UIApplication.shared.supportsAlternateIcons else {
            return;
        }
        //Change the icon to a specific image with given nameÏ
        // call.arguments is the name of the icon retreived from method channel
        UIApplication.shared.setAlternateIconName(call.arguments as? String) { (error) in
            //After app icon changed, print our error or success message
            if let error = error {
                print("App icon failed to due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully.")
            }
        }
    }
}
