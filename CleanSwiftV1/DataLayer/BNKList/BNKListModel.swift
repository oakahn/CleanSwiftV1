import Foundation
import ObjectMapper

class BNKListModel: Mappable {
  
  var imageLink: String?
  var memName: String?
  
  required init?(map: Map) { }
  
  func mapping(map: Map) {
    imageLink <- map["meminsta_link"]
    memName <- map["mem_nickname"]
  }
}
