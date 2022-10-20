//
//  DetailLessonsViewModel.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import Foundation
import WebKit
import Combine


class DetailLessonsViewModel {
    
    // MARK: - Properties
    @Published var cource: Cource?

    
//    // MARK: - Functions
//    func featchHTML() {
//        do {
//            guard let filePath = Bundle.main.path(forResource: cource?.cource_link, ofType: "html")
//            else {
//                print ("File reading error")
//                return
//            }
//            let content =  try String(contentsOfFile: filePath, encoding: .utf8)
//            let baseUrl = URL(fileURLWithPath: filePath)
//            webView.loadHTMLString(content, baseURL: baseUrl)
//        }
//        catch {
//            print ("File HTML error")
//        }
//    }
}



