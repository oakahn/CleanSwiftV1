import UIKit

protocol PersonalBusinessLogic {
  func doSomething(request: Personal.Something.Request)
}

protocol PersonalDataStore {
  //var name: String { get set }
  var name: String { get set }
}

class PersonalInteractor: PersonalBusinessLogic, PersonalDataStore {
  
  var presenter: PersonalPresentationLogic?
  var worker: PersonalWorker?
  
  var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Personal.Something.Request) {
    worker = PersonalWorker()
    worker?.doSomeWork()
    
    let response = Personal.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
