//
//  Alert.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 19.08.2022.
//

import UIKit
import SnapKit

class Alert: UIView {

    private lazy var backroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    private lazy var alertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("OK", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(dissmisActions), for: .touchUpInside)
        return button
    }()
    
    func showAlert(title: String, viewComtroller: UIViewController) {
        guard let targetView = viewComtroller.view else { return }
        backroundView.frame = targetView.bounds
        targetView.addSubview(backroundView)
        // ALERT
        
        targetView.addSubview(alertView)
        alertView.addSubview(label)
        alertView.addSubview(button)

        alertView.snp.makeConstraints { make in
            make.centerX.equalTo(backroundView)
            make.top.equalTo(backroundView)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(130)
        }
        // LABEL
        label.snp.makeConstraints { make in
            make.top.equalTo(alertView)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(90)
        }
        label.text = title
        // BUTTON
        button.snp.makeConstraints { make in
            make.top.equalTo(alertView).offset(90)
            make.bottom.equalTo(alertView)
            make.width.equalTo(Metric.widthTextFild)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.backroundView.alpha = 0.8
        }) { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = targetView.center
                }
            }
        }
    }
    //MARK: Actions Alert
    @objc private func dissmisActions() {
        UIView.animate(withDuration: 0.3) {
            self.backroundView.alpha = 0
            self.alertView.alpha = 0
            self.button.alpha = 0
            self.label.alpha = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.backroundView.removeFromSuperview()
                self.alertView.removeFromSuperview()
                self.label.removeFromSuperview()
                self.button.removeFromSuperview()
            }
        } completion: { _ in
            
        }
    }
}
