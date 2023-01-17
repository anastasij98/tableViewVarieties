//
//  WizardsViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 14.01.23.
//

import UIKit

class WizardsViewController: UITableViewController {

    var myTableView = UITableView()
    var identifier = "cell"
    var wizards: [Wizards] = [Wizards]()

//    var wizardsR: [Wizards] = [Wizards]()
//    var wixardsH: [Wizards] = [Wizards]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.tableView.backgroundView = UIImageView(image: UIImage(named: "грифф"))
        super.tableView.backgroundView?.alpha = 0.5
        super.tableView.backgroundView?.contentMode = .scaleAspectFill
        
        creatTable()
        
        wizards.append(Wizards(name: "Harry Potter", image: UIImage(named: "гарри"), description: "Harry James Potter (born July 31, 1980) is the titular protagonist of the series of books and films of the same name."))
        wizards.append(Wizards(name: "Ron", image: UIImage(named: "рон"), description: "Ronald Bilius Weasley (born March 1, 1980) is a pure-blood wizard and the deuteragonist of the Harry Potter franchise."))
        wizards.append(Wizards(name: "Hermion", image: UIImage(named: "гермиона"), description: "Hermione Jean Granger (born September 19, 1979) is the daughter of Muggles Mr. and Mrs. Granger who were both dentists in the Muggle London, and the tritagonist of the Harry Potter franchise."))
    }

    // MARK: - Table view data source

    func creatTable(){
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myTableView.backgroundColor = .clear
        
        view.addSubview(myTableView)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wizards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let name = wizards[indexPath.row].name
        var customCell = cell.defaultContentConfiguration()
        customCell.text = name
        cell.contentConfiguration = customCell
        cell.backgroundColor = .white.withAlphaComponent(0.5)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
        profileVC.name.text = wizards[indexPath.row].name
        profileVC.image.image = wizards[indexPath.row].image
        profileVC.personDescription.text = wizards[indexPath.row].description
        profileVC.myBack = UIImageView(image: UIImage(named: "грифф"))

    }
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

}
