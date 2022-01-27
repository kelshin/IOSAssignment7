//
//  ViewController.swift
//  NavbarAnimation
//
//  Created by Kelbin David on 2022-01-25.
//

import UIKit

class ViewController: UIViewController {

    let navBar = UIView()
    let addButton: UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 30)
        return addButton
    }()
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    var snackTitleLabel : UILabel = {
        var snackTitleLabel = UILabel()
        snackTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        snackTitleLabel.text = "Snacks"
        snackTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        return snackTitleLabel
    }()
    let tableView = UITableView()
    var snacksList = [""]
    
    var navBarDropped: Bool = false {
        didSet {
            navBarToggle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(navBarDropped)
        let oreos = UIImageView(image: UIImage(named: "oreos.png"))
        oreos.restorationIdentifier = "Oreos"
        let pizza_pocket = UIImageView(image: UIImage(named: "pizza_pockets.png"))
        pizza_pocket.restorationIdentifier = "Pizza Pockets"
        let pop_tarts = UIImageView(image: UIImage(named: "pop_tarts.png"))
        pop_tarts.restorationIdentifier = "Pop Tarts"
        let popsicle = UIImageView(image: UIImage(named: "popsicle.png"))
        popsicle.restorationIdentifier = "Popsicle"
        let ramen = UIImageView(image: UIImage(named: "ramen.png"))
        ramen.restorationIdentifier = "Ramen"
        
        tableView.delegate = self
        tableView.dataSource = self
       
        
        navBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 88)
        navBar.backgroundColor = .gray
    
        stackView.addArrangedSubview(oreos)
        stackView.addArrangedSubview(pizza_pocket)
        stackView.addArrangedSubview(pop_tarts)
        stackView.addArrangedSubview(popsicle)
        stackView.addArrangedSubview(ramen)
        
        navBar.addSubview(stackView)
        navBar.addSubview(snackTitleLabel)
        view.addSubview(navBar)
        view.addSubview(addButton)
        tableViewSetup()
        NSlayout()

        addButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        let images = [oreos,pizza_pocket,pop_tarts,popsicle,ramen]
        for image in images {
            image.isUserInteractionEnabled = true
            let tapping = CustomTapGesture(target:self, action: #selector(self.snackTapped(sender:)))
            image.addGestureRecognizer(tapping)
            tapping.snack = image.restorationIdentifier!
        }
    }
    
    func tableViewSetup(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func plusTapped(){
        navBarDropped.toggle()
    }
    
    @objc func snackTapped(sender : CustomTapGesture) {
        snacksList.insert(sender.snack,at: 0)
        tableView.reloadData()
    }
    
    func navBarToggle() {
        switch navBarDropped {
        case true:
            print(navBarDropped)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .beginFromCurrentState, animations: {
                self.navBar.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
                self.addButton.transform = CGAffineTransform(rotationAngle: .pi/4)
                self.snackTitleLabel.text = "Add a Snack"
                self.stackView.isHidden = false
                self.view.layoutIfNeeded()
            }, completion:  {_ in
                
            })
        case false:
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .beginFromCurrentState, animations: {
                self.navBar.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 88)
                self.addButton.transform = CGAffineTransform(rotationAngle: 0)
                self.snackTitleLabel.text = "Snacks"
                self.stackView.isHidden = true
                self.view.layoutIfNeeded()
            }, completion:  {_ in
                
            })
        }
    }
    
    func NSlayout(){
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            addButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            snackTitleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            snackTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackView.widthAnchor.constraint(equalToConstant: self.navBar.frame.width - 20),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 0),
            stackView.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            
        ])
    }
}


class CustomTapGesture: UITapGestureRecognizer {
    var snack = String()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacksList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = snacksList[indexPath.row]
        return cell
    }
}
