//
// Created by Agustin Cepeda on 01/09/23.
//

import UIKit

class CategoriesListView: UIView, Bindable {
  typealias ViewModel = CategoriesListViewModel
  var buttons = [CategoriesListItemView]()

  var viewModel: CategoriesListViewModel!

  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentInset = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
    scrollView.backgroundColor = UIColor.darkGray
    scrollView.isScrollEnabled = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()

  private let containerView: UIStackView = {
    let containerView = UIStackView()
    containerView.spacing = 8.0
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
  }()

  init() {
    super.init(frame: .zero)
    setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    scrollView.contentSize = containerView.bounds.size
  }

  private func setupUI() {
    scrollView.addSubview(containerView)
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

      containerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      containerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),

      containerView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -16.0),
    ])
  }

  func bindViewModel() {
    addButtons(viewModel.categories)
    setNeedsLayout()
  }

  private func addButtons(_ buttonTitles: [String]) {
    var buttons = [CategoriesListItemView]()
    for (index, title) in buttonTitles.enumerated() {
      let itemView = CategoriesListItemView()
      itemView.titleLabel.text = title
      itemView.onSelectItem = {
        self.didSelectItem(index)
      }

      containerView.addArrangedSubview(itemView)
      buttons.append(itemView)
    }

    self.buttons = buttons
  }

  private func didSelectItem(_ index: Int) {
    viewModel.selectCategory(at: index)
    for i in 0..<buttons.count {
      if i == index {
        buttons[i].select()
      } else {
        buttons[i].deselect()
      }
    }
  }
}
