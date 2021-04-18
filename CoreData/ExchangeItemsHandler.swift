//
//  File.swift
//  VCoin
//
//  Created by Marcin Czachurski on 28.01.2018.
//  Copyright © 2018 Marcin Czachurski. All rights reserved.
//

import CoreData
import Foundation

class ExchangeItemsHandler {
    func createExchangeItemEntity() -> ExchangeItem {
        let context = CoreDataHandler.shared.container.viewContext
        return ExchangeItem(context: context)
    }

    func deleteExchangeItemEntity(exchangeItem: ExchangeItem) {
        let context = CoreDataHandler.shared.container.viewContext
        context.delete(exchangeItem)
    }

    func getExchangeItems() -> [ExchangeItem] {
        var exchangeItems: [ExchangeItem] = []

        let context = CoreDataHandler.shared.container.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExchangeItem")
        do {
            if let list = try context.fetch(fetchRequest) as? [ExchangeItem] {
                exchangeItems = list
            }
        } catch {
            print("Error during fetching ExchangeItem")
        }

        return exchangeItems
    }
}
