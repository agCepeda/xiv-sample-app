//
// Created by Agustin Cepeda on 29/08/23.
//

import Foundation

protocol PlayerViewModelDelegate: AnyObject {
  func didFinishPlaying()
}

class PlayerViewModel {
  weak var delegate: PlayerViewModelDelegate?

  init(delegate: PlayerViewModelDelegate? = nil) {
    self.delegate = delegate
  }

  func didTap() {
    delegate?.didFinishPlaying()
  }
}
