import Flutter
import AppIntents
import intelligence
import UIKit

@available(iOS 18.0, *)
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    IntelligencePlugin.spotlightCore.attachEntityMapper() { item in
      return RepresentableEntity(
        id: item.id,
        representation: item.representation
      )
    }
    IntelligencePlugin.storage.attachListener {
      OpenFavoritesShortcuts.updateAppShortcutParameters()
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
