//
//  DetailLessonsView.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 30.09.2022.
//

import UIKit
import SnapKit
import WebKit

class DetailLessonsView: UIView {
    
    // MARK: - Properties
    var webView = WKWebView()
    
    // MARK: - Initial
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Settings
    func setupView() {
        backgroundColor = Metric.colorBackround
    }
    
    func setupHierarchy() {
        addSubview(webView)
    }
    
    func setupLayout() {
        webView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(snp.bottom)
        }
    }
}

