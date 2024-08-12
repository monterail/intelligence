import AppIntents
import intelligence

@available(iOS 16, *)
struct ExampleAppIntent: AppIntent {
  static var title: LocalizedStringResource = "Draw shape"
  static var openAppWhenRun: Bool = true
    
  @Parameter(title: "Shape")
  var target: RepresentableEntity
  
  @MainActor
  func perform() async throws -> some IntentResult {
    IntelligencePlugin.notifier.push(target.id)
    return .result()
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Draw \(\.$target)")
  }
}


struct AppShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: ExampleAppIntent(),
      phrases: [
        "Draw a \(\.$target) in \(.applicationName)"
      ]
    )
  }
}
