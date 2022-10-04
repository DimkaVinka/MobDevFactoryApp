//
//  OnboardingView.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 26.08.2022.
//

import UIKit
import SnapKit
import Combine

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    var onboardingModel = [Onboarding]()
    var viewModel = OnboardingViewModel()
    private var observer: AnyCancellable?
    
    var indexObserver = PassthroughSubject<Int, Never>()
    
    //@Published var currentIndex = Int()
    
    private var selectedIndex = 0 {
        didSet {
            let isListPage = onboardingModel.count - 1 > selectedIndex
            buttonView.setTitle(isListPage ? "Далее" : "Начать!", for: .normal)
            buttonView.backgroundColor = isListPage ? Metric.colorBackround : .systemGreen
        }
    }
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var colectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isPagingEnabled = true
        view.dataSource = self
        view.delegate = self
        view.showsHorizontalScrollIndicator = false
        view.register(OnboardingContentViewCell.self,
                      forCellWithReuseIdentifier: OnboardingContentViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        return pageControl
    }()
    
    lazy var buttonView: UIButton = {
        let buttonView = UIButton(type: .system)
        buttonView.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        buttonView.tintColor = .white
        buttonView.layer.cornerRadius = 44 / 2
        buttonView.addTarget(self, action: #selector(buttonTappedAction), for: .touchUpInside)
        return buttonView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
        
        configureView()
        viewModel.createOnboardingModel()
  
        observer = viewModel.$onboardingModel.sink(receiveValue: { value in
                self.onboardingModel = value
            self.pageControl.numberOfPages = value.count
            self.pageControl.currentPage = 0
            self.selectedIndex = 0
            self.colectionView.reloadData()
        })
    }
    
    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = Metric.colorBackround
    }
    
    private func setupHierarchy() {
        view.addSubview(colectionView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(buttonView)
    }
    
    private func setupLayout() {
        colectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(view.snp.height)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(colectionView.snp.bottom).offset(45)
            make.left.equalTo(view.snp.left).offset(40)
            make.right.equalTo(view.snp.right).offset(-40)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
        }
        buttonView.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(buttonView.snp.top).offset(-30)
        }
    }
    
    // MARK: - functions
    
    @objc func buttonTappedAction() {
        
        if onboardingModel.count - 1 > selectedIndex {
            colectionView.scrollToItem(at: IndexPath(item: selectedIndex + 1, section: 0),
                                       at: .centeredHorizontally, animated: true)
            
            selectedIndex += 1
            pageControl.currentPage += 1
        } else {
            SceneDelegate.shared.changeViewController(viewController: ModuleBuilder.builderAuthorizationViewController(), animationOptions: .transitionCrossDissolve)
        }
    }
    
    // MARK: - Configuration
    func configureView() {
//        pageControl.numberOfPages = onboardingModel.count
//        pageControl.currentPage = 0
//        selectedIndex = 0
//        colectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = colectionView.dequeueReusableCell(withReuseIdentifier: OnboardingContentViewCell.identifier, for: indexPath) as? OnboardingContentViewCell else { return UICollectionViewCell() }
        cell.configureView(with: onboardingModel[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let newIndexPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = newIndexPage
        selectedIndex = newIndexPage
    }
}
