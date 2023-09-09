//
// Created by Agustin Cepeda on 29/08/23.
//

import UIKit

class HomeViewController: UIViewController, Bindable {
  typealias ViewModel = HomeViewModel
  var viewModel: HomeViewModel!

  let tableView = UITableView(frame: .zero)

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Home view controller"
    view.backgroundColor = .red

    tableView.register(GalleryTableViewCell.self, forCellReuseIdentifier: GalleryTableViewCell.identifier)

    tableView.delegate = self
    tableView.dataSource = self
  }

  func bindViewModel() {
    categoriesListView.setViewModel(to: viewModel.categoriesListViewModel)
    tableView.reloadData()
  }

  @objc func didTap() {
    viewModel.didTap()
  }
  var categoriesListView = CategoriesListView()

  override func loadView() {
    categoriesListView.translatesAutoresizingMaskIntoConstraints = false

    let stack = UIStackView(arrangedSubviews: [categoriesListView, tableView])
    stack.axis = .vertical
    stack.translatesAutoresizingMaskIntoConstraints = false

    let wrapper = UIView()
    wrapper.addSubview(stack)

    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.topAnchor),
      stack.bottomAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.bottomAnchor),
      stack.leadingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: wrapper.safeAreaLayoutGuide.trailingAnchor),
    ])

    view = wrapper
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  public func numberOfSections(in tableView: UITableView) -> Int {
    viewModel.cellTypes.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }

  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let label = UILabel()
    label.text = "SECTION"
    return label
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellType = viewModel.cellTypes[indexPath.section]
    switch cellType {
    case .large:
      guard var cell = tableView.dequeueReusableCell(withIdentifier: GalleryTableViewCell.identifier, for: indexPath) as? GalleryTableViewCell
        else { fatalError() }
      cell.setViewModel(to: GalleryTableViewModel())
      return cell
    case .medium:
      let cell = UITableViewCell(style: .default, reuseIdentifier: "")
      cell.textLabel?.text = "medium"
      return cell
//    case .category:
//      guard var cell = tableView.dequeueReusableCell(withIdentifier: CategoryListTableViewCell.identifier,
//                                                     for: indexPath) as? CategoryListTableViewCell
//        else { fatalError() }
//      let cellViewModel = CategoriesViewModel(categories: globalCategories)
//      cell.setViewModel(to: cellViewModel)
//      return cell
    }
  }
}
