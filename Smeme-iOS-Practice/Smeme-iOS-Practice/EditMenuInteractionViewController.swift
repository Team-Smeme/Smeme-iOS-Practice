//
//  ViewController.swift
//  Smeme-iOS-Practice
//
//  Created by 황찬미 on 2022/12/29.
//

import UIKit

import SnapKit

class ViewController: UIViewController, UIEditMenuInteractionDelegate {
    
    var arrayText: [String] = []
    
    var editMenuInteraction: UIEditMenuInteraction?
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "Edit menu interactions provide edit actions — such as cut, copy, and paste — for the content a view displays. The presentation style the interaction uses to display the actions conforms to the input method of the interaction. For touch interactions, the actions display in an editing menu. When responding to a secondary click on devices with pointer-based input, the actions display in a context menu."
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.isEditable = false
        textView.backgroundColor = .black
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
        
        setupEditMenuInteraction()
    }
        
    private func setupEditMenuInteraction() {
            
            // Addding Menu Interaction to TextView
        editMenuInteraction = UIEditMenuInteraction(delegate: self)
        textView.addInteraction(editMenuInteraction!)
            
            // Addding Long Press Gesture
        let longPressGestureRecognizer =
        UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        textView.addGestureRecognizer(longPressGestureRecognizer)
    }
        
    @objc
        func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
            guard gestureRecognizer.state == .began else { return }
            
            let configuration = UIEditMenuConfiguration(
                identifier: "textViewEdit",
                sourcePoint: gestureRecognizer.location(in: textView)
            )
            
            editMenuInteraction?.presentEditMenu(with: configuration)
        }
    }

extension ViewController {
    func editMenuInteraction(_ interaction: UIEditMenuInteraction,
                             menuFor configuration: UIEditMenuConfiguration,
                             suggestedActions: [UIMenuElement]) -> UIMenu? {
        
        var actions = suggestedActions
        
        let customMenu = UIMenu(title: "", options: .displayInline, children: [
            UIAction(title: "menuItem1") { _ in
                print("menuItem1")
            },
            UIAction(title: "menuItem2") { _ in
                print("menuItem2")
            },
            UIAction(title: "menuItem3") { _ in
                print("menuItem3")
            }
        ])
        
        actions.append(customMenu)
        
        return UIMenu(children: actions) // For Custom and Suggested Menu
        
        return UIMenu(children: customMenu.children) // For Custom Menu Only
    }
}

