//
//  ExampleView.swift
//  MobDevFactoryApp
//
//  Created by Дмитрий Виноградов on 08.08.2022.
//

import UIKit
import Combine
import SnapKit

class ExampleViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Press to download image", for: .normal)
        button.backgroundColor = .systemYellow
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var viewModel: ExampleViewModel?
    private var observer: AnyCancellable?
    var networkManager = NetworkManager.shared
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        
        observer = networkManager.$dogURL.sink(receiveValue: { value in
            self.image.load(url: URL(string: value) ?? URL(string: "https://sugarplumnannies.com/wp-content/uploads/2015/11/dog-placeholder.jpg")!)
        })
    }
    
    // MARK: - Setup
    
    func setupHierarchy() {
        view.addSubview(image)
        view.addSubview(button)
    }
    
    func setupLayout() {
        image.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(view).offset(22)
            make.right.equalTo(view).offset(-22)
            make.height.equalTo(image.snp.width)
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
        present(ModuleBuilder.builderExampleSecondModule(), animated: true)
    }
}
