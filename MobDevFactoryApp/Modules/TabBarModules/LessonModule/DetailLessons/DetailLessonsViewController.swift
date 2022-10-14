//
//  DetailLessonsViewController.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import WebKit
import Combine
import SnapKit

class DetailLessonsViewController: UIViewController {
    
    // MARK: - Properties
    
    var cource: Cource?
    var webView = WKWebView()
    var detailLessonsViewModel = DetailLessonsViewModel()
    
    var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
        
        featchHTML()
        
        detailLessonsViewModel.$cource.sink { [weak self] cource in
            DispatchQueue.main.async {
                self?.cource = cource
            }
        }.store(in: &cancellables)
        
        detailLessonsViewModel.$webView.sink(receiveValue: { cource in
            DispatchQueue.main.async {
            }
        }).store(in: &cancellables)
    }
    
    func featchHTML() {
        do {
            guard let filePath = Bundle.main.path(forResource: cource?.cource_link, ofType: "html")
            else {
                print ("File reading error")
                return
            }
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            self.webView.loadHTMLString(contents, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
        }
    }
    
    @objc func bookmarked() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: self, action: #selector(unBookmarked))
    }
    
    @objc func unBookmarked() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(bookmarked))
    }
    // MARK: - Setup functions
    
    private func setupView() {
        title = cource?.cource_name
        view.backgroundColor = Metric.colorBackround
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        webView.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(bookmarked))
    }
    
    private func setupHierarchy() {
        view.addSubview(webView)
    }
    
    private func setupLayout() {
        webView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}




