//
//  Alert.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 19.08.2022.
//

import UIKit
import SnapKit

class Alert {

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
    
    func showAletr(title: String, viewComtroller: UIViewController) {
        guard let targetView = viewComtroller.view else { return }
        backroundView.frame = targetView.bounds
        targetView.addSubview(backroundView)
        // ALERT
        targetView.addSubview(alertView)

        alertView.snp.makeConstraints { make in
            make.centerX.equalTo(targetView)
            make.top.equalTo(targetView).offset(-200)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(130)
        }
        alertView.addSubview(label)
        // LABEL
        label.snp.makeConstraints { make in
            make.top.equalTo(alertView)
            make.width.equalTo(Metric.widthTextFild)
            make.height.equalTo(90)
        }
        label.text = title
        // BUTTON
        alertView.addSubview(button)
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
    @objc private func dissmisActions(){
        UIView.animate(withDuration: 0.3, animations: {
            self.backroundView.alpha = 0
        }) { done in
            if done {
                UIView.animate(withDuration: 2, animations: {
                    self.backroundView.removeFromSuperview()
                    self.label.removeFromSuperview()
                    self.alertView.removeFromSuperview()
                })
            }
            
        }
        }

    }

