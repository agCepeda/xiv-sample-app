//
// Created by Agustin Cepeda on 29/08/23.
//

import UIKit

class AppCoordinator {

  var rootViewController = UINavigationController()

  init() {
    showHomeView()
  }

  func showHomeView() {
    let viewModel = HomeViewModel(delegate: self)
    var viewController = HomeViewController()

    viewController.setViewModel(to: viewModel)

    rootViewController.show(viewController, sender: self)
  }

  func showDetailView() {
    let viewModel = DetailViewModel(delegate: self)
    var viewController = DetailViewController()

    viewController.setViewModel(to: viewModel)

    rootViewController.show(viewController, sender: self)
  }

  func showPlayerView() {
    let viewModel = PlayerViewModel(delegate: self)
    var viewController = PlayerViewController()

    viewController.setViewModel(to: viewModel)

    rootViewController.show(viewController, sender: self)
  }
}

extension AppCoordinator: HomeViewModelDelegate {
  func navigateToDetail() {
    showDetailView()
  }
}

extension AppCoordinator: DetailViewModelDelegate {
  func navigateToPlayer() {
    showPlayerView()
  }
}

extension AppCoordinator: PlayerViewModelDelegate {
  func didFinishPlaying() {
    rootViewController.popToRootViewController(animated: true)
  }
}
