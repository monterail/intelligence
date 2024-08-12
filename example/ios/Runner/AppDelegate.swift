import Flutter
import AppIntents
import intelligence
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 18.0, *) {
      IntelligencePlugin.spotlightCore.attachEntityMapper() { item in
        return RepresentableEntity(
          id: item.id,
          representation: item.representation
        )
      }
    }
    IntelligencePlugin.storage.attachListener {
      AppShortcuts.updateAppShortcutParameters()
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
