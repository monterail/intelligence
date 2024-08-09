//
//  ExampleAppIntent.swift
//  intelligence
//
//  Created by Marcin Wróblewski on 29/07/2024.
//

import Foundation
import AppIntents
import intelligence

@available(iOS 18.0, *)
@AssistantIntent(schema: .mail.message)
struct OpenRepresentableAssistant: OpenIntent {
  static var title: LocalizedStringResource = "Open Representable"
  
  @Parameter(title: "Item")
  var target: RepresentableAssistantEntity
  
  @MainActor
  func perform() async throws -> some IntentResult {
    IntelligencePlugin.linksNotifier.pushLink(target.id)
    return .result()
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Open \(\.$target)")
  }
}
