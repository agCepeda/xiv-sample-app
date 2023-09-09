//
// Created by Agustin Cepeda on 05/09/23.
//

import Combine

class CategoriesListViewModel: ObservableObject {
  @Published var categories: [String]
  var didSelectCategory: ((_: String) -> Void)?

  init(categories: [String],
       didSelectCategory: ((String) -> Void)? = nil) {
    self.categories = categories
    self.didSelectCategory = didSelectCategory
  }

  func selectCategory(at index: Int) {
    didSelectCategory?(categories[index])
  }
}
