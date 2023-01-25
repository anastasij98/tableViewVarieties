//
//  ProfileVC.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 14.01.23.
//

import UIKit

class ProfileVC: UIViewController {
    
    var name: UILabel = UILabel()
    var image: UIImageView = UIImageView()
    var personDescription: UILabel = UILabel()
    var stack: UIStackView = UIStackView()
    var myBack: UIImageView = UIImageView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        view.addSubview(myBack)
        view.addSubview(stack)

        
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(personDescription)
    
        personDescription.numberOfLines = 20
        
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.backgroundColor = .white.withAlphaComponent(0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        
        //wallpaper
        myBack.translatesAutoresizingMaskIntoConstraints = false
        myBack.alpha = 0.5
        myBack.contentMode = .redraw
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            image.widthAnchor.constraint(equalToConstant: 250),
            image.heightAnchor.constraint(equalToConstant: 250),
            
            myBack.topAnchor.constraint(equalTo: view.topAnchor),
            myBack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myBack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myBack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

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
