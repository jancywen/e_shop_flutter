import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        if let controller: FlutterViewController = window?.rootViewController as? FlutterViewController,
           let binaryMessager = controller as? FlutterBinaryMessenger {
            let batteryChannel = FlutterMethodChannel.init(name: channelName, binaryMessenger: binaryMessager)
            batteryChannel.setMethodCallHandler(MethodChannelManager.manager.methodCallHandler(call:result:))
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
