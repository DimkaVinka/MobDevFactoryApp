//
//  SearchViewModel.swift
//  MobDevFactoryApp
//
//  Created by Elena Noack on 10.09.22.
//

import Foundation
import UIKit

final class SearchViewModel {
    //MARK: - Properties
    
    static let shared = SearchViewModel()
    @Published private(set) var glossary: [GlossaryDataModel] = []
    
    //MARK: - Methods
    
    func loadJSON() {
        guard let path = Bundle.main.path(forResource: "glossary", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                  return
              }
        do {
            let list = try JSONDecoder().decode([GlossaryDataModel].self, from: data)
            glossary = list
        } catch {
            print(error)
        }
    }
}
