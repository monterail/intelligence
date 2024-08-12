import AppIntents
import intelligence

struct OpenHeartIntent: AppIntent {
  static var title: LocalizedStringResource = "Draw a Heart"
  static var openAppWhenRun: Bool = true
  
  @MainActor
  func perform() async throws -> some IntentResult {
    IntelligencePlugin.notifier.push("heart")
    return .result()
  }
}
