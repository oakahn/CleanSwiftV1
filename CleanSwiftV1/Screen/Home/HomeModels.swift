import UIKit

enum Home {
  // MARK: Use cases
  
  enum GetBNKList {
    struct Request {
      var memId: Int
      var page: Int
    }
    
    struct Response {
      var bnkListModel: [BNKListModel]?
      
      init(bnkListModel: [BNKListModel]) {
        self.bnkListModel = bnkListModel
      }
    }
    
    struct ViewModel {
      var bnkListModel: [BNKListModel]?
      
      init(bnkListModel: [BNKListModel]) {
        self.bnkListModel = bnkListModel
      }
    }
  }
}
