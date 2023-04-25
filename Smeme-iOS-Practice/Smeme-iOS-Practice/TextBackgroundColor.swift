//
//  textBackgroundColor.swift
//  Smeme-iOS-Practice
//
//  Created by 황찬미 on 2023/04/25.
//

import UIKit

final class TextBackgroundColor: UIViewController {
    
    var flag = false
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Edit menu interactions provide edit actions — such as cut, copy, and paste — for the content a view displays. The presentation style the interaction uses to display the actions conforms to the input method of the interaction. For touch interactions, the actions display in an editing menu. When responding to a secondary click on devices with pointer-based input, the actions display in a context menu."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.highlightedTextColor = .blue
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("버튼", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(highlightColor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.centerX.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func highlightColor() {
        guard let string = self.label.text else { return }
        flag = !flag
        
        if flag {
            let attributeString = NSMutableAttributedString(string: string)
            attributeString.addAttribute(.backgroundColor, value: UIColor.green, range: (string as NSString).range(of: "interactions"))
            self.label.attributedText = attributeString
        } else {
            self.label.text = string
        }
    }
}
