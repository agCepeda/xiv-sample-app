//
// Created by Agustin Cepeda on 29/08/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
  func navigateToDetail()
}

class HomeViewModel {
  weak var delegate: HomeViewModelDelegate?

  init(delegate: HomeViewModelDelegate? = nil) {
    self.delegate = delegate
  }

  func didTap() {
    delegate?.navigateToDetail()
  }
}
