////
////  ViewController.swift
////  snacks
////
////  Created by Esperanza on 2022-01-26.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    //set up view : tableView / UIView / UIImageView
//
//    let tableView : UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return tableView
//
//    }()
//
//    let navBar: UIView = {
//        let navBar = UIView()
//        navBar.translatesAutoresizingMaskIntoConstraints = false
//        navBar.backgroundColor = UIColor.lightGray
//        return navBar
//    }()
//
//    let navBarTitle: UILabel = {
//        let navBarTitle = UILabel()
//        navBarTitle.translatesAutoresizingMaskIntoConstraints = false
//        navBarTitle.text = "SNACKS"
//        navBarTitle.textColor = .black
//        navBarTitle.font = UIFont.boldSystemFont(ofSize: 30)
//        return navBarTitle
//    }()
//
//
//    let plusButton: UIButton = {
//      let plusButton = UIButton(type: .system)
//      plusButton.setTitle("✚", for: .normal)
//      plusButton.translatesAutoresizingMaskIntoConstraints = false
//      plusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//      plusButton.addTarget(self, action: #selector(plusIconPressed), for: .touchUpInside)
//      return plusButton
//    }()
//
//    let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    let oreos : UIImageView = {
//        let oreos = UIImageView()
//        oreos.image = UIImage(named: "oreos.png")
//        oreos.isUserInteractionEnabled = true
//        oreos.translatesAutoresizingMaskIntoConstraints = false
//        return oreos
//      }()
//
//    let pizza_pockets : UIImageView = {
//        let pizza_pockets = UIImageView()
//        pizza_pockets.image = UIImage(named: "pizza_pockets.png")
//        pizza_pockets.isUserInteractionEnabled = true
//        pizza_pockets.translatesAutoresizingMaskIntoConstraints = false
//        return pizza_pockets
//      }()
//
//    let pop_tarts : UIImageView = {
//        let pop_tarts = UIImageView()
//        pop_tarts.image = UIImage(named: "pop_tarts.png")
//        pop_tarts.isUserInteractionEnabled = true
//        pop_tarts.translatesAutoresizingMaskIntoConstraints = false
//        return pop_tarts
//      }()
//
//    let popsicle : UIImageView = {
//        let popsicle = UIImageView()
//        popsicle.image = UIImage(named: "popsicle.png")
//        popsicle.isUserInteractionEnabled = true
//        popsicle.translatesAutoresizingMaskIntoConstraints = false
//        return popsicle
//      }()
//
//    let ramen : UIImageView = {
//        let ramen = UIImageView()
//        ramen.image = UIImage(named: "ramen.png")
//        ramen.isUserInteractionEnabled = true
//        ramen.translatesAutoresizingMaskIntoConstraints = false
//        return ramen
//      }()
//
//
//    let snacksTitle: [String] = ["oreos", "pizza_pocketes", "pop_tarts", "popsicle", "ramen"]
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        subviews()
//        constraints()
//        self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 88)
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        oreos.addGestureRecognizer(tapGestureRecognizer)
//        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        pizza_pockets.addGestureRecognizer(tapGestureRecognizer2)
//        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        pop_tarts.addGestureRecognizer(tapGestureRecognizer3)
//        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        popsicle.addGestureRecognizer(tapGestureRecognizer4)
//        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        ramen.addGestureRecognizer(tapGestureRecognizer5)
//
//
//
//    }
//
//    @objc func plusIconPressed(_ sender:UIButton!) {
//
//        print(#function)
//        print(self.navBar.bounds.height)
//        if self.navBar.bounds.height == 200 {
//        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .beginFromCurrentState) {
//    //      self.navBar.heightAnchor.constraint(equalToConstant: 200)
//          self.navBar.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 88)
//          self.navBar.layoutIfNeeded()
//          let rotateTransform = CGAffineTransform(rotationAngle: .pi / 2)
//          self.plusButton.transform = rotateTransform
//          self.stackView.isHidden = false
//        } completion: { _ in
//          UIView.animate(withDuration: 1) {
//            self.plusButton.transform = .identity
//          }
//
//        }
//        } else {
//        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .beginFromCurrentState) {
//    //      self.navBar.heightAnchor.constraint(equalToConstant: 200)
//          self.navBar.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
//          self.navBar.layoutIfNeeded()
//          let rotateTransform = CGAffineTransform(rotationAngle: 0)
//          self.plusButton.transform = rotateTransform
//          self.stackView.isHidden = false
//        } completion: { _ in
//          UIView.animate(withDuration: 1) {
//            self.plusButton.transform = .identity
//          }
//        }
//    }
//        }
//
//
//
////    @objc func plusIconPressed(_ sender:UIButton!) {
////        Swift.print("button is pressed")
////        print(#function)
////
////        if navBar. {
////
////        }
////
////
////        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: .beginFromCurrentState) {
//////            self.navBar.heightAnchor.constraint(equalToConstant: 200)
////            self.navBar.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
////            self.navBar.layoutIfNeeded()
////            let rotateTransform = CGAffineTransform(rotationAngle: .pi / 2)
////            self.plusButton.transform = rotateTransform
////            self.stackView.isHidden = false
////        } completion: { _ in
////            UIView.animate(withDuration: 1) {
////                self.plusButton.transform = .identity
////
////
////            }
////        }
////}
//    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//
//        print("press!")
//}
//}
//
////extension
//
//extension ViewController {
//    func subviews() {
//        self.view.addSubview(navBar)
//        navBar.addSubview(navBarTitle)
//        navBar.addSubview(plusButton)
//
//        stackView.addArrangedSubview(oreos)
//        stackView.addArrangedSubview(pizza_pockets)
//        stackView.addArrangedSubview(pop_tarts)
//        stackView.addArrangedSubview(popsicle)
//        stackView.addArrangedSubview(ramen)
//        stackView.isHidden = true
//        self.view.addSubview(stackView)
//        self.view.addSubview(tableView)
//
//    }
//
//    func constraints() {
//
////        let navBarTop = navBar.topAnchor.constraint(equalTo: view.topAnchor)
////        let navBarLeft = navBar.topAnchor.constraint(equalTo: view.topAnchor)
////        let navBarRight = navBar.rightAnchor.constraint(equalTo: view.rightAnchor)
////
////        NSLayoutConstraint.activate([navBarTop,navBarLeft,navBarRight,navBarHeight])
////
//        NSLayoutConstraint.activate([
//            navBar.topAnchor.constraint(equalTo: view.topAnchor),
//            navBar.leftAnchor.constraint(equalTo: view.leftAnchor),
//            navBar.rightAnchor.constraint(equalTo: view.rightAnchor)
//////            navBar.heightAnchor.constraint(equalToConstant: 88),
//        ]);
//
//        NSLayoutConstraint.activate([
//            navBarTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            navBarTitle.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
//            navBarTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            navBarTitle.widthAnchor.constraint(equalToConstant: 30)
//        ]);
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ]);
//        NSLayoutConstraint.activate([
//            plusButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 22),
//            plusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
//            plusButton.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: -8)
//        ]);
//        NSLayoutConstraint.activate([
//            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            stackView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor),
//            stackView.bottomAnchor.constraint(equalTo: self.tableView.topAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 112)
//        ])
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//      return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        return cell
//    }
//
//
//
//
//}
