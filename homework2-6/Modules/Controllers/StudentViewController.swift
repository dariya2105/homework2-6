//
//  ViewController.swift
//  homework2-6
//
//  Created by Dariya on 13/1/24.
//

import UIKit

class StudentViewController: UIViewController {
    
    private let parser = JsonParser()
    
    private var students: [Student] = []
    
    private let collectionView: UICollectionView = {
        let view = UICollectionViewFlowLayout()
        view.scrollDirection = .vertical
        view.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: view)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemGray4
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
        getUsers()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func getUsers() {
        parser.getStudent { [weak self] student in
            guard let self else { return }
            self.students = student
        }
    }
}

extension StudentViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let item = students[indexPath.item]
        cell.fill(item)
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 180)
    }
}

