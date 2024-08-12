import CoreSpotlight
import AppIntents

@available(iOS 16.0, *)
struct RepresentableEntity: AppEntity {
  static var defaultQuery: RepresentableQuery = RepresentableQuery()
  
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Shape")
  
  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(stringLiteral: representation)
  }
  
  let id: String
  let representation: String
}

extension RepresentableEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let attributes = CSSearchableItemAttributeSet()
    attributes.displayName = self.representation
    return attributes
  }
}
