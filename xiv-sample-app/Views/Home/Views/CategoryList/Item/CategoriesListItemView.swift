//
// Created by Agustin Cepeda on 05/09/23.
//

import UIKit

class CategoriesListItemView: UIView {

  var onSelectItem: (() -> Void)? = nil

  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  init() {
    super.init(frame: .zero)
    setupView()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    layer.cornerRadius = 18.0
    layer.borderWidth = 1.0
    layer.borderColor = UIColor.lightGray.cgColor
    backgroundColor = UIColor.darkGray
    addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.0),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14.0),
      heightAnchor.constraint(equalToConstant: 36.0),
    ])

    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
  }

  @objc func didTap() {
    onSelectItem?()
  }

  func select() {
    backgroundColor = .lightGray
    titleLabel.textColor = .label
  }

  func deselect() {
    backgroundColor = .darkGray
    titleLabel.textColor = .label
  }
}
