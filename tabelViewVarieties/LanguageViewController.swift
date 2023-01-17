//
//  LanguageViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 11.01.23.
//

import UIKit

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myTableView = UITableView()
    var identifier = "MyCell"
    var array = ["Swift","Java","Phyton","C++","JavaScript","Ruby","PHP"]
    var imageArray = [UIImage(named: "swift"), UIImage(named: "java"), UIImage(named: "phyton"), UIImage(named: "c++"), UIImage(named: "js"), UIImage(named: "ruby"), UIImage(named: "php")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatTable()
        navigationItem.title = "Programming languages"
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editing))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func creatTable(){
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(myTableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let language = array[indexPath.row]
        let image = imageArray[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(language)"
        content.secondaryText = "some text there"
        content.image = image

        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    //edit
    @objc func editing () {
        myTableView.isEditing = !myTableView.isEditing
    }
    
    //delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            array.remove(at: indexPath.row )
            myTableView.deleteRows(at: [indexPath], with: .left)
        }
    }

    //remove
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let cell = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(cell, at: sourceIndexPath.row)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
