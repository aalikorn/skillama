//
//  CooseSkillViewController.swift
//  skillama
//
//  Created by Даша Николаева on 01.09.2024.
//

import UIKit

class ChooseSkillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    var selectedSkill: String? = nil
    var selectedIndexPath: IndexPath? = nil
    
    weak var delegate: ChooseSkillDelegate? 
    
    
    let popularHobbies = [
            "Другое",
            "Фотография",
            "Рисование",
            "Кулинария",
            "Плавание",
            "Йога",
            "Садоводство",
            "Вышивание",
            "Фитнес",
            "Писательство",
            "Шитье",
            "Велоспорт",
            "Игра на музыкальных инструментах",
        ]
        
   
    var filteredItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredItems = popularHobbies
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchController.automaticallyShowsCancelButton = false
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredItems[indexPath.row]
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else {
            filteredItems = popularHobbies
            tableView.reloadData()
            return
        }
        
        if searchController.searchBar.text == "" {
            filteredItems = popularHobbies
            tableView.reloadData()
            return
        }
        
        filteredItems = popularHobbies.filter { item in
            return item.lowercased().contains(searchText)
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.resignFirstResponder()
        selectedSkill = filteredItems[indexPath.row]
        selectedIndexPath = indexPath
        delegate?.didSelectSkill(selectedSkill!)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            if let indexPath = selectedIndexPath {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
}



