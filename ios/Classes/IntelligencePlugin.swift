import Flutter
import UIKit

public class IntelligencePlugin: NSObject, FlutterPlugin {
  public static let notifier = SelectionsPushOnlyStreamHandler()
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "intelligence", binaryMessenger: registrar.messenger())
    let instance = IntelligencePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    let eventChannel = FlutterEventChannel(name: "intelligence/links", binaryMessenger: registrar.messenger())
    eventChannel.setStreamHandler(notifier)
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
        if #available(iOS 18.0, *) {
          IntelligencePlugin.spotlightCore.index(items: storageItems)
        }
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
  @available(iOS 18.0, *)
  public static let spotlightCore = IntelligenceSearchableItems()
}

struct PopulateArgument: Decodable {
  let items: [PopulateItem]
}

struct PopulateItem: Decodable {
  let id: String;
  let representation: String;
  
  func forStorage() -> IntelligenceItem {
    return (id: id, representation: representation)
  }
}

public class SelectionsPushOnlyStreamHandler: NSObject, FlutterStreamHandler {
  var sink: FlutterEventSink?
  
  public func push(_ selection: String) {
    // Save to UserDefaults
    var storedSelections = UserDefaults.standard.array(forKey: "storedSelections") as? [String] ?? []
    storedSelections.append(selection)
    UserDefaults.standard.set(storedSelections, forKey: "storedSelections")
    
    // Send directly to the sink if available
    if let sink = sink {
      sink(selection)
    }
  }
  
  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    sink = events
  
    // Retrieve persisted events from UserDefaults and send them
    if let storedSelections = UserDefaults.standard.array(forKey: "storedSelections") as? [String] {
      for selection in storedSelections {
        sink?(selection)
      }
      // Clear persisted events after sending
      UserDefaults.standard.removeObject(forKey: "storedSelections")
    }
  
    return nil
  }
  
  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    sink = nil
    return nil
  }
}
