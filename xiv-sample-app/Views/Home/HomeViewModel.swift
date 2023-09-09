//
// Created by Agustin Cepeda on 29/08/23.
//

import Foundation

let globalCategories = ["Inicio", "Cine", "Novelas", "Permium", "Comedia", "Inicio", "Cine", "Novelas", "Permium", "Comedia"]

protocol HomeViewModelDelegate: AnyObject {
  func navigateToDetail()
}

class HomeViewModel {

  enum CellType {
    case medium
    case large
  }

  weak var delegate: HomeViewModelDelegate?
  var cellTypes: [CellType] = [ .large, .medium, .medium]
  private var selectedCategory: String?

  public var categoriesListViewModel: CategoriesListViewModel {
    CategoriesListViewModel(categories: globalCategories) { category in
      self.selectedCategory = category
    }
  }

  init(delegate: HomeViewModelDelegate? = nil) {
    self.delegate = delegate
  }

  func didTap() {
    delegate?.navigateToDetail()
  }
}
