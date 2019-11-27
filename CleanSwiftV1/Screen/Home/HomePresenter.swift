import UIKit

protocol HomePresentationLogic {
  func presentBNKList(response: Home.GetBNKList.Response)
}

class HomePresenter: HomePresentationLogic {
  
  weak var viewController: HomeDisplayLogic?
  
  func presentBNKList(response: Home.GetBNKList.Response) {
    guard let bnkList = response.bnkListModel else { return }
    
    let viewModel = Home.GetBNKList.ViewModel(bnkListModel: bnkList)
    viewController?.displayBNKList(viewModel: viewModel)
  }
}
