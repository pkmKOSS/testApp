//
//  ViewController.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 04.02.2022.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: UIViewController {
    
    // MARK: - External vars
    
    var interactor: CalendarBusinessLogic?
    var router: CalendarRoutingLogic?
    
    // MARK: - Private vars and lets
    
    private let calendar = FSCalendar()
    private let viewForCalendar = UIView()
    private let taskTableView = UITableView()
    private let showCalendarButton = UIButton()
    private let dateFormater = DateFormatter()
    private var dictionaryForCell = [String: TaskRealmModel]()
    private var selectedDate = Date()
    private var calendarHeightConstraint = NSLayoutConstraint()
    private var viewFrame = CGFloat()
    
    // MARK: - Life circle
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchData()
        taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(Realm.Configuration.defaultConfiguration.fileURL)
        configViews()
        calendar.dataSource = self
        calendar.delegate = self
        taskTableView.dataSource = self
        taskTableView.delegate = self
    }
    
    //MARK: Config views
    
    private func configViews(){

        view.addSubview(calendar)
        view.addSubview(taskTableView)
        view.addSubview(showCalendarButton)
        viewFrame = view.frame.height
        
        taskTableView.translatesAutoresizingMaskIntoConstraints = false
        taskTableView.isHidden = true
        taskTableView.register(TaskCellTableViewCell.self, forCellReuseIdentifier: "CELL")
        taskTableView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        taskTableView.layer.borderWidth = 1
        taskTableView.layer.cornerRadius = 5
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CalendarCell")
        calendar.scrollDirection = .vertical
        calendar.contentMode = .redraw
        calendar.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        calendar.layer.borderWidth = 1
        calendar.layer.cornerRadius = 5
        calendarHeightConstraint = NSLayoutConstraint(item: calendar,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1,
                                                      constant: viewFrame)
        
        showCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        showCalendarButton.setTitle("Показать календарь", for: .normal)
        showCalendarButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        showCalendarButton.layer.cornerRadius = 5
        showCalendarButton.setTitleColor(.black, for: .normal)
        showCalendarButton.isHidden = true
        showCalendarButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
        NSLayoutConstraint.activate([
            calendar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +10),
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            calendarHeightConstraint,
            
            showCalendarButton.leadingAnchor.constraint(equalTo: calendar.leadingAnchor),
            showCalendarButton.topAnchor.constraint(equalTo: calendar.bottomAnchor),
            showCalendarButton.centerXAnchor.constraint(equalTo: calendar.centerXAnchor),
            
            taskTableView.topAnchor.constraint(equalTo: showCalendarButton.bottomAnchor, constant: 0),
            taskTableView.leadingAnchor.constraint(equalTo: calendar.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: calendar.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Tap Funcs
    
    func tapOnDate(){
        if calendar.scope == .month {
            calendar.setScope(.week, animated: true)
            showCalendarButton.isHidden = false
            taskTableView.isHidden = false
        }
    }
    
    func tapOnButton(){
            calendar.setScope(.month, animated: true)
            showCalendarButton.isHidden = true
            taskTableView.isHidden = true
            taskTableView.reloadData()
    }
    
    // MARK: - @OBJC func
    
    @objc func buttonAction(){
        tapOnButton()
    }
}

    // MARK: - Extensions

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view datasource and delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TaskCellTableViewCell
        
        dateFormater.dateFormat = "yyyy:MM:dd"
        dateFormater.locale = Locale.current
        
        let dictionaryKey = dateFormater.string(from: selectedDate)
        
        let adress = dictionaryForCell["\(dictionaryKey)"]
        
        if indexPath.row == Int(adress?.task_time ?? ""){
            cell.setup(timeStartText: "\(indexPath.row):00",
                       timeFinishText: "\(indexPath.row + 1):00",
                       descriptionLabel: adress?.name ?? ""){ [self] in
                self.router?.routToDetail(task_date: adress!.task_date)
            }
            cell.addTuskButton.isHidden = true
        } else {
            cell.setup(timeStartText: "\(indexPath.row):00", // создание пустой ячейки
                       timeFinishText: "\(indexPath.row + 1):00",
                       descriptionLabel: ""){ 
                self.router?.routToAddTuskScreen(date: self.selectedDate)
            }
            cell.addTuskButton.isHidden = false
        }
        return cell
    }
    
    
    // MARK: - Calendar methods
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
        tapOnDate()
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }
}

extension CalendarViewController: CalendarDisplayLigic {
    func displayData(array: [String: TaskRealmModel]) {
        dictionaryForCell = array
        taskTableView.reloadData()
    }
}
