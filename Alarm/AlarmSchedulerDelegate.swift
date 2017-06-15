//
//  AlarmSchedulerDelegate.swift
//  WakeUp
//
//  Created by Anastasia Chetrusca on 4/25/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation

protocol AlarmSchedulerDelegate {
    func setNotificationWithDate(_ date: Date, onWeekdaysForNotify:[Int], snoozeEnabled: Bool, onSnooze:Bool, soundName: String, index: Int)
    //helper
    func setNotificationForSnooze(snoozeMinute: Int, soundName: String, index: Int)
    func setupNotificationSettings()
    func reSchedule()
    func checkNotification()
}

