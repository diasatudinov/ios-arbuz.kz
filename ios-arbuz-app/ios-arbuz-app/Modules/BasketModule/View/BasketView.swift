//
//  BasketView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 16.05.2024.
//

import UIKit
import Combine

class BasketView: UIViewController {

    var basketManager: BasketManager!

    
    let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            BasketViewCell.self,
            forCellWithReuseIdentifier: "BasketViewCell"
        )
        return collectionView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.8)
        button.setTitle("Перейти к оплате", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        basketManager.delegate = self
        setupViews()
        basketManager.$items.sink { [weak self] _ in
            self?.collectionView.reloadData()
        }.store(in: &cancellables)
        
    }
    
    @objc private func buttonTapped() {
        print("basketManager.summa", basketManager.summa)
        
       // basketManager.clearCart()
    }
    
    private func setupViews() {
        if self.basketManager.summa == 0{
            self.button.setTitle("Перейти к оплате", for: .normal)
        } else {
            self.button.setTitle("Перейти к оплате \(self.basketManager.summa)", for: .normal)
        }
        view.addSubview(collectionView)
        collectionView.addSubview(button)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

}

extension BasketView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        basketManager.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasketViewCell", for: indexPath) as! BasketViewCell
        
        let item = basketManager.items[indexPath.row]
        cell.setupHostingController(item: item, basketManager: basketManager)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 85)
    }
    
    
}

extension BasketView: BasketDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            if self.basketManager.summa == 0{
                self.button.setTitle("Перейти к оплате", for: .normal)
            } else {
                self.button.setTitle("Перейти к оплате \(self.basketManager.summa)", for: .normal)
            }
            print("AAAA")
            self.collectionView.reloadData()
        }
        
    }
    
}
