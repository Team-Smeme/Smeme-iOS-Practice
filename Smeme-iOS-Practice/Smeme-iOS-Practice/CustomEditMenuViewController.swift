//
//  ViewController.swift
//  Smeme-iOS-Practice
//
//  Created by 황찬미 on 2022/12/29.
//

import UIKit

import SnapKit

class CustomEditMenuViewController: UIViewController, UIEditMenuInteractionDelegate, UITextViewDelegate {
    
    var arrayText: [String] = []
    
    var editMenuInteraction: UIEditMenuInteraction?
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "Edit menu interactions provide edit actions — such as cut, copy, and paste — for the content a view displays. The presentation style the interaction uses to display the actions conforms to the input method of the interaction. For touch interactions, the actions display in an editing menu. When responding to a secondary click on devices with pointer-based input, the actions display in a context menu."
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.isEditable = false
        textView.backgroundColor = .white
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(100)
        }
        textView.delegate = self
    }
        
        func textView(_ textView: UITextView, editMenuForTextIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu? {

            var additionalActions: [UIMenuElement] = []

            if textView.selectedRange.length > 0 {
                let highlightAction = [UIAction(title: "Smeme") { _ in
                    if !(textView.selectedTextRange?.isEmpty)! {
                        let selectedString = textView.text(in: textView.selectedTextRange!)
                        guard let selectedString = selectedString else { return }
                        print("select : \(selectedString)")
                    }
                }]
                additionalActions.append(contentsOf:highlightAction)
            }
            
            return UIMenu(children: additionalActions)
        }
        
    }
