//
//  main.swift
//  GB_5_Lesson
//
//  Created by Oksana on 01.08.2021.
//

import Foundation

enum Transmission {
    case auto, manual
}

enum StateEngine {
    case start, stop
}

enum StateWindows {
    case open, close
}

enum StateDoors {
    case open, closed
}



protocol PrintInfoAboutCar: BasicDataOfCar {
    func printInfo() -> String
}

extension PrintInfoAboutCar {
    func printInfo() {
        print()
           
    }
}

protocol BasicDataOfCar: AnyObject {
    var model: String { get }
    var reliseYear: Int { get }
    var transmission: Transmission { get set }
    var stateEngine: StateEngine { get set }
    var stateWindows: StateWindows { get set }
    var stateDoors: StateDoors { get set }
}

    func changeTransmission(to: Transmission) {}
    func changeStatusEngine(to: StateEngine) {}
    func changeStatusWindow(to: StateWindows) {}
    func changeStatusDoor(to: StateDoors) {}

extension BasicDataOfCar {
    
    func changeTransmission(transmission: Transmission) {
        self.transmission = transmission
    }
    func changeStateEngine (stateEngine: StateEngine ) {
        self.stateEngine = stateEngine
    }
    func changeStateWindows (stateWindows: StateWindows) {
        self.stateWindows = stateWindows
    }
    func changeStateDoors (stateDoors: StateDoors) {
        self.stateDoors = stateDoors
    }
}

class SportCar {
    let model: String
    let reliseYear: Int
    var transmission: Transmission
    var stateEngine: StateEngine
    var stateWindows: StateWindows
    var stateDoors: StateDoors
    
    init(
        model: String,
        reliseYear: Int,
        transmission: Transmission,
        stateEngine: StateEngine,
        stateWindows: StateWindows,
        stateDoors: StateDoors
    ) {
        self.model = model
        self.reliseYear = reliseYear
        self.transmission = transmission
        self.stateEngine = stateEngine
        self.stateWindows = stateWindows
        self.stateDoors = stateDoors
    }
}

extension SportCar: BasicDataOfCar, CustomStringConvertible {
    
    func changeStateAlarm() -> String{
        if stateEngine == .stop{
            return "включена. Автомобиль нельзя эксплуатировать"
        } else {
            return "отключена. Автомобиль готов к эксплуатации"
        }
}
    
        var description: String{
            return ("""
                    ______________________________________________
                    Автомобиль: \(model), \(reliseYear) года выпуска
                    Коробка передач: \(transmission)
                    Готовность автомобиля к эксплуатации:
                    Двигатель: \(stateEngine == .start ? "включен" : "выключен")
                    Окна: \(stateWindows == .open ? "открыты" : "закрыты")
                    Двери: \(stateDoors == .open ? "открыты" : "закрыты")
                    Сигнализация \(changeStateAlarm())
                    """)
        }
}

class TrunkCar {
    let model: String
    let reliseYear: Int
    var transmission: Transmission
    var stateEngine: StateEngine
    var stateWindows: StateWindows
    var stateDoors: StateDoors
    
    init(
        model: String,
        reliseYear: Int,
        transmission: Transmission,
        stateEngine: StateEngine,
        stateWindows: StateWindows,
        stateDoors: StateDoors
    ) {
        self.model = model
        self.reliseYear = reliseYear
        self.transmission = transmission
        self.stateEngine = stateEngine
        self.stateWindows = stateWindows
        self.stateDoors = stateDoors
    }
}
extension TrunkCar: BasicDataOfCar, CustomStringConvertible {
    
        func changeStateTrunk() -> String {
            if stateEngine == .stop{
                return "можно загружать. Двигатель не работает"
            } else {
                return "нельзя загружать. Работает двигатель"
            }
        }
    
        var description: String {
            return ("""
                    ______________________________________________
                    Автомобиль: \(model), \(reliseYear) года выпуска
                    Коробка передач: \(transmission)
                    Готовность автомобиля к эксплуатации:
                    Двигатель: \(stateEngine == .start ? "включен" : "выключен")
                    Окна: \(stateWindows == .open ? "открыты" : "закрыты")
                    Двери: \(stateDoors == .open ? "открыты" : "закрыты")
                    Цистерну \(changeStateTrunk())
                    """)
        }
}

let carSport1 = SportCar(
                model: "Dodge",
                reliseYear: 2007,
                transmission: .manual,
                stateEngine: .start,
                stateWindows: .open,
                stateDoors: .open)
                

let carSport2 = SportCar(
                model: "Nissan GT-R",
                reliseYear: 2020,
                transmission: .auto,
                stateEngine: .stop,
                stateWindows: .close,
                stateDoors: .closed)


let carTrunk1 = TrunkCar(
                model: "Renault Kerax",
                reliseYear: 2019,
                transmission: .auto,
                stateEngine: .stop,
                stateWindows: .close,
                stateDoors: .open)

let carTrunk2 = TrunkCar(
                model: "MAN 14.232",
                reliseYear: 2007,
                transmission: .auto,
                stateEngine: .start,
                stateWindows: .open,
                stateDoors: .closed)

print(carSport1)
print(carSport2)
print(carTrunk1)
print(carTrunk2)
