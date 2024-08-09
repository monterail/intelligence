//
//  ExampleAppIntent.swift
//  intelligence
//
//  Created by Marcin Wróblewski on 29/07/2024.
//

import Foundation
import AppIntents
import intelligence

@available(iOS 16, *)
struct OpenFavorites: AppIntent {
  static var title: LocalizedStringResource = "Open Favorites"
  
  static var openAppWhenRun: Bool = true
  
  @MainActor
  func perform() async throws -> some IntentResult {
    IntelligencePlugin.linksNotifier.pushLink("/fav")
    return .result()
  }
}

