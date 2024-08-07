import Flutter
import AppIntents
import intelligence
import UIKit

@available(iOS 18.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    IntelligencePlugin.spotlightCore.attachEntityMapper() { item in
      return RepresentableEntity(
        displayRepresentation: DisplayRepresentation(stringLiteral:item.representation),
        id: item.id,
        representation: EntityProperty(title: LocalizedStringResource(stringLiteral: item.representation)))
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
