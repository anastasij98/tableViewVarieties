//
//  ViewController.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 11.01.23.
//

import UIKit

class ViewController: UIViewController {
 
    var buttons = UIStackView()
    
    var languages = UIButton()
    var phoneBook = UIButton()
    var hogwarts = UIButton()
    var wildBerries = UIButton()
    var randomCells = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "Menu"
        let array = [languages, phoneBook, hogwarts, wildBerries, randomCells]
        view.addSubview(buttons)
        
        buttons.addArrangedSubview(languages)
        buttons.addArrangedSubview(phoneBook)
        buttons.addArrangedSubview(hogwarts)
        buttons.addArrangedSubview(wildBerries)
        buttons.addArrangedSubview(randomCells)
        
        //buttons stackView
        buttons.axis = .vertical
        buttons.alignment = .center
        buttons.distribution = .equalSpacing
        buttons.spacing = 20
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
    
        array.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 200)
            ])
        }
        
        buttons.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        //language button
        languages.setTitle("language", for: .normal)
        languages.backgroundColor = .red
        languages.translatesAutoresizingMaskIntoConstraints = false
        languages.addTarget(self, action: #selector(goToLanguageVC), for: .touchUpInside)
        
        //phone book button
        phoneBook.setTitle("phone book", for: .normal)
        phoneBook.backgroundColor = .blue
        phoneBook.addTarget(self, action: #selector(goToPhoneBookVC), for: .touchUpInside)
        
        //hogwarts button
        hogwarts.setTitle("hogwarts", for: .normal)
        hogwarts.backgroundColor = .green
        hogwarts.addTarget(self, action: #selector(goToHogwartsVC), for: .touchUpInside)
        
        //wildberries button
        wildBerries.setTitle("W", for: .normal)
        wildBerries.backgroundColor = .purple
        wildBerries.addTarget(self, action: #selector(goToWildBerriesVC), for: .touchUpInside)
        
        //randomCell button
        randomCells.setTitle("random cells", for: .normal)
        randomCells.backgroundColor = .orange
        randomCells.addTarget(self, action: #selector(goToRandomCells), for: .touchUpInside)
        
    }
    
    @objc func goToLanguageVC(_ sender: UIButton) {
        let nextVC = LanguageViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func goToPhoneBookVC(_ sender: UIButton) {
        let nextVC = PhoneBookTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
   
    @objc func goToHogwartsVC (_ sender: UIButton) {
        let nextVC = HogwartsTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func goToWildBerriesVC (_ sender: UIButton) {
        guard let transition = storyboard?.instantiateViewController(withIdentifier: "WildBerriesVC") else { return }
        navigationController?.pushViewController(transition, animated: true)
    }
    
    @objc func goToRandomCells (_ sender: UIButton) {
        let nextVC = RandomCellsViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
   
    
    

}


