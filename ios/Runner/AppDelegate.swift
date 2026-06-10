import Flutter
import UIKit
import native_geofence

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // native_geofence: geofence イベントは別 isolate で起動するため、
    // GeneratedPluginRegistrant.register より前に registrant callback を登録しないと
    // 起動時のプラグイン登録で fatalError になる
    NativeGeofencePlugin.setPluginRegistrantCallback { registry in
      GeneratedPluginRegistrant.register(with: registry)
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
