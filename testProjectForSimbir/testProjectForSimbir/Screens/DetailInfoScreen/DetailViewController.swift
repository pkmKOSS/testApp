//
//  DetailInformationsViewController.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 04.02.2022.
//

import UIKit

class DetailInformationsViewController: UIViewController {
    // MARK: - External vars
    var router: CalendarRoutingLogic?
    let nameLabel = UILabel()
    let dateAndTimeLabel = UILabel()
    let descriptionLabel = UILabel()
    
    // MARK: - Privates vars and lets
    private let viewForDate = UILabel()
    private let viewForDescription = UILabel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    // MARK: - Config views
    private func configViews(){
        
        view.addSubview(viewForDate)
        view.addSubview(viewForDescription)
        viewForDate.addSubview(dateAndTimeLabel)
        viewForDate.addSubview(nameLabel)
        viewForDescription.addSubview(descriptionLabel)

        viewForDescription.translatesAutoresizingMaskIntoConstraints = false
        viewForDate.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        viewForDate.backgroundColor = .white
        viewForDate.layer.cornerRadius = 5
        viewForDate.clipsToBounds = true
        viewForDate.shadowColor = .red
        
        viewForDescription.backgroundColor = .white
        viewForDescription.layer.cornerRadius = 5
        viewForDescription.clipsToBounds = true

        nameLabel.numberOfLines = 0
        nameLabel.backgroundColor = .white
        nameLabel.layer.cornerRadius = 5
        
        dateAndTimeLabel.numberOfLines = 0
        dateAndTimeLabel.backgroundColor = .white
        dateAndTimeLabel.layer.cornerRadius = 5

        descriptionLabel.numberOfLines = 0
        descriptionLabel.backgroundColor = .white
        descriptionLabel.sizeToFit()
        descriptionLabel.layer.cornerRadius = 5
        descriptionLabel.textAlignment = .natural
        
        NSLayoutConstraint.activate([
            viewForDate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +5),
            viewForDate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(view.bounds.height/17)),
            viewForDate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            viewForDate.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/10)),
            
            nameLabel.leadingAnchor.constraint(equalTo: viewForDate.leadingAnchor, constant: +10),
            nameLabel.centerYAnchor.constraint(equalTo: viewForDate.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: CGFloat(view.bounds.width/2.5)),
            
            dateAndTimeLabel.centerYAnchor.constraint(equalTo: viewForDate.centerYAnchor),
            dateAndTimeLabel.trailingAnchor.constraint(equalTo: viewForDate.trailingAnchor, constant: -10),
            
            viewForDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +5),
            viewForDescription.topAnchor.constraint(equalTo: viewForDate.bottomAnchor, constant: +15),
            viewForDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            viewForDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -CGFloat(view.bounds.height/15)),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: viewForDescription.leadingAnchor, constant: +10),
            descriptionLabel.topAnchor.constraint(equalTo: viewForDescription.topAnchor, constant: +10),
            descriptionLabel.trailingAnchor.constraint(equalTo: viewForDescription.trailingAnchor, constant: -10),
        ])
    }
}
