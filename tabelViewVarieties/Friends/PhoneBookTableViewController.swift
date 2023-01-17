//
//  PhoneBookTableViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 11.01.23.
//

import UIKit

class PhoneBookTableViewController: UITableViewController {
    
    var myTableView = UITableView()
    var identifier = "MyCell"
    var friendsArray : [Friends] = [Friends]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        creatTable()
        friendsArray.append(Friends(name: "Rachel Green", image: UIImage(named: "rachel"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Monica Geller", image: UIImage(named: "monica"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Phoebe Buffay", image: UIImage(named: "phoebe"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Joey Tribbiani", image: UIImage(named: "joey"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Chandler Bing", image: UIImage(named: "chandler"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Ross Geller", image: UIImage(named: "ross"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Janice", image: UIImage(named: "janice"), age: getRandomNumber()))
        friendsArray.append(Friends(name: "Carol", image: UIImage(named: "Carol"), age: getRandomNumber()))
    }
    //create Tble
    func creatTable(){
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(myTableView)
    }
    
    func getRandomNumber() -> Int {
        let numbers = "0123456789"
        var random = ""
        for _ in 0 ... 9 {
            random.append(numbers.randomElement()!)
        }
        guard let phone = Int(random) else { return 0 }
        
        return phone
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
       let name = friendsArray[indexPath.row].name
       let icon = friendsArray[indexPath.row].image
       let age = friendsArray[indexPath.row].age
       var contact = cell.defaultContentConfiguration()
       
       contact.text = "\(name)"
       contact.image = icon
       contact.secondaryText = "\(age)"
       contact.imageProperties.cornerRadius = 20
       
       cell.contentConfiguration = contact
       
       return  cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionTitle.count
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionTitle[section]
//    }
    
}
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
