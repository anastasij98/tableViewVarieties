//
//  RandomCellsViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 13.01.23.
//

import UIKit

class RandomCellsViewController: UITableViewController {

    var myTableView = UITableView()
    var first = "firstCustomCell"
    var second = "secondCustomCell"
    var third = "thirdCustomCell"
    var identifier = "cell"
    var someView = UIView()
    var labeltext = UILabel()
    
    override func viewDidLoad() {
        createTable()
        
    
    }
    
    func createTable() {
        
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.register(FirstCustomCell.self, forCellReuseIdentifier: first)
        myTableView.register(SecondCustomCell.self, forCellReuseIdentifier: second)
        myTableView.register(ThirdCustomCell.self, forCellReuseIdentifier: third)
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = .lightGray
        view.addSubview(myTableView)
    
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        
            guard let cell = myTableView.dequeueReusableCell(withIdentifier: first, for: indexPath) as? FirstCustomCell else {
                return UITableViewCell()
            }
      
            let model = FirstCustomCellModel(image: UIImage(named: "слиз"),
                                             name: "\(indexPath.row)")
            cell.setupCell(model: model)
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = myTableView.dequeueReusableCell(withIdentifier: second, for: indexPath) as! SecondCustomCell
            
            cell.customLabel.text = "\(indexPath.row)"
            cell.customLabel.backgroundColor = .yellow.withAlphaComponent(0.5)
            cell.firstCustomImage.image = UIImage(named: "грифф")
            cell.secondCustomImage.image = UIImage(named: "ког")
//            cell.customButton.layer.cornerRadius = 10
//            cell.customButton.layer.cornerCurve = .circular
    
            return cell
            
        } else {
            let cell = myTableView.dequeueReusableCell(withIdentifier: second, for: indexPath) as! SecondCustomCell
            
            cell.customLabel.text = "\(indexPath.row)"
            cell.customLabel.backgroundColor = .blue.withAlphaComponent(0.5)
            
            return cell
        }
        
//        cell.contentView.addSubview(labeltext)
//
//        labeltext.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            labeltext.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
//            labeltext.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10),
//            labeltext.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
//            labeltext.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10)
//        ])
//
//        labeltext.backgroundColor = .green
        
//        cell.contentView.layer.borderWidth = 5
//        cell.contentView.layer.borderColor = .init(red: 100, green: 100, blue: 100, alpha: 1)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
}

