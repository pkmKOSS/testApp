//
//  TaskCellTableViewCell.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 06.02.2022.
//

import UIKit

class TaskCellTableViewCell: UITableViewCell {
    
    // MARK: - External lets and vars
    
    let timeLabel = UILabel()
    let descriptionLabel = UILabel()
    let dateFormatter = DateFormatter()
    let tapRecognaizer = UITapGestureRecognizer()
    let addTuskButton = UIButton()
    var didTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configViews()
        contentView.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Config views
    
    private func configViews(){
        contentView.addSubview(timeLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(addTuskButton)
        contentView.addGestureRecognizer(tapRecognaizer)
        
        tapRecognaizer.addTarget(self, action: #selector(tapFunc))
        
        timeLabel.text = "timeLabel"
        descriptionLabel.text = "Description Label"
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .left
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .right
        
        let addTuskButtoImage = UIImage(named: "plus-3")
        addTuskButton.translatesAutoresizingMaskIntoConstraints = false
        addTuskButton.setImage(addTuskButtoImage, for: .normal)
        addTuskButton.isHidden = true
        addTuskButton.addTarget(self, action: #selector(tapFunc), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: +10),
            timeLabel.widthAnchor.constraint(equalToConstant: CGFloat(contentView.bounds.width/2.5)),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: +5),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: +10),
            
            addTuskButton.topAnchor.constraint(equalTo: descriptionLabel.topAnchor),
            addTuskButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            addTuskButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - @Objs func for tapRecognaizer
    
    @objc func tapFunc(){
        guard let tap = didTap else { return }
        tap()
    }
    
    // MARK: - Setup cell
    
    func setup(timeStartText: String,
               timeFinishText: String,
               descriptionLabel: String,
               completion: @escaping () -> Void) {
        timeLabel.text = "\(timeStartText) - \(timeFinishText)"
        self.descriptionLabel.text = descriptionLabel
        self.didTap = completion
    }
}
