//
//  ViewController.swift
//  DelegateAndProtocol
//
//  Created by Oğuzcan Beşerikli on 28.08.2024.
//

import UIKit

class ViewController: UIViewController, ProductSelectionDelegate {
    
    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let choseProductButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func didSelectProductName(name: String, imageName: String) {
        productImageView.image = UIImage(named: imageName)
        productNameLabel.text = name
    }
    
    @objc func presentProductSelectionVC() {
        let destVC = ProductSelectionVC()
        destVC.delegate = self
        
        destVC.modalPresentationStyle = .pageSheet
        destVC.sheetPresentationController?.detents = [.medium()]
        destVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destVC, animated: true)
    }
    
    func setupUI() {
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(choseProductButton)
        
        view.backgroundColor = .systemBackground
        productImageView.image = UIImage(named: "all-products")
        
        productNameLabel.text = "Apple Product Line"
        productNameLabel.textAlignment = .center
        productNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        productNameLabel.textColor = .darkGray
        
        choseProductButton.configuration = .tinted()
        choseProductButton.configuration?.title = "Choose Product"
        choseProductButton.configuration?.image = UIImage(systemName: "apple.logo")
        choseProductButton.configuration?.imagePadding = 8
        choseProductButton.addTarget(self, action: #selector(presentProductSelectionVC), for: .touchUpInside)
        
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        choseProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 225),
            productImageView.widthAnchor.constraint(equalToConstant: 300),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 15),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            choseProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choseProductButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            choseProductButton.heightAnchor.constraint(equalToConstant: 50),
            choseProductButton.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
}

