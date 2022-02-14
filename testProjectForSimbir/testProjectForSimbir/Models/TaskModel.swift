//
//  CalendarModel.swift
//  testProjectForSimbir
//
//  Created by Александр Григоренко on 06.02.2022.
//

import RealmSwift
import Foundation

class TaskRealmModel: Object {
    @Persisted var id = Int()
    @Persisted var task_time = ""
    @Persisted var task_date = ""
    @Persisted var name: String = ""
    @Persisted var descriptionString: String = ""
}
