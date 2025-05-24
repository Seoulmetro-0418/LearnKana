//
//  CoreDataHelper.swift
//  LearnKana
//
//  Created by Hyunjun Kim on 3/22/25.
//


import CoreData
import SwiftUI

class CoreDataHelper {
    static let shared = CoreDataHelper()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "QuizRecord") // CoreData 모델 파일 이름
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load CoreData stack: \(error.localizedDescription)")
            }
        }
    }

    // 기록을 불러오는 함수
    func getCurrentQuizRecord() -> QuizRecord? {
        let fetchRequest: NSFetchRequest<QuizRecord> = QuizRecord.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", Calendar.current.startOfDay(for: Date()) as NSDate)
        
        do {
            let records = try container.viewContext.fetch(fetchRequest)
            return records.first
        } catch {
            print("Failed to fetch quiz record: \(error.localizedDescription)")
            return nil
        }
    }

    // 기록을 저장하는 함수
    func saveQuizRecord(total: Int32, correct: Int32, incorrect: Int32) {
        let context = container.viewContext
        let today = Calendar.current.startOfDay(for: Date())
        let fetchRequest: NSFetchRequest<QuizRecord> = QuizRecord.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", today as NSDate)

        print("CoreData 저장 시도 - total:\(total), correct:\(correct), incorrect:\(incorrect)")

        do {
            let records = try context.fetch(fetchRequest)
            let record = records.first ?? QuizRecord(context: context)

            record.date = today
            record.totalQuestions = total
            record.correctAnswers = correct
            record.incorrectAnswers = incorrect
            record.timestamp = Date()

            try context.save()
            print("저장 성공")

            let afterSaveRecords = try context.fetch(fetchRequest)
            print("저장 후 조회된 레코드 수: \(afterSaveRecords.count)")
        } catch {
            print("Failed to save quiz record: \(error.localizedDescription)")
        }
    }

    // 기록 초기화 함수
    func resetQuizRecord() {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<QuizRecord> = QuizRecord.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", Calendar.current.startOfDay(for: Date()) as NSDate)

        do {
            let records = try context.fetch(fetchRequest)
            for record in records {
                context.delete(record)
            }
            try context.save()
        } catch {
            print("Failed to reset quiz records: \(error.localizedDescription)")
        }
    }
}
