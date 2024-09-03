//
//  SuggestSkillswift
//  skillama
//
//  Created by Даша Николаева on 02.09.2024.
//

import UIKit

class SuggestSkillView: UIView {

    private let skillChoiseButton = UIButton()
    private var elseTextField = UITextField()
    private let inDetailTextView = UITextView()
    private let inDetailLabel = UILabel()
    private var view2 = UIView()
    private var view1 = UIView()
    private var view3 = UIView()
    private var onlineLabel = UILabel()
    private var onlineSegmentedControl = UISegmentedControl()
    private var commonSubview = UIView()
    private var topConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    private var view1HeightConstraint: NSLayoutConstraint?
    private var chooseConstraint: NSLayoutConstraint?
    private let lightPinkColor = UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 0.4)
    
    private func configureOnlineSegmentedController() {
        
    }
    
    private func configureOnlineLabel() {
        onlineLabel.text = "В каком формате вы планируете проводить занятия?"
        onlineLabel.numberOfLines = 0
        onlineLabel.font = UIFont.systemFont(ofSize: 20)
        view3.addSubview(onlineLabel)
        onlineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onlineLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            onlineLabel.centerYAnchor.constraint(equalTo: view3.centerYAnchor, constant: -35),
            onlineLabel.widthAnchor.constraint(equalToConstant: 330)
        ])
    }
    
    private func configureFirstSubview() {
        addSubview(view1)
        view1HeightConstraint = view1.heightAnchor.constraint(equalToConstant: CGFloat(78))
        view1.layer.cornerRadius = 10
        view1.backgroundColor = lightPinkColor
        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view1.centerXAnchor.constraint(equalTo: centerXAnchor),
            view1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -250),
            view1HeightConstraint!,
            view1.widthAnchor.constraint(equalToConstant: CGFloat(360)),
        ])
    }
    
    
    private func configureCommonSubview() -> UIView {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        topConstraint = view.topAnchor.constraint(equalTo: topAnchor, constant: -110)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            topConstraint!,
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        return view
    }
    
    private func moveCommonSubview(_ newConstant: Int) {
        
        if let oldConstraint = topConstraint {
            removeConstraint(oldConstraint)
        }
        
        topConstraint = commonSubview.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(newConstant))
        topConstraint?.isActive = true
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
            self.commonSubview.layoutIfNeeded()
        }
        
        
    }
    
    private func configureSubviews() {
        commonSubview = configureCommonSubview()
        
        configureFirstSubview()
        
        view2 = configureSubview(y: 0, height: 260, width: 360, parentView: commonSubview)
        view3 = configureSubview(y: 238, height: 150, width: 360, parentView: commonSubview)
    }
    
    private func configureInDetailTextField() {
        inDetailTextView.layer.cornerRadius = 10
        inDetailTextView.layer.borderWidth = 2
        inDetailTextView.layer.borderColor = UIColor.gray.cgColor
        inDetailTextView.font = UIFont.systemFont(ofSize: 18)
        view2.addSubview(inDetailTextView)
        inDetailTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inDetailTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            inDetailTextView.centerYAnchor.constraint(equalTo: view2.centerYAnchor, constant: 32),
            inDetailTextView.widthAnchor.constraint(equalToConstant: 330),
            inDetailTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureInDetailLabel() {
        inDetailLabel.text = "Расскажите подробнее о том, чему вы можете научить и о своем опыте в этой сфере"
        inDetailLabel.font = UIFont.systemFont(ofSize: 20)
        view2.addSubview(inDetailLabel)
        inDetailLabel.numberOfLines = 0
        inDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inDetailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            inDetailLabel.centerYAnchor.constraint(equalTo: inDetailTextView.centerYAnchor, constant: -120),
            inDetailLabel.widthAnchor.constraint(equalToConstant: 330),
            
        ])
    }
    
    internal func getElseSkillText() -> String? {
        if let text = elseTextField.text {
            return text
        } else {
            return nil
        }
    }
    
    func setElseTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        elseTextField.delegate = delegate
    }
    
    internal func changeSkillButton(_ skill: String) {
        skillChoiseButton.setTitle(skill, for: .normal)
        skillChoiseButton.setImage(nil, for: .normal)
        skillChoiseButton.setTitleColor(.black, for: .normal)
    }
    
    
    internal func hideElseTextField() {
        view1HeightConstraint?.isActive = false
        
        if let oldConstraint =  view1HeightConstraint {
            
            removeConstraint(oldConstraint)
        }
        
        view1HeightConstraint = view1.heightAnchor.constraint(equalToConstant: CGFloat(78))
        view1HeightConstraint?.isActive = true
        
        elseTextField.isHidden = true
        moveCommonSubview(-110)
        
        chooseConstraint?.isActive = false
        
        if let oldChooseConstraint =  chooseConstraint {
            removeConstraint(oldChooseConstraint)
        }
        
        chooseConstraint = skillChoiseButton.centerYAnchor.constraint(equalTo: view1.centerYAnchor, constant: 0)
        
        chooseConstraint?.isActive = true
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }

    internal func showElseTextField() {
        
        view1HeightConstraint?.isActive = false
        
        if let oldConstraint =  view1HeightConstraint {
            removeConstraint(oldConstraint)
        }
        
        view1HeightConstraint = view1.heightAnchor.constraint(equalToConstant: CGFloat(140))
        view1HeightConstraint?.isActive = true
        
        elseTextField.isHidden = false
        moveCommonSubview(-40)
        
        
        chooseConstraint?.isActive = false
        
        if let oldChooseConstraint =  chooseConstraint {
            removeConstraint(oldChooseConstraint)
        }
        
        chooseConstraint = skillChoiseButton.centerYAnchor.constraint(equalTo: view1.centerYAnchor, constant: -28)
        
        chooseConstraint?.isActive = true
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
    }

    
    internal func addTargetSkillToChoiceButton(target: AnyObject, action: Selector) {
        skillChoiseButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        configureSubviews()
        createSkillChoiceField()
        configureElseTextField()
        configureInDetailTextField()
        configureInDetailLabel()
        configureOnlineLabel()
    }
    
    
    
    private func createSkillChoiceField() {
        view1.addSubview(skillChoiseButton)
        
        skillChoiseButton.setTitle("  Выберите ваш навык...", for: .normal)
        skillChoiseButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        skillChoiseButton.backgroundColor = .white
        
        skillChoiseButton.translatesAutoresizingMaskIntoConstraints = false
        
        chooseConstraint = skillChoiseButton.centerYAnchor.constraint(equalTo: view1.centerYAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            skillChoiseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseConstraint!,
            skillChoiseButton.widthAnchor.constraint(equalToConstant: 330),
            skillChoiseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        skillChoiseButton.layer.cornerRadius = 10
        skillChoiseButton.setTitleColor(.gray, for: .normal)
        skillChoiseButton.layer.borderColor = UIColor.gray.cgColor
        skillChoiseButton.layer.borderWidth = 2
    }
    
    private func configureElseTextField() {
        addSubview(elseTextField)
        elseTextField.textAlignment = .center
        elseTextField.font = .systemFont(ofSize: 20)
        
        elseTextField.backgroundColor = .white
        
        let placeholderText = "Какой у вас навык?"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        elseTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        
        elseTextField.layer.borderColor = UIColor.gray.cgColor
        elseTextField.layer.borderWidth = 2
        elseTextField.layer.cornerRadius = 10
        
        elseTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            elseTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            elseTextField.centerYAnchor.constraint(equalTo: skillChoiseButton.centerYAnchor, constant: 60),
            elseTextField.widthAnchor.constraint(equalToConstant: 330),
            elseTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        elseTextField.isHidden = true
    }
    
    private func configureSubview(y: Int, height: Int, width: Int, parentView: UIView) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = lightPinkColor
        parentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: CGFloat(y)),
            view.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            view.heightAnchor.constraint(equalToConstant: CGFloat(height)),
        ])
        return view
    }
    
    private func configureOnlineSegmentedControl() {
        
    }
}
