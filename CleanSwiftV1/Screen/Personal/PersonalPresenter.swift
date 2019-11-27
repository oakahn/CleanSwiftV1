import UIKit

protocol PersonalPresentationLogic {
  func presentSomething(response: Personal.Something.Response)
}

class PersonalPresenter: PersonalPresentationLogic {
  weak var viewController: PersonalDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Personal.Something.Response) {
    let viewModel = Personal.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
