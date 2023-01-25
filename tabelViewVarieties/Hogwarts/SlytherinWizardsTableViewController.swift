//
//  SlytherinWizardsTableViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 14.01.23.
//

import UIKit

class SlytherinWizardsTableViewController: UITableViewController {
    
    var identifier = "cell"
    var wizardsS: [Wizards] = [Wizards]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.tableView.backgroundView = UIImageView(image: UIImage(named: "слиз"))
        super.tableView.backgroundView?.alpha = 0.8
        super.tableView.backgroundView?.contentMode = .scaleAspectFill
        
        creatTable()
        
        wizardsS.append(Wizards(name: "Draco Lucius Malfoy", image: UIImage(named: "драко"), description: "Draco Lucius Malfoy (b. 5 June 1980) was a British pure-blood wizard and the only son of Lucius and Narcissa Malfoy (née Black). The son of a Death Eater, Draco was raised to strongly believe in the importance of blood purity. He looked down on half-bloods and Muggle-borns."))
        wizardsS.append(Wizards(name: "Tom Marvolo Riddle", image: UIImage(named: "лорд"), description: "Tom Marvolo Riddle (31 December 1926 – 2 May 1998), later known as Lord Voldemort or, alternatively as You-Know-Who, the Dark Lord, or He-Who-Must-Not-Be-Named was an English half-blood wizard considered to have been the most powerful and dangerous Dark wizard of all time."))
        wizardsS.append(Wizards(name: "Severus Snape", image: UIImage(named: "северус"), description: "Professor Severus Snape (9 January, 1960 – 2 May, 1998) was an English half-blood wizard serving as Potions Master (1981-1996), Head of Slytherin House (1981-1997), Defence Against the Dark Arts professor (1996-1997), and Headmaster (1997-1998) of the Hogwarts School of Witchcraft and Wizardry as well as a member of the Order of the Phoenix and a Death Eater. His double life played an extremely important role in both of the Wizarding Wars against Voldemort."))
        
    }

    // MARK: - Table view data source
    
    func creatTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .clear
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wizardsS.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let name = wizardsS[indexPath.row].name
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
        profileVC.name.text = wizardsS[indexPath.row].name
        profileVC.image.image = wizardsS[indexPath.row].image
        profileVC.personDescription.text = wizardsS[indexPath.row].description
        profileVC.myBack = UIImageView(image: UIImage(named: "слиз"))
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
