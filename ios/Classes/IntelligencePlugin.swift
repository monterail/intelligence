import Flutter
import UIKit

public class IntelligencePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "intelligence", binaryMessenger: registrar.messenger())
    let instance = IntelligencePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "populate":
        handlePopulate(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func handlePopulate(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            if let args = call.arguments as? String {
                let populateArgument = try JSONDecoder().decode(PopulateArgument.self, from: Data(args.utf8))
                let storageItems = populateArgument.items.map() { item in
                    return item.forStorage()
                }
                IntelligencePlugin.storage.set(items: storageItems)
                result(true)
            }
        } catch {
            result(FlutterError(
                code: "POPULATE_ARGUMENT_PARSING",
                message: ".populate called with missing or malformed argument",
                details: nil
            ))
        }
    }
    
    public static let storage = IntelligenceStorage()
}

struct PopulateArgument: Decodable {
    let items: [PopulateItem]
}

struct PopulateItem: Decodable {
    let id: String;
    let representation: String;
    
    func forStorage() -> (id: String, representation: String) {
        return (id: id, representation: representation)
    }
}
