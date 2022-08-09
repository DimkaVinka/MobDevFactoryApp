//
//  ExampleTwoView.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 09.08.2022.
//

import UIKit
import Combine
import SnapKit

final class SecondExampleViewController: UIViewController {
    
    var viewModel: SecondExampleViewModel?
    private var observer: AnyCancellable?
    
    // MARK: - Outlets
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Here will be image link"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Press to make request", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        
        observer = viewModel?.networkManager.$dogURL.sink(receiveValue: { value in
            DispatchQueue.main.async {
                self.label.text = value
            }
        })
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func setupLayout() {
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(view).offset(22)
            make.right.equalTo(view).offset(-22)
            make.height.equalTo(100)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(22)
            make.bottom.equalTo(view).offset(-22)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Actions
    
    @objc private func buttonPressed() {
        viewModel?.networkManager.fetchData()
    }
}
