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

extension Bindable where Self: UITableViewCell {
   mutating func setViewModel(to model: Self.ViewModel) {
    viewModel = model
    bindViewModel()
    setNeedsLayout()
  }
}

extension Bindable where Self: UICollectionViewCell {
  mutating func setViewModel(to model: Self.ViewModel) {
    viewModel = model
    bindViewModel()
    setNeedsLayout()
  }
}

extension Bindable where Self: UIView {
  mutating func setViewModel(to model: Self.ViewModel) {
    viewModel = model
    bindViewModel()
    setNeedsLayout()
  }
}
