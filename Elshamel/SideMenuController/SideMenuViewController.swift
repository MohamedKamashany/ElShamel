//
//  SideMenuViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 22/01/2023.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}



class SideMenuViewController: UIViewController {
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var sideMenuTableView: UITableView!
    
    var delegate: SideMenuViewControllerDelegate?
    var defaultHighlightedCell: Int = 0
    
    var menu: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(named: "pyament")!, title: "وسائل الدفع"),
        SideMenuModel(icon: UIImage(named: "svgexport-7")!, title: "الاشتراكات"),
        SideMenuModel(icon: UIImage(named: "Rate the app")!, title: "قيم التطبيق"),
        SideMenuModel(icon: UIImage(named: "sent")!, title: "شارك التطبيق"),
        SideMenuModel(icon: UIImage(named: "Property rights")!, title: "حقوق الملكيه"),
        SideMenuModel(icon: UIImage(named: "Connect with us")!, title: "تواصل معنا"),
        SideMenuModel(icon: UIImage(named: "Exit (1)")!, title: "خروج")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
//        self.sideMenuTableView.backgroundColor = #colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha:/1)
        self.sideMenuTableView.backgroundColor = .clear
        self.sideMenuTableView.separatorStyle = .none
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
//         Register TableView Cell
        self.sideMenuTableView.register(SideMenuTableViewCell.nib, forCellReuseIdentifier: SideMenuTableViewCell.identifier)
        
        // Update TableView with the data
        self.sideMenuTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as? SideMenuTableViewCell else { fatalError("xib doesn't exist") }
        
        cell.iconImageView.image = self.menu[indexPath.row].icon
        cell.titleLabel.text = self.menu[indexPath.row].title
        
        // Highlighted color
        let myCustomSelectionColorView = UIView()
//        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)
        myCustomSelectionColorView.backgroundColor = .clear
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        // ...
        // Remove highlighted color when you press the 'Profile' and 'Like us on facebook' cell
        if indexPath.row == 4 || indexPath.row == 6 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
