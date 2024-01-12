//
//  CollectionViewCell.swift
//  homework2-6
//
//  Created by Dariya on 13/1/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let studentName: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let studentSurname: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let studentImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        contentView.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        contentView.addSubview(studentName)
        contentView.addSubview(studentSurname)
        contentView.addSubview(studentImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            studentName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            studentName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            studentSurname.topAnchor.constraint(equalTo: studentName.bottomAnchor, constant: 10),
            studentSurname.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            studentImageView.topAnchor.constraint(equalTo: studentSurname.bottomAnchor, constant: 10),
            studentImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            studentImageView.heightAnchor.constraint(equalToConstant: 100),
            studentImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func fill(_ item: Student) {
        studentName.text = item.studentName
        studentSurname.text = item.studentSurname
        studentImageView.image = UIImage(systemName: item.studentImageView)
    }
    
    required init?(coder Decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
