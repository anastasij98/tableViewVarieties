//
//  RavenclawTableVC.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 14.01.23.
//

import UIKit

class RavenclawTableVC: UITableViewController {

    var identifier = "cell"
    var wizardsR: [Wizards] = [Wizards]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.tableView.backgroundView = UIImageView(image: UIImage(named: "ког"))
        super.tableView.backgroundView?.alpha = 0.8
        super.tableView.backgroundView?.contentMode = .scaleAspectFill
        
        createTable()
        
        wizardsR.append(Wizards(name: "Luna Lovegood", image: UIImage(named: "полумна"), description: "Professor Luna Scamander (née Lovegood) (b. 13 February 1981)[1] was a witch and the only child and daughter of Xenophilius and Pandora Lovegood. Her mother accidentally died while experimenting with spells when Luna was nine and thus Luna was raised by her father, editor of the magazine The Quibbler, in a rook-like house near the village of Ottery St Catchpole in Devon."))
        wizardsR.append(Wizards(name: "Sybill Patricia Trelawney", image: UIImage(named: "трелони"), description: "Professor Sybill Patricia Trelawney (b. 9 March,pre 1962)  was a half-blood[1] witch and professor of Divination at Hogwarts School of Witchcraft and Wizardry.She is the great-great-granddaughter of the celebrated Cassandra Trelawney, who was also a Seer."))
    
    }

    // MARK: - Table view data source
    func createTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.backgroundColor = .clear
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wizardsR.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        var custom = cell.defaultContentConfiguration()
        custom.text = wizardsR[indexPath.row].name
        cell.contentConfiguration = custom
        cell.backgroundColor = .white.withAlphaComponent(0.5)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
        profileVC.name.text = wizardsR[indexPath.row].name
        profileVC.image.image = wizardsR[indexPath.row].image
        profileVC.personDescription.text = wizardsR[indexPath.row].description
        profileVC.myBack = UIImageView(image: UIImage(named: "ког"))
        
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
