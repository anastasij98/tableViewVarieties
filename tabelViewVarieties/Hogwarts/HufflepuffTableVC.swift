//
//  HufflepuffTableVC.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 14.01.23.
//

import UIKit

class HufflepuffTableVC: UITableViewController {
    var myTableView = UITableView()
    var identifier = "cell"
    var wizardsH: [Wizards] = [Wizards]()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.tableView.backgroundView = UIImageView(image: UIImage(named: "пуфф"))
        super.tableView.backgroundView?.alpha = 0.5
        super.tableView.backgroundView?.contentMode = .scaleAspectFill
        createTable()
        
        wizardsH.append(Wizards(name: "Cedric Diggory", image: UIImage(named: "седрик"), description: "Cedric Diggory (September/October 1977–24 June 1995) was a British wizard who was the son of Amos Diggory and his unnamed wife. He started attending Hogwarts School of Witchcraft and Wizardry in 1989, and was sorted into the Hufflepuff House. During his time at school, he was a prefect and captained the Hufflepuff Quidditch team, playing as Seeker. In his sixth year Cedric put his name forward to compete in the Triwizard Tournament."))
        wizardsH.append(Wizards(name: "Newt Scamander", image: UIImage(named: "ньют"), description: "Newton Artemis Fido Scamander, O.M. (Second Class), (b. 24 February[1] 1897) was an English wizard, famed Magizoologist and the author of Fantastic Beasts and Where to Find Them. Early in life, Scamander developed an interest in magical creatures, influenced by his mother's breeding of Hippogriffs."))
    }

    // MARK: - Table view data source
    
    func createTable() {
        view.addSubview(myTableView)
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myTableView.backgroundColor = .clear
//        myTableView.backgroundView = UIImageView(image: UIImage(named: "пуфф"))
//        myTableView.backgroundView?.alpha = 0.5
//        tableView.backgroundView?.contentMode = .scaleAspectFill
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wizardsH.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = wizardsH[indexPath.row].name
        cell.contentConfiguration = content
        cell.backgroundColor = .white.withAlphaComponent(0.5)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
        profileVC.name.text = wizardsH[indexPath.row].name
        profileVC.image.image = wizardsH[indexPath.row].image
        profileVC.personDescription.text = wizardsH[indexPath.row].description
        profileVC.myBack = UIImageView(image: UIImage(named: "пуфф"))
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
