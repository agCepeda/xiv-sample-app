//
// Created by Agustin Cepeda on 09/09/23.
//

import UIKit

class GalleryTableViewModel {
  let items: [String] = ["1", "2", "3", "4", "5"]
}

class GalleryTableViewCell: UITableViewCell, Bindable, UICollectionViewDelegate, UICollectionViewDataSource {

  typealias ViewModel = GalleryTableViewModel
  var viewModel: GalleryTableViewModel!

  lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemPink
    view.dataSource = self
    view.delegate = self
    return view
  }()

  lazy var collectionLayout: UICollectionViewLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal

    let width = (UIApplication.shared.keyWindow?.bounds.width ?? 0.0) * 0.85
    let height = width * 0.5625

    layout.itemSize = CGSize(width: width, height: height)
    layout.minimumInteritemSpacing = 8.0
    return layout
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  func setupView() {
    backgroundColor = .yellow
    layer.borderWidth = 1.0
    layer.borderColor = UIColor.green.cgColor
    collectionView.layer.borderWidth = 1.0
    collectionView.layer.borderColor = UIColor.red.cgColor
    collectionView.register(GalleryItemCollectionViewCell.self, forCellWithReuseIdentifier: GalleryItemCollectionViewCell.identifier)

    let width = (UIApplication.shared.keyWindow?.bounds.width ?? 0.0) * 0.85
    let height = width * 0.5625
    contentView.addSubview(collectionView)

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: height + 16.0),
    ])
  }

  func bindViewModel() {
    collectionView.reloadData()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryItemCollectionViewCell.identifier, for: indexPath) as? GalleryItemCollectionViewCell
    else { fatalError() }

    cell.backgroundColor = .darkGray

    return cell
  }
}
