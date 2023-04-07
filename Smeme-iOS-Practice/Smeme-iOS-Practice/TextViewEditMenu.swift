//
//  TextViewEditMenu.swift
//  Smeme-iOS-Practice
//
//  Created by 황찬미 on 2023/04/07.
//

import UIKit

import SnapKit

class TextViewEditMenu: UIViewController, UITextViewDelegate {
    
    let textView: UITextView = {
       let textView = UITextView()
        textView.text = "Edit menu interactions provide edit actions — such as cut, copy, and paste — for the content a view displays. The presentation style the interaction uses to display the actions conforms to the input method of the interaction. For touch interactions, the actions display in an editing menu. When responding to a secondary click on devices with pointer-based input, the actions display in a context menu."
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 15, weight: .medium)
        textView.isEditable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(textView)
        
        textView.delegate = self
        
        textView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    func textView(_ textView: UITextView,
                  editMenuForTextIn range: NSRange,
                  suggestedActions: [UIMenuElement]) -> UIMenu? {
        var additionalActions: [UIMenuElement] = []
        
        if range.length > 0 {
            let chanmiAction = UIAction(title: "짠미") {_ in
                print(textView.text(in: textView.selectedTextRange!)!)
            }
            additionalActions.append(chanmiAction)
        }
        return UIMenu(children: additionalActions)
    }
}
