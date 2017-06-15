//
//  CalendarViewController.swift
//  WakeUp
//
//  Created by Anastasia Chetrusca on 4/25/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    let calendar    = Calendar.current
    var currentDate = Date()
    var startDate   = Date()
    var dayButtons  = [UIButton]()
    
    @IBOutlet weak var labelYearMonth: UIButton!
    
    @IBOutlet var day00: UIButton!
    
    
    // DAY BUTTONS
    @IBOutlet weak var day01: UIButton!
    @IBOutlet weak var day02: UIButton!
    @IBOutlet weak var day03: UIButton!
    @IBOutlet weak var day04: UIButton!
    @IBOutlet weak var day05: UIButton!
    @IBOutlet weak var day06: UIButton!
    @IBOutlet weak var day07: UIButton!
    @IBOutlet weak var day08: UIButton!
    @IBOutlet weak var day09: UIButton!
    @IBOutlet weak var day10: UIButton!
    @IBOutlet weak var day11: UIButton!
    @IBOutlet weak var day12: UIButton!
    @IBOutlet weak var day13: UIButton!
    @IBOutlet weak var day14: UIButton!
    @IBOutlet weak var day15: UIButton!
    @IBOutlet weak var day16: UIButton!
    @IBOutlet weak var day17: UIButton!
    @IBOutlet weak var day18: UIButton!
    @IBOutlet weak var day19: UIButton!
    @IBOutlet weak var day20: UIButton!
    @IBOutlet weak var day21: UIButton!
    @IBOutlet weak var day22: UIButton!
    @IBOutlet weak var day23: UIButton!
    @IBOutlet weak var day24: UIButton!
    @IBOutlet weak var day25: UIButton!
    @IBOutlet weak var day26: UIButton!
    @IBOutlet weak var day27: UIButton!
    @IBOutlet weak var day28: UIButton!
    @IBOutlet weak var day29: UIButton!
    @IBOutlet weak var day30: UIButton!
    @IBOutlet weak var day31: UIButton!
    @IBOutlet weak var day32: UIButton!
    @IBOutlet weak var day33: UIButton!
    @IBOutlet weak var day34: UIButton!
    @IBOutlet weak var day35: UIButton!
    @IBOutlet weak var day36: UIButton!
    @IBOutlet weak var day37: UIButton!
    @IBOutlet weak var day38: UIButton!
    @IBOutlet weak var day39: UIButton!
    @IBOutlet weak var day40: UIButton!
    @IBOutlet weak var day41: UIButton!
    
    @IBAction func onPrevMonth(_ sender: AnyObject) {
        currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate)!
        print(currentDate)
        updateCalendar()
    }
    
    @IBAction func onNextMonth(_ sender: AnyObject) {
        currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate)!
        print(currentDate)
        updateCalendar()
    }
    
    @IBAction func onToday(_ sender: AnyObject) {
        currentDate = Date()
        print(currentDate)
        updateCalendar()
    }
    
    // Not IBAction, we will assign it in a loop to each button
    func onDayClick(_ sender: AnyObject) {
        let dayIndex = sender.tag ?? 0
        let selectedDay = calendar.date(byAdding: .day, value: dayIndex, to: startDate)!
        print("DayIndex ", dayIndex)
        print("Selected ", selectedDay)
        // TODO: open new view pass selectedDay
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDayButtons()
        updateCalendar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDayButtons() {
        dayButtons.append(day00)
        dayButtons.append(day01)
        dayButtons.append(day02)
        dayButtons.append(day03)
        dayButtons.append(day04)
        dayButtons.append(day05)
        dayButtons.append(day06)
        dayButtons.append(day07)
        dayButtons.append(day08)
        dayButtons.append(day09)
        dayButtons.append(day10)
        dayButtons.append(day11)
        dayButtons.append(day12)
        dayButtons.append(day13)
        dayButtons.append(day14)
        dayButtons.append(day15)
        dayButtons.append(day16)
        dayButtons.append(day17)
        dayButtons.append(day18)
        dayButtons.append(day19)
        dayButtons.append(day20)
        dayButtons.append(day21)
        dayButtons.append(day22)
        dayButtons.append(day23)
        dayButtons.append(day24)
        dayButtons.append(day25)
        dayButtons.append(day26)
        dayButtons.append(day27)
        dayButtons.append(day28)
        dayButtons.append(day29)
        dayButtons.append(day30)
        dayButtons.append(day31)
        dayButtons.append(day32)
        dayButtons.append(day33)
        dayButtons.append(day34)
        dayButtons.append(day35)
        dayButtons.append(day36)
        dayButtons.append(day37)
        dayButtons.append(day38)
        dayButtons.append(day39)
        dayButtons.append(day40)
        dayButtons.append(day41)
        
        // lets assign an index to each button
        // and set each button click to onDayClick
        for (index, button) in dayButtons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(onDayClick(_:)), for: .touchUpInside)
        }
    }
    
    func updateMonth() {
        let year = calendar.component(.year, from: currentDate)
        let y4 = String(year)
        let y2 = y4.substring(from: y4.index(y4.startIndex, offsetBy: 2))
        let month = currentDate.getMonthName()
        labelYearMonth.setTitle("\(month) '\(y2)", for: .normal)
    }
    
    func updateDays() {
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let firstDay = Date.makeDate(day: 1, month: month, year: year)
        let numDays  = firstDay.numberOfDaysInMonth()
        let weekDay  = firstDay.firstWeekDayOfMonth() - 1
        print("Month: ", month)
        print("First day: ", firstDay)
        print("Num days: ", numDays)
        print("Week day: ", weekDay)
        
        // DEPRECATED: not needed anymore
        // An empty list with 42 places
        var listDays = [String]()
        for _ in 0..<42 { listDays.append("") }
        
        // Now let's get all the days in order
        for index in 0..<numDays {
            let day = weekDay + index
            listDays[day] = String(index+1)
            //dayButtons[day].setTitle(String(index+1), for: .normal)
        }
        
        print(listDays) // We should see the days as they should go in our calendar
        
        // Lets go back as many days as weekDay so we start at the first square
        var iniDay = calendar.date(byAdding: .day, value: -weekDay, to: firstDay)!
        print("Ini day: ", iniDay)
        startDate = iniDay
        
        for index in 0..<42 {
            // Set button label
            let dayNumber = calendar.component(.day, from: iniDay)
            dayButtons[index].setTitle(String(dayNumber), for: .normal)
            
            // Color day
            let dayMonth = calendar.component(.month, from: iniDay)
            if dayMonth == month {
                dayButtons[index].backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
                dayButtons[index].setTitleColor(UIColor.black, for: .normal)
            } else {
                dayButtons[index].backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
                dayButtons[index].setTitleColor(UIColor.lightGray, for: .normal)
            }
            
            // Next day
            iniDay = calendar.date(byAdding: .day, value: 1, to: iniDay)!
        }
        
        
    }
    
    func updateCalendar() {
        updateMonth()
        updateDays()
        // more stuff
    }
    
}

