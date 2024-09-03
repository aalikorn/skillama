//
//  SuggestSkillViewController.swift
//  skillama
//
//  Created by Даша Николаева on 01.09.2024.
//

import UIKit

class SuggestSkillViewController: UIViewController {
    
    private let suggestSkillView = SuggestSkillView()
    private var newSkill: Skill?
    
    private let chooseSkillViewController = ChooseSkillViewController()
    private var chosenSkill: String? = nil
    
    internal var elseSkill: String? = nil
    private var moreAboutSkillLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        chooseSkillViewController.delegate = self
        suggestSkillView.setElseTextFieldDelegate(self)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        suggestSkillView.addTargetSkillToChoiceButton(target: self, action: #selector(skillChoiceButtonAction))
    }
    
    private func addView() {
        view.addSubview(suggestSkillView)
        suggestSkillView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            suggestSkillView.topAnchor.constraint(equalTo: view.topAnchor),
            suggestSkillView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            suggestSkillView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suggestSkillView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setActions() {
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func skillChoiceButtonAction() {
        navigationController?.pushViewController(chooseSkillViewController, animated: true)
    }
    
}

extension SuggestSkillViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        elseSkill = suggestSkillView.getElseSkillText()
        return true
    }
}


extension SuggestSkillViewController: ChooseSkillDelegate {
    func didSelectSkill(_ skill: String) {
        suggestSkillView.changeSkillButton(skill)
        chosenSkill = skill
        if chosenSkill == "Другое" {
            suggestSkillView.showElseTextField()
        } else {
            suggestSkillView.hideElseTextField()
        }
    }
}


