import Flutter
import AppIntents
import CoreSpotlight
import MobileCoreServices


@available(iOS 18.0, *)
public class IntelligenceSearchableItems {
  @available(iOS 18.0, *)
  var mapper: ((_ item: IntelligenceItem) -> any IndexedEntity)?

  @available(iOS 18.0, *)
  public func attachEntityMapper(mapper: @escaping (_ item: (id: String, representation: String)) -> any IndexedEntity) {
    self.mapper = mapper
  }
  
  public func index(items: [IntelligenceItem]) {
    let searchableItems = items.map { item -> CSSearchableItem in
      let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
      attributeSet.title = item.representation
      
      let searchableItem = CSSearchableItem(uniqueIdentifier: item.id,
                                  domainIdentifier: "", // TODO: put app's bundle id here
                                  attributeSet: attributeSet)
      if let mapper = mapper {
        searchableItem.associateAppEntity(mapper(item))
      }
      return searchableItem
    }
    CSSearchableIndex.default().indexSearchableItems(searchableItems) { error in
      if let error = error {
        print("Unable to index item: \(error)")
      }
    }
  }
  
}
