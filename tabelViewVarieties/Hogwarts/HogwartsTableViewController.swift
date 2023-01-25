//
//  HogwartsTableViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 11.01.23.
//

import UIKit

class HogwartsTableViewController: UITableViewController {
    
    
    var identifier = "cell"
    var hH = [("Gryffindor","Minerva McGonagall", UIImage(named: "гриффиндор")),
              ("Slytherin","Severus Snape", UIImage(named: "слизерин")),
              ("Ravenclaw", "Filius Flitwick", UIImage(named: "когтевран")),
              ("Hufflepuff","Pomona Sprout", UIImage(named: "пуффендуй"))
    ]
    var vC = [WizardsViewController.self, SlytherinWizardsTableViewController.self,  RavenclawTableVC.self, HufflepuffTableVC.self]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Houses"
        super.tableView.backgroundView = UIImageView(image: UIImage(named: "фон"))
        super.tableView.backgroundView?.alpha = 0.8
        super.tableView.backgroundView?.contentMode = .scaleAspectFill
        creatTable()
       
    }

    
    func creatTable() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .clear
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hH.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let name = hH[indexPath.row].0
        let subTitle = hH[indexPath.row].1
        let icon = hH[indexPath.row].2
        
        var content = cell.defaultContentConfiguration()
        content.text = name
        content.image = icon
        content.secondaryText = "headteacher: \(subTitle)"
        cell.contentConfiguration = content
        cell.backgroundColor = .white.withAlphaComponent(0.3)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = vC[indexPath.row].init()
        navigationController?.pushViewController(cell, animated: true)
    }
    

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
