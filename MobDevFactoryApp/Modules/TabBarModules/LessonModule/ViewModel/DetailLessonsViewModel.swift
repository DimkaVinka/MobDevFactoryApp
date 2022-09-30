//
//  DetailLessonsViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import Foundation

class DetailLessonsViewModel {
    
    // MARK: - Properties
    var cource: Cource
    var view = DetailLessonsView()
    
    let link: String
    let courceName: String
    
    init(cource: Cource) {
        self.cource = cource
        self.link = cource.cource_link
        self.courceName = cource.cource_name
    }
    
    // MARK: - Functions
    func featchHTML(link: String) {
        do {
            guard let filePath = Bundle.main.path(forResource: link, ofType: "html")
            else {
                print ("File reading error")
                return
            }
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            view.webView.loadHTMLString(contents as String, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
        }
    }
}
