//
// Created by Agustin Cepeda on 29/08/23.
//

import UIKit

class PlayerViewController: UIViewController, Bindable {
  typealias ViewModel = PlayerViewModel
  var viewModel: PlayerViewModel!

  func bindViewModel() {
    navigationItem.title = "Player view controller"
    view.backgroundColor = .blue
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
  }

  @objc func didTap() {
    viewModel.didTap()
  }
}
