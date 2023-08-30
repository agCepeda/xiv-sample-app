//
// Created by Agustin Cepeda on 29/08/23.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
  func navigateToPlayer()
}

class DetailViewModel {
  weak var delegate: DetailViewModelDelegate?

  init(delegate: DetailViewModelDelegate? = nil) {
    self.delegate = delegate
  }

  func didTap() {
    delegate?.navigateToPlayer()
  }
}
