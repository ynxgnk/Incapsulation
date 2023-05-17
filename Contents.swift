import UIKit

/*
 
 Инкапсуляция - это принцип размещения данных и методов работы с этими данными в одном обьекте, а так же разграничеие доступа к этим данным, посредством специальных флагов(ключевых слов).
 
 Singleton - паттерн, который гарантирует что данного класса будет создан всего 1 экземпляр. Пример (1).

 Приватным инициализатором мы можем пользоваться только внутри класса
 
 
 
 */

class Wallet {
    
    static let shared = Wallet() /* (1) */
    private var balance  = 0
    
    private init() { /* (2) */
        
    }
    
    func add(cash: Int) {
        self.balance += cash
        print(self.balance)
    }
    
    func withdraw(cash: Int) -> Int {
        guard cash <= balance else {
            return 0
        }
        
        balance -= cash
        return cash
    }
    
    func getBalance() -> Int {
        return self.balance
    }
}

//var wallet = Wallet()
//wallet.add(cash: 5000)
//wallet.getBalance()
//
//wallet.withdraw(cash: 3000)
//wallet.withdraw(cash: 1999)
//wallet.getBalance()


class Shop {
    
    var wallet = Wallet.shared
}

class Job {
    
    var wallet = Wallet.shared
    
//    var wallet2 = Wallet() /* чтоб запретить так делать, поможет приватный инициализатор (2) */
}

var silpo = Shop()
var fabrica = Job()

fabrica.wallet.add(cash: 15000)
let checkSum = silpo.wallet.withdraw(cash: 3000)

print(checkSum)
fabrica.wallet.getBalance()
silpo.wallet.getBalance()


class Person {
    
    let wallet = Wallet.shared
    var goods = [String]()
    
    private func get(goods: String) {
        self.goods.append(goods)
        print("Goods \(goods) was bought.")
    }
    
    private func give(money: Int) {
        self.wallet.withdraw(cash: money)
        print("Sum is \(money) $")
    }
    
    func buy(goods: String, price: Int) {
        guard price <= wallet.getBalance() else {
            return
        }
        
        get(goods: goods)
        give(money: price)
    }
}


let vasya = Person()

print(vasya.goods)
vasya.wallet.getBalance()

fabrica.wallet.add(cash: 80000)
vasya.wallet.getBalance()
vasya.buy(goods: "iPhone 13 mini", price: 70000)
vasya.wallet.getBalance()
vasya.buy(goods: "Case", price: 650)
vasya.wallet.getBalance()
