//
//  ChooseSkillDelegate.swift
//  skillama
//
//  Created by Даша Николаева on 01.09.2024.
//

import Foundation

protocol ChooseSkillDelegate: AnyObject {
    func didSelectSkill(_ skill: String)
}
