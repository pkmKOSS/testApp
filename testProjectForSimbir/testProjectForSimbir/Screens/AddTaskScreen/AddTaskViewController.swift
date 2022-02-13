//
//  ViewController.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 09.02.2022.
//

import UIKit


class AddTaskViewController: UIViewController {
    // MARK: - External vars
    
    var interactor: AddTaskBusinessLogic?
    var router: AddTaskRoutingLogic?
    var dateOfTask: Date?

    // MARK: - Private lets and views
    
    let nameTF = UITextField()
    let descriptionTF = UITextField()
    let timePicker = UIDatePicker()
    let addTaskButton = UIButton()
    let textView = UITextView()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    // MARK: - Config views
    
    private func configViews(){
        
        view.addSubview(nameTF)
        view.addSubview(textView)
        view.addSubview(timePicker)
        view.addSubview(addTaskButton)
        
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        addTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameTF.placeholder = " Наименование дела "
        nameTF.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        nameTF.layer.borderWidth = 1
        nameTF.layer.cornerRadius = 5
        
        textView.text = " Краткое описание"
        textView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        
        timePicker.datePickerMode = .time
        timePicker.locale = Locale(identifier: "en_GB")
                
        addTaskButton.setTitle("Добавить", for: .normal)
        addTaskButton.layer.cornerRadius = 5
        addTaskButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        addTaskButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            nameTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +10),
            nameTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: +10),

            textView.leadingAnchor.constraint(equalTo: nameTF.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: nameTF.trailingAnchor),
            textView.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: +10),
            textView.bottomAnchor.constraint(equalTo: timePicker.topAnchor, constant: -15),
            
            timePicker.leadingAnchor.constraint(equalTo: nameTF.leadingAnchor),
            
            addTaskButton.leadingAnchor.constraint(equalTo: nameTF.leadingAnchor),
            addTaskButton.trailingAnchor.constraint(equalTo: nameTF.trailingAnchor),
            addTaskButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: +10),
            addTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - @objc func
    @objc func addTask(){
        let id = Int.random(in: 1...10000)
        interactor?.uploadData(id: id,
                               task_time: timePicker.date,
                               task_date: dateOfTask!,
                               name: nameTF.text ?? "Без имени",
                               descriptionString: textView.text)
    }
}

extension AddTaskViewController: AddTaskDisplayLogic {
    func displayData(name: String, date: String, time: String) {
        let task = "Дело: \(name) запланировано на \(time), \(date)"
        let alert = UIAlertController(title: name, message: task, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
}
