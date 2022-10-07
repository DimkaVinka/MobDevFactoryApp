//
//  AlertTabBar.swift
//  MobDevFactoryApp
//
//  Created by Daniil Litvinov on 15.09.2022.
//

import UIKit
import SnapKit

class AlertTabBar: UIView {
    
    private lazy var backroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private lazy var alertView: UIView = {
        let view = UIView()
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
    
    private var myTargetView: UIView?
    
    func showAlertTabBar(title: String, viewComtroller: UIViewController) {
        guard let targetView = viewComtroller.view else { return }
        
        myTargetView = targetView
        backroundView.frame = targetView.bounds
        targetView.addSubview(backroundView)
        // ALERT
        targetView.addSubview(alertView)
        alertView.addSubview(label)
        
        alertView.snp.makeConstraints { make in
            make.centerX.equalTo(targetView)
            make.top.equalTo(targetView).offset(-200)
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
        
        UIView.animate(withDuration: 0.3, animations: { [self] in
            self.backroundView.alpha = 0.8
            self.alertView.alpha = 1
        }) { done in
            if done {
                UIView.animate(withDuration: 0.1) {
                    self.alertView.center = targetView.center
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.alertView.removeFromSuperview()
                    }
                }
            }
        }
    }
}
