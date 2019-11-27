import UIKit

class BNKListMainView {
  
  var view: UIView?
  
  var backgroundView: UIView = {
    let uiView = UIView()
    uiView.translatesAutoresizingMaskIntoConstraints = false
    uiView.backgroundColor = .white
    return uiView
  }()
  
  var tableBNKList: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()
  
  func setupMainView(view: UIView) {
    self.view = view
    setupAddSubView()
    setupConstraint()
  }
  
  func setupAddSubView() {
    guard let view = self.view else { return }
    view.addSubview(backgroundView)
    view.addSubview(tableBNKList)
  }
  
  func setupConstraint() {
    setupBackgroundView()
    setupBNKListTableView()
  }
  
  private func setupBackgroundView() {
    guard let view = self.view else { return }

    backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  private func setupBNKListTableView() {
    guard let view = self.view else { return }
    
    var top: NSLayoutYAxisAnchor = view.topAnchor
    var bottom: NSLayoutYAxisAnchor = view.bottomAnchor
    
    if #available(iOS 11, *) {
      top = view.safeAreaLayoutGuide.topAnchor
      bottom = view.safeAreaLayoutGuide.bottomAnchor
    }
    
    tableBNKList.topAnchor.constraint(equalTo: top, constant: 16).isActive = true
    tableBNKList.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 8).isActive = true
    tableBNKList.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -8).isActive = true
    tableBNKList.bottomAnchor.constraint(equalTo: bottom, constant: -16).isActive = true
  }
}
