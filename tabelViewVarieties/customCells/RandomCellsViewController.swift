//
//  RandomCellsViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 13.01.23.
//

import UIKit

protocol CustomCellDelegate: AnyObject{
    func onCellButtonTouched()
}

class RandomCellsViewController: UITableViewController, CustomCellDelegate {
    
    func onCellButtonTouched() {
        let nextVC = WildBerriesTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
    var first = "firstCustomCell"
    var second = "secondCustomCell"
    var third = "thirdCustomCell"
    var imageCell = "imageCell"
    var lastCell = "lastCell"
    var imgCell = "imgCell"
    var identifier = "cell"
    var someView = UIView()
    var labeltext = UILabel()
    
    var longGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        
        createTable()
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        longGesture.minimumPressDuration = 1
        self.tableView.addGestureRecognizer(longGesture)
        
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer){
        let alertC = UIAlertController(title: "Long Press", message: "You pressed on a cell for 1 second", preferredStyle: .alert)
        let ok  = UIAlertAction(title: "Ok", style: .default)
        alertC.addAction(ok)
        self.present(alertC, animated: true, completion: nil)
     
    }
    
    
    func createTable() {
    
        tableView.register(FirstCustomCell.self, forCellReuseIdentifier: first)
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: second)
        tableView.register(ThirdCustomCell.self, forCellReuseIdentifier: third)
        tableView.register(ImageCustomCell.self, forCellReuseIdentifier: imageCell)
        tableView.register(LastCustomCell.self, forCellReuseIdentifier: lastCell)
        tableView.register(ImageCell.self, forCellReuseIdentifier: imgCell)
        tableView.backgroundColor = .lightGray
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: first, for: indexPath) as? FirstCustomCell else {
                return UITableViewCell()
            }

            let model = FirstCustomCellModel(image: UIImage(named: "слиз"),
                                             name: "this is the \((indexPath.row) + 1) cell in tabelView")
            cell.setupCell(model: model)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: second, for: indexPath) as! SecondCustomCell
            let model = SecondCustomCellModel(firatsImage: UIImage(named: "грифф"),
                                                          secondImage: UIImage(named: "ког"),
                                                          label: "\(indexPath.row)")
            cell.setupCell(model: model)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: third, for: indexPath) as! ThirdCustomCell
            let model = ThirdCustomCellModel(customLabelStr: "Cell № \((indexPath.row) + 1)")
           
            cell.setupCell(model: model)
            cell.delegate = self
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: imageCell, for: indexPath) as! ImageCustomCell
            let model = ImageCustomCellModel(backgroundImageModel: UIImage(named: "ког"))
           
            cell.setupCell(model: model)
            return cell

        case 4:
           
            let cell = tableView.dequeueReusableCell(withIdentifier: lastCell, for: indexPath) as! LastCustomCell
            let model = LastCustomCellModel(productImage: UIImage(named: "coke"), productName: "coca cola")
           
            cell.setupCell(model: model)
            return cell
        
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: imgCell, for: indexPath) as! ImageCell
            return cell
           
        default:
            return UITableViewCell()
        }
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //buttons in swipe
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            print("edit tapped")
            
        }
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            print("delete tapped")
        }
            
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipeConfiguration
    }
    
        override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let add = UIContextualAction(style: .normal, title: "Add") { _, _, _ in
            print("Add tapped")
        }
        add.backgroundColor = .systemGreen
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [add])
        return swipeConfiguration
    }
   
}


