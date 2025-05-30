import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController

    let METHOD_CHANNEL_NAME = "schedule/tools"
    let changeIcon = FlutterMethodChannel(
      name: METHOD_CHANNEL_NAME, binaryMessenger: controller.binaryMessenger)

    changeIcon.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      switch call.method {
      case "changeIcon":
        let args = call.arguments as? [String: String]
        let iconName = args!["selectedIcon"]
        self.changeIcon(iconName)

      default:
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func changeIcon(_ iconName: String?) {

    if #available(iOS 10.3, *) {
      UIApplication.shared.setAlternateIconName(iconName) { (error) in
        if let error = error {
          print(error.localizedDescription)
          UIApplication.shared.setAlternateIconName(nil)
        } else {
          print("Changed Icon Successfully!")
        }
      }
    }
  }

}
