//
// Created by Agustin Cepeda on 29/08/23.
//

import UIKit

class HomeViewController: UIViewController, Bindable {
  typealias ViewModel = HomeViewModel
  var viewModel: HomeViewModel!

  func bindViewModel() {
    navigationItem.title = "Home view controller"
    view.backgroundColor = .red
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
  }

  @objc func didTap() {
    viewModel.didTap()
  }
}
