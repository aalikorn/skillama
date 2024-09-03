//
//  ViewController.swift
//  skillama
//
//  Created by Даша Николаева on 01.09.2024.
//

import UIKit
import SwiftSVG

class ViewController: UIViewController {
    
    private let findSkillButton = UIButton()
    private let suggestSkillButton = UIButton()
    private var image = UIImage()
    private var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureChoiceButtons()
        configureImage()
    }
    
    private func configureImage() {
        guard let image = UIImage(named: "llama") else { return }
        imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0)
        ])
    }
    
    private func configureChoiceButtons() {
        findSkillButton.setTitle("Найти навык", for: .normal)
        suggestSkillButton.setTitle("Предложить свой навык", for: .normal)
        
        findSkillButton.translatesAutoresizingMaskIntoConstraints = false
        suggestSkillButton.translatesAutoresizingMaskIntoConstraints = false
        
        findSkillButton.layer.cornerRadius = 10
        suggestSkillButton.layer.cornerRadius = 10
        
        findSkillButton.layer.borderWidth = 2
        suggestSkillButton.layer.borderWidth = 2
        
        findSkillButton.layer.borderColor = UIColor.gray.cgColor
        suggestSkillButton.layer.borderColor = UIColor.gray.cgColor
        
        findSkillButton.setTitleColor(.black, for: .normal)
        suggestSkillButton.setTitleColor(.black, for: .normal)
        
        findSkillButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        suggestSkillButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        view.addSubview(findSkillButton)
        view.addSubview(suggestSkillButton)
        
        NSLayoutConstraint.activate([
            findSkillButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            findSkillButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            findSkillButton.widthAnchor.constraint(equalToConstant: 250),
            findSkillButton.heightAnchor.constraint(equalToConstant: 50),
            
            suggestSkillButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suggestSkillButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            suggestSkillButton.widthAnchor.constraint(equalToConstant: 250),
            suggestSkillButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        findSkillButton.addTarget(self, action: #selector(findSkillButtonAction), for: .touchUpInside)
        suggestSkillButton.addTarget(self, action: #selector(suggestSkillButtonAction), for: .touchUpInside)
        
    }
    
    @objc func findSkillButtonAction() {
        
    }
    
    @objc func suggestSkillButtonAction() {
        let controller = SuggestSkillViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}

