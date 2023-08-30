//
// Created by Agustin Cepeda on 30/08/23.
//

import UIKit

protocol Bindable {
  associatedtype ViewModel

  var viewModel: ViewModel! { get set }
  func bindViewModel()
}

extension Bindable where Self: UIViewController {
  mutating func setViewModel(to model: Self.ViewModel) {
    viewModel = model
    loadViewIfNeeded()
    bindViewModel()
  }
}