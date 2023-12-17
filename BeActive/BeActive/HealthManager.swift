//
//  HealthManager.swift
//  BeActive
//
//  Created by AMAR on 16/12/23.
//

import Foundation
import HealthKit

extension Date{
    static var startDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}
class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    @Published var activities: [String : Activity] = [:]
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        
        let healthTypes: Set = [steps, calories]
        
        Task{
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodaySteps()
                fetchTodayCalories()
            }catch{
                print("error fetching health data")
            }
        }
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays step data")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            
            let activity = Activity(id: 0, title: "Todays steps", subtitle: "Goal 10,000", image: "figure.walk", amount: stepCount.formattedString())
            
            DispatchQueue.main.async {
                self.activities["todaySteps"] = activity
            }
            print(stepCount)
        }
        healthStore.execute(query)
    }
    
    func fetchTodayCalories() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays step data")
                return
            }
            
            let caloriesBurned = quantity.doubleValue(for: .kilocalorie())
            
            let activity = Activity(id: 0, title: "Todays calories", subtitle: "Goal 900", image: "flame", amount: caloriesBurned.formattedString())
            
            DispatchQueue.main.async {
                self.activities["todayCalories"] = activity
            }
            print(caloriesBurned.formattedString())
        }
        healthStore.execute(query)
    }
    
}

extension Double {
    func formattedString()-> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
