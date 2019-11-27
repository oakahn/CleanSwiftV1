import UIKit

protocol HomeDisplayLogic: class {
  func displayBNKList(viewModel: Home.GetBNKList.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
  
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
  
  var bnkList: [BNKListModel] = []

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  let mainView = BNKListMainView()
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMainView()
  }
  
  private func setupMainView() {
    mainView.setupMainView(view: view)
    setupTable()
    doGetBNKList()
  }
  
  private func setupTable() {
    mainView.tableBNKList.estimatedRowHeight = 300
    mainView.tableBNKList.rowHeight = UITableView.automaticDimension
    mainView.tableBNKList.register(BNKTableViewCell.self, forCellReuseIdentifier: "cell")
    mainView.tableBNKList.dataSource = self
    mainView.tableBNKList.delegate = self
    mainView.tableBNKList.separatorStyle = .none
    mainView.tableBNKList.showsVerticalScrollIndicator = false
  }
  
  // MARK: Do something
  
  func doGetBNKList() {
    let request = Home.GetBNKList.Request(memId: 4, page: 0)
    interactor?.callBNKListService(request: request)
  }
  
  func displayBNKList(viewModel: Home.GetBNKList.ViewModel) {
    guard let bnkList = viewModel.bnkListModel else { return }
    self.bnkList = bnkList
    mainView.tableBNKList.reloadData()
  }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bnkList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BNKTableViewCell else {
      return UITableViewCell()
    }
    
    cell.selectionStyle = .none
        
    guard let image = bnkList[indexPath.row].imageLink else { return UITableViewCell() }
    guard let url = URL(string: image) else { return UITableViewCell() }
    guard let name = bnkList[indexPath.row].memName else { return UITableViewCell() }
    
    cell.bnkImage.downloadImage(from: url)
    cell.bnkNameLabel.text = "\(name).bnk48official"
    
    return cell
  }
}
