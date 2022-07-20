//
//  File.swift
//  WhatsAppClone
//
//  Created by Diego Ferreira on 19/07/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsArray: [SettingsModel] = []

    
    //MARK: - UI Components
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureTableView()
        setSettingsData()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
        
        tableView.rowHeight = 40
    }
    
    private func setSettingsData() {
        
        settingsArray.append(SettingsModel(numberOfCellsInSection: 2, cells: [SettingCells(image: "star.square", label: "Starred Massage"),
                                                                              SettingCells(image: "star.square", label: "WhatsApp Web/Desktop"),]))
        
        settingsArray.append(SettingsModel(numberOfCellsInSection: 4, cells: [SettingCells(image: "star.square", label: "Account"),
                                                                              SettingCells(image: "star.square", label: "Chats"),
                                                                              SettingCells(image: "star.square", label: "Notifications"),
                                                                              SettingCells(image: "star.square", label: "Data and Storage Usage"),]))
        
        settingsArray.append(SettingsModel(numberOfCellsInSection: 2, cells: [SettingCells(image: "star.square", label: "Help"),
                                                                              SettingCells(image: "star.square", label: "Tell a Friend"),]))
    }
}

extension SettingsViewController: UITableViewDelegate {
    // nothing yet
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        
//        cell.setupCell(image: settingsArray[indexPath.section].cells[indexPath.row].image,
//                       label: settingsArray[indexPath.section].cells[indexPath.row].label)
        
//        cell.imageName = settingsArray[indexPath.section].cells[indexPath.row].image
//        cell.labelName = settingsArray[indexPath.section].cells[indexPath.row].label
        
        return cell
    }
}
