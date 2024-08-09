
import Foundation
import CoreSpotlight
import AppIntents

@available(iOS 18.0, *)
@AssistantEntity(schema: .mail.message)
struct RepresentableAssistantEntity: AppEntity {
  static var defaultQuery: RepresentableQuery = RepresentableQuery()
  
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Items")
  
  var displayRepresentation: DisplayRepresentation
  
  let id: String
  
  @Property(title: "Name")
  var representation: String
}

@available(iOS 18.0, *)
extension RepresentableAssistantEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let attributes = CSSearchableItemAttributeSet()
    attributes.displayName = self.representation
    return attributes
  }
}
