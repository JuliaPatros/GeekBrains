//
//  main.swift
//  dz4
//
//  Created by Patros on 27.09.2021.
//

import Foundation

enum Windows: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum Engine: String {
    case start = "Двигатель запущен"
    case stop = "Двигатель остановлен"
}

//MARK: Класс Car

class Car {
    let mark: String
    let year: Int
    let engineCapacity: Double
    let enginePower: Int
    let transmission: String
    let volumeTrunk: Int
    var volumeTrunkComplete: Int
    var windowsStatus: Windows
    var engineStatus: Engine


    init(mark: String,
         year: Int,
         engineCapacity: Double,
         enginePower: Int,
         transmission: String,
         volumeTrunk: Int,
         volumeTrunkComplete: Int,
         windowsStatus: Windows,
         engineStatus: Engine) {
        self.mark = mark
        self.year = year
        self.engineCapacity = engineCapacity
        self.enginePower = enginePower
        self.transmission = transmission
        self.volumeTrunk = volumeTrunk
        self.volumeTrunkComplete = volumeTrunkComplete
        self.windowsStatus = windowsStatus
        self.engineStatus = engineStatus
    }

    func engineStart() {
        engineStatus = .start
        print(engineStatus.rawValue)
    }
    func engineStop() {
        engineStatus = .stop
        print(engineStatus.rawValue)
    }

    func windowsOpen () {
        windowsStatus = .open
        print(windowsStatus.rawValue)
    }
    func windowsClose () {
        windowsStatus = .close
        print(windowsStatus.rawValue)
    }

    func trunkAdd (freight: Int) {
        volumeTrunkComplete + freight < volumeTrunk ? volumeTrunkComplete += freight : print("не загрузим")
    }
    func trunkRemove (freight: Int) {
        volumeTrunkComplete - freight >= 0 ? volumeTrunkComplete -= freight : print("столько нет груза")
    }

    func printCar() {
        print("""
        Автомобиль - \(mark) \(year) г.в.
        объем двигателя - \(engineCapacity), мощность - \(enginePower) л.с., \(transmission)
        занято в багажнике \(volumeTrunkComplete) из \(volumeTrunk)
        \(windowsStatus.rawValue) и \(engineStatus.rawValue)
        """)
    }
}

//MARK: наследник SportCar

final class SportCar: Car {
    let color: String
    let type: String
    let countDoor: Int

    init(mark: String,
         year: Int,
         engineCapacity: Double,
         enginePower: Int,
         transmission: String,
         volumeTrunk: Int,
         volumeTrunkComplete: Int,
         windowsStatus: Windows,
         engineStatus: Engine,
         color: String,
         type: String,
         countDoor: Int) {
        self.color = color
        self.type = type
        self.countDoor = countDoor

        super.init(mark: mark,
                   year: year,
                   engineCapacity: engineCapacity,
                   enginePower: enginePower,
                   transmission: transmission,
                   volumeTrunk: volumeTrunk,
                   volumeTrunkComplete: volumeTrunkComplete,
                   windowsStatus: windowsStatus,
                   engineStatus: engineStatus)
    }

    override func printCar() {
        print("""
        Автомобиль - \(mark) \(year) г.в.
        \(color) \(countDoor)-х дверный \(type)
        объем двигателя - \(engineCapacity), мощность - \(enginePower) л.с., \(transmission)
        занято в багажнике \(volumeTrunkComplete) из \(volumeTrunk)
        \(windowsStatus.rawValue) и \(engineStatus.rawValue)
        """)
    }
}

//MARK: Наследник TrunkCar

final class TrunkCar: Car {
    let trailer: Bool
    let trailerMark: String
    let fuel: String
    let weight: Double
    let loadCapacity: Int
    var load: Int
    let wheelFormula: String

    init(mark: String,
         year: Int,
         engineCapacity: Double,
         enginePower: Int,
         transmission: String,
         volumeTrunk: Int,
         volumeTrunkComplete: Int,
         windowsStatus: Windows,
         engineStatus: Engine,
         trailer: Bool,
         trailerMark: String,
         fuel: String,
         weight: Double,
         loadCapacity: Int,
         load: Int,
         wheelFormula: String) {
        self.trailer = trailer
        self.trailerMark = trailerMark
        self.fuel = fuel
        self.weight = weight
        self.loadCapacity = loadCapacity
        self.load = load
        self.wheelFormula = wheelFormula

        super.init(mark: mark,
                   year: year,
                   engineCapacity: engineCapacity,
                   enginePower: enginePower,
                   transmission: transmission,
                   volumeTrunk: volumeTrunk,
                   volumeTrunkComplete: volumeTrunkComplete,
                   windowsStatus: windowsStatus,
                   engineStatus: engineStatus)
    }

    func trailerTunk () -> String {
        trailer ? (trailerMark) : "отсутствует"
    }

    override func trunkAdd (freight: Int) {
        load + freight < loadCapacity ? self.load += freight : print("не загрузим")
    }
    override func trunkRemove (freight: Int) {
        load - freight >= 0 ? self.load -= freight : print("столько нет груза")
    }

    override func printCar() {
        print("""
        Автомобиль - \(mark) \(year) г.в.
        прицеп - \(trailerTunk())
        объем двигателя - \(engineCapacity), мощность - \(enginePower) л.с., \(transmission)
        занято в багажнике \(volumeTrunkComplete) из \(volumeTrunk)
        \(windowsStatus.rawValue) и \(engineStatus.rawValue)
        """)
    }
}

//MARK: вызов экземпляра
var carOne = SportCar(mark: "Hyundai Tiburon",
                      year: 1996,
                      engineCapacity: 2.0,
                      enginePower: 139,
                      transmission: "АКПП",
                      volumeTrunk: 360,
                      volumeTrunkComplete: 10,
                      windowsStatus: .close,
                      engineStatus: .stop,
                      color: "черный",
                      type: "хэтчбек",
                      countDoor: 2)

var carTwo = TrunkCar(mark: "DAf",
                      year: 1998,
                      engineCapacity: 12.9,
                      enginePower: 410,
                      transmission: "МКПП",
                      volumeTrunk: 0,
                      volumeTrunkComplete: 0,
                      windowsStatus: .open,
                      engineStatus: .start,
                      trailer: true,
                      trailerMark: "Wielton",
                      fuel: "Дизель",
                      weight: 10.5,
                      loadCapacity: 20,
                      load: 0,
                      wheelFormula: "6x2")

carOne.volumeTrunkComplete += 40
carOne.trunkRemove(freight: 30)
carTwo.windowsStatus = .close
carOne.printCar()
carTwo.printCar()


