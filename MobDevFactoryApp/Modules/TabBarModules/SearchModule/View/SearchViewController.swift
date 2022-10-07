//
//  SearchViewController.swift
//  MobDevFactoryApp
//
//  Created by Elena Nosck on 10.09.22.
//

import UIKit
import Combine
import CloudKit

final class SearchViewController: UIViewController, UITableViewDelegate {
    // MARK: - Properties
    
    var viewModel = SearchViewModel()
    
    private var searchView: SearchView? {
        guard isViewLoaded else { return nil }
        return view as? SearchView
    }
    
    var isSearching = false
    var glossary = [GlossaryDataModel]()
    var filteredDara = [GlossaryDataModel]()
    private var observer: AnyCancellable?
    
    // MARK: - View Life Cycle
    
    override func loadView() {
        view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        observer = viewModel.$glossary.sink { value in
            self.glossary = value
        }
        setupView()
        configureSearchController()
        setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    // MARK: - Settings
    
    func setupView() {
        searchView?.tableView.delegate = self
        searchView?.tableView.dataSource = self
        viewModel.loadJSON()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Глоссарий"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 103 / 255, green: 112 / 255, blue: 241 / 255, alpha: 1)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 103 / 255, green: 112 / 255, blue: 241 / 255, alpha: 1)]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureSearchController() {
        searchView?.searchController.searchBar.delegate = self
        searchView?.searchController.searchBar.delegate = self
    }
    
    private func setupGradient() {
        guard let searchView = searchView else { return }
        searchView.gradient.frame = searchView.descriptionView.bounds
        searchView.descriptionView.layer.addSublayer(searchView.gradient)
    }
}

// MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if isSearching {
                    return filteredDara.count
                } else {
                    return glossary.count
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let data: GlossaryDataModel
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        if isSearching {
                    data = filteredDara[indexPath.row]
                } else {
                    data = glossary[indexPath.row]
                }
        cell.textLabel?.text = "\(data.title)"
       
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let data: GlossaryDataModel
        if isSearching {
                    data = filteredDara[indexPath.row]
                } else {
                    data = glossary[indexPath.row]
                }
        let description = data.description
        searchView?.descriptionLabel.text = description
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchView?.searchController.searchBar.text else { return }
        if filteredDara.isEmpty {
            filteredDara = glossary
            isSearching = false
        } else {
            filteredDara = glossary.filter { name in
                name.description.lowercased().contains(text.lowercased()) || name.title.lowercased().contains(text.lowercased())
            }
            isSearching = true
        }
        searchView?.tableView.reloadData()
  }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        addKeybordObservers()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchView?.descriptionLabel.text = ""
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
}

// MARK: - Action

extension SearchViewController {
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
        guard let heightDescriptionView = searchView?.heightDescriptionView else { return }
        searchView?.constraintDescriptionView.constant -= (keyboardFrame.height - (heightDescriptionView))
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
            self.searchView?.constraintDescriptionView.constant = 0 - keyboardFrame.height + heightDescriptionView
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
        searchView?.constraintDescriptionView.constant = 0
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
}

// MARK: - Keyboard

extension SearchViewController {
    
    func addKeybordObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIApplication.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIApplication.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardObserves() {
        NotificationCenter.default.removeObserver(self,name: UIApplication.keyboardWillShowNotification, object: nil)
    }
}

