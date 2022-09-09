//
//  CreatePersonViewController.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 17.08.2022.
//

import UIKit
import SnapKit

protocol CreateProfileViewControllerDelegate: AnyObject {
    func dissmiss()
}

class CreatePersonViewController: UIViewController, CreateProfileViewControllerDelegate {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        scrollView.backgroundColor = UIColor.clear
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let createProfileView: CreatePersonView = {
        let view = CreatePersonView()
        return view
    }()
    
    private var activeTextField: UITextField?
    let imagePicker = UIImagePickerController()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.createProfileView.firstNameTextField.delegate = self
        self.createProfileView.editStatusTextField.delegate = self
        self.createProfileView.editCityTextField.delegate = self
        self.createProfileView.editMailTextField.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    // MARK: - Peivate methods
    
    private func setupHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(createProfileView)
        
        settingsActiveTextField()
        hideKeyboardsTap()
        createLayout()
        
        imagePicker.delegate = self
        createTapGesture()
    }
    
    private func settingsActiveTextField() {
        self.activeTextField = UITextField()
    }
    
    private func hideKeyboardsTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        print("Клавиатура отображена")
        guard let keyBoardInfo = notification.userInfo else { return }
        if let keyboardSize = (keyBoardInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            let keyboardHeight = keyboardSize.height + 10
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            self.scrollView.contentInset = contentInsets
            var viewRect = self.view.frame
            viewRect.size.height -= keyboardHeight
            
            guard let activeField = self.activeTextField else { return }
            if (!viewRect.contains(activeField.frame.origin)) {
                let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y - keyboardHeight)
                self.scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        print("Клавиатура скрыта")
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
    }
    
    private func createTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_ :)))
        createProfileView.profilePhotoImage.addGestureRecognizer(tapGesture)
        createProfileView.profilePhotoImage.isUserInteractionEnabled = true
    }
    
    @objc func tapOnImage(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Изображение", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "С фотогалереи", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "С камеры", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            alert.addAction(actionPhoto)
            alert.addAction(actionCamera)
            alert.addAction(actionCancel)
            
            present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Constraints
    
    private func createLayout() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        createProfileView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            
            make.height.equalTo(scrollView.snp.height)
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
    func dissmiss() {
        self.dismiss(animated: true) {
            print("dismissed")
        }
    }
}

// MARK: - UITextFieldDelegate

extension CreatePersonViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.activeTextField = nil
        return true
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension CreatePersonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            createProfileView.profilePhotoImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

