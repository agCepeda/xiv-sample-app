//
// Created by Agustin Cepeda on 29/08/23.
//

import UIKit

class DetailViewController: UIViewController, Bindable {
  typealias ViewModel = DetailViewModel
  var viewModel: DetailViewModel!

  func bindViewModel() {
    navigationItem.title = "Detail view controller"
    view.backgroundColor = .white
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
  }

  @objc func didTap() {
    viewModel.didTap()
  }
}
