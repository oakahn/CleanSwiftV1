import UIKit

protocol HomeBusinessLogic {
  func callBNKListService(request: Home.GetBNKList.Request)
}

protocol HomeDataStore {
  var bnkList: BNKListModel { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
  var presenter: HomePresentationLogic?
  var worker: HomeWorker?
  var bnkList: BNKListModel = BNKListModel()
  
  // MARK: Do something
  
  func callBNKListService(request: Home.GetBNKList.Request) {
    worker = HomeWorker()
    
    worker?.callBNKListService(page: request.page, memId: request.memId, completion: { (bnkList) in
      guard let bnkList = bnkList else { return }
      
      let response = Home.GetBNKList.Response(bnkListModel: bnkList)
      self.presenter?.presentBNKList(response: response)
    })
  }
}
