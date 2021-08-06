import UIKit


// MARK: ОСНОВЫ

/*
func sayHi(_ greeting: String = "Hello",
           _ destination: String = "world") -> (greeting: String, destination: String){
    
    print("\(greeting), \(destination)!")
    return (greeting, destination)
}

let greetingInfo = sayHi()
print(greetingInfo.0, terminator: " "); print(greetingInfo.1)
let (greeting, _) = greetingInfo
print(greeting, terminator: " "); print(greetingInfo.destination)
let person = (name: "Alice", age: 17)
print("Hi, I'm \(person.name) and I'm \(person.age) years old")


var const1, const2 : String
const1 = "Hello"

print(1, 2, 3, 4, 5, separator: "-")

print(Int64.max)
print(UInt32.max)

let decimalInt = 17
let binaryInt = 0b10001
let octalInt = 0o21
let hexInt = 0x11

let million = 1_000_000
let sum = 3 + 0.33

func convert(from value: String) -> Int? {
    let intValue = Int(value)
    if let actualValue = intValue {
        print("\(value) has been converted to \(actualValue)")
    }else{
        print("'\(value)' cannot be converted to integer")
    }
    return intValue
}

convert(from: "Hello")
convert(from: "8")

enum cookingErrors : Error{
    case notEnoughtTomato
    case notEnoughtChees
    case notEnoughtDought
}

func cookPizza(tomatoCount: Int = 0, cheeseCount: Int = 0, doughCount: Int = 0) throws {
    guard tomatoCount > 0 else {
        throw cookingErrors.notEnoughtChees
    }
    guard cheeseCount > 0 else {
        throw cookingErrors.notEnoughtChees
    }
    guard doughCount > 0 else {
        throw cookingErrors.notEnoughtChees
    }
    print("Pizza has been cooked - portions count: \(max(tomatoCount, cheeseCount, doughCount))")
}

do{
    try cookPizza(tomatoCount: 1, cheeseCount: 3, doughCount: 7)
} catch{
    print("Pizza cannot be cooked")
}

func giveMeOnlyPositiveNumber(value: Int){
    //assertion(value >= 0, "\(value) is not positive number!")
    precondition(value >= 0, "\(value) is not positive number!")
}

giveMeOnlyPositiveNumber(value: 7)
*/

// MARK: БАЗОВЫЕ ОПЕРАТОРЫ

/*
let firstPart = "ab"
let secondPart = "cd"
let oneString = firstPart + secondPart
let anotherString = "abcdf"

oneString < anotherString

(2, "zebra") < (3, "apple")
(1, "zebra") > (1, "apple")
(2, "apple") == (2, "apple")

var userColor : String?
var defaultColor = "purple"
let colorToUse = userColor ?? defaultColor

let namesArray = ["Anna", "Jack", "Tim", "Sally"]
for i in 0 ..< namesArray.count{
    print("\(i). \(namesArray[i])", terminator: " ; ")
}
print()
for name in namesArray[2...]{
    print("\(name)", terminator: " ; ")
}
print()
*/

// MARK: СТРОКИ И СИМВОЛЫ

/*
let uncodeCharacter = "\u{2665}"

let text = """
        Это называется
    многострочным \
    литералом
    """
print(text)

let emptyStr = ""
let anotherEmptyStr = String()

if(emptyStr == anotherEmptyStr && emptyStr.isEmpty && anotherEmptyStr.isEmpty){
    print("H" + emptyStr + anotherEmptyStr + "i")
}

var wordSun = ""
for char in "Sun"{
    wordSun.append(char)
}
print(wordSun)

let combinedChar: Character = "\u{006F}\u{301}"
var charArray: [Character] = ["f", "l", combinedChar, "w"]
let stringFromArr = String(charArray)
print(stringFromArr)

let smbString = "somebody"
smbString[smbString.index(smbString.startIndex, offsetBy: 3)]

let worldGreeting = "Hello, word!"
let index = worldGreeting.firstIndex(of: ",") ?? worldGreeting.endIndex
let substring = worldGreeting[..<index]
let newString = String(substring)
worldGreeting.hasPrefix(newString)
*/

// MARK: ТИПЫ КОЛЛЕКЦИЙ

/*
var emptyArr1 : Array<Int> = Array<Int>()
var emptyArr2 = [Int]()
var repeatingInitArr = Array(repeating: 0, count: 10)
var oneMoreArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

var sumArr = repeatingInitArr + oneMoreArr

sumArr += oneMoreArr
sumArr [10...18] = [1, 2, 3]
sumArr.insert(4, at: 13)

for (index, value) in sumArr.enumerated(){
    print("\(index + 1). \(value)")
}


var emptySet = Set<Int>()
var firstSet : Set = [5, 6, 7, 8, 9, 1, 2, 3, 4]
var secondSet = [1, 2, 4, 12, 13, 14, 15]

let isInserted = firstSet.insert(1)
let removedElement = firstSet.remove(12)
let isContainFive = firstSet.contains(5)

for element in firstSet.sorted() {
    print(element)
}
let unionSet = firstSet.union(secondSet)
let intersectionSet = firstSet.intersection(secondSet)
let diffSet = firstSet.symmetricDifference(secondSet)
let substractSet = firstSet.subtracting(secondSet)

intersectionSet.isSubset(of: firstSet)
firstSet.isSuperset(of: intersectionSet)
substractSet.isDisjoint(with: secondSet)


let emptyDictionary1 = Dictionary<Int, String>()
let emptyDictionary2 = [Int : String]()
var simpleDictionary = ["Elephane": "Africa", "Bear": "Russia", "Penguine": "Redland"]

simpleDictionary["Penguine"] = "Blueland"
let oldValue = simpleDictionary.updateValue("Greenland", forKey: "Penguine")
simpleDictionary.updateValue("Zoo", forKey: "Tiger")
if let tigerArea = simpleDictionary["Tiger"] {
    print("We have a tiger area: \(tigerArea)")
}
simpleDictionary.removeValue(forKey: "Tiger")

for (key, value) in simpleDictionary{
    print("\(key) lives in \(value)")
}
*/

// MARK: УПРАВЛЕНИЕ ПОТОКОМ

/*
var munuteIntervalsArr = [Int]()
for minuteInterval in stride(from: 0, to: 60, by: 5){
    munuteIntervalsArr.append(minuteInterval)
}

let coordinates = (0.0, 0.0)
switch coordinates {
case (0, 0):
    print("\(coordinates) is on the origin")
case (_, 0):
    print("\(coordinates) is on the x-axis")
case (0, let y):
    print("\(coordinates) is on the y-axis with value = \(y)")
case (-1...1, -1...1), (3...4, 3...4):
    print("\(coordinates) is inside the box")
case let (x, y) where x == y:
    print("\(coordinates) is ont the diagonale")
case (21.5, 21.5):
    break
default:
    print("\(coordinates) is outside the box")
}

var description = "It's a "
let targetNumber = 8
switch targetNumber {
case let x where (x % 2==0):
    description += "even "
    fallthrough
case 2, 4, 5, 8, 13, 19:
    description += "magic "
    fallthrough
default:
    description += "integer"
}
print(description)

var srtangeArr = [(Int, Int, Int)]()
first_loop : for i in stride(from: 0, to: 10, by: 3){
    secode_loop : for j in stride(from: 0, to: 10, by: 3){
        third_loop : for k in stride(from: 0, to: 10, by: 3){
            if (i + j + k & 2 == 0){
                continue secode_loop
            }
            if (k == 7){
                break third_loop
            }
            srtangeArr.append((i, j, k))
        }
    }
}
*/

// MARK: ФУНКЦИИ

/*
func doNothing() -> Void {
    doNotingAgain()
    return
}

func doNotingAgain() -> () {
    print()
}

func calculateMean(of numberArray: Double...) -> Double{
    var sum = 0.0
    for number in numberArray{
        sum += number
    }
    return sum / Double(numberArray.count)
}
calculateMean(of: 51, 3.7, 2.9, 19.33)

func swapNumbers(_ a: inout Int, _ b: inout Int){
    let c = a
    a = b
    b = c
}
var a = 7
var b = 2
let swapTwoInt : (inout Int, inout Int) -> () = swapNumbers
swapTwoInt(&a, &b)
print("a=\(a), b=\(b)")

func sumTwoNum(_ a: Double, _ b: Double) -> Double{
    return a + b
}
func calculateSmt(mathFunc: (Double, Double) -> Double, firstNumber a: Double, secondNumber b: Double){
    let mathFuncResult = mathFunc(a, b)
    print("Math result is \(mathFuncResult)")
}
calculateSmt(mathFunc: sumTwoNum, firstNumber: 4, secondNumber: 8)

func chooseMoovingFunc(isMovingForward: Bool) -> (Double) -> Double{
    
    func moveForward(from value: Double) -> Double{
        return value + 0.1
    }
    func moveBack(from value: Double) -> Double{
        return value - 1
    }
    
    return isMovingForward ? moveForward : moveBack
}
var startValue = 7.0
let moveNearerZero = chooseMoovingFunc(isMovingForward: startValue < 0)
print(moveNearerZero(startValue))
*/

// MARK: ЗАМЫКАНИЯ

/*
let arrToSort = [3, 6, 1, 19, 12, 15, 4]
let sortedArr1 = arrToSort.sorted(by: { (n1: Int, n2: Int) -> Bool in return n1 < n2 })
let sortedArr2 = arrToSort.sorted(by: { n1, n2 in return n1 < n2 })
let sortedArr3 = arrToSort.sorted(by: { n1, n2 in n1 < n2 })
let sortedArr4 = arrToSort.sorted(by: { $0 < $1 })
let sortedArr5 = arrToSort.sorted{ $0 < $1 }
let sortedArr6 = arrToSort.sorted(by: <)
sortedArr4 == sortedArr1

func sendRequest(onResponse: (Int) -> (), onFailure: (Int) -> ()){
    let responceCode = Int.random(in: -100...100)
    if (responceCode >= 0){
        onResponse(responceCode)
    } else {
        onFailure(responceCode)
    }
}

sendRequest { responseCode in
    print("Response code: \(responseCode)")
} onFailure: { errCode in
    print("Error code: \(errCode)")
}


func getCounterFunc(step: Int) -> () -> Int{
    var localCounterValue = 0
    func increment() -> Int{
        localCounterValue += step
        return localCounterValue
    }
    return increment
}

let incrementerByFive = getCounterFunc(step: 5)
let linkToIncrementer = incrementerByFive
incrementerByFive() == 5
linkToIncrementer() == 10
incrementerByFive() == 15

var complitionHandlers: [()->Void] = []
func funcWithEscapingClosure(complition: @escaping ()->Void){
    complitionHandlers.append(complition)
}
func funcWithoutEscapingClosure(compilation: ()-> Void){
    compilation()
}
class SomeClass{
    var x = 0
    func changeValue(){
        funcWithEscapingClosure { self.x = 100 }
        funcWithEscapingClosure { [self] in x = 100 }
        funcWithoutEscapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.changeValue()
print(instance.x)
complitionHandlers.first!()
print(instance.x)


var names = ["Leonardo", "Raphael", "Donatello", "Michelangelo"]
var delayedActions: [() -> String] = []
func addAction(_ action: @escaping @autoclosure () -> String){
    delayedActions.append(action)
}
addAction(names.removeFirst())
addAction(names.removeFirst())

for action in delayedActions{
    print(action())
}
*/

// MARK: ПЕРЕЧИСЛЕНИЯ

/*
enum CompassPoint: CaseIterable{
    case west, east, south, north
}
var headDirection = CompassPoint.east
headDirection = .south
CompassPoint.allCases.count

enum Barcode{
    case qr(String)
    case upc(Int, Int, Int, Int)
}
let firstBarcode = Barcode.qr("sdrftyuikln")
let secondBarcode = Barcode.upc(4, 0, 12, 9)

enum Cp1: Int{
    case west, east, south, north
}
Cp1.west.rawValue == 0

enum Cp2: String{
    case west, east, south, north
}
Cp2.west.rawValue == "west"
let west = Cp2(rawValue: "west")

enum Cp3: Double{
    case west = 73.93, east = 12.52, south = 85.63, north = 52.47
}
Cp3.west.rawValue == 73.93

indirect enum ArithmeticExpression{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case substraction(ArithmeticExpression, ArithmeticExpression)
}
typealias Exp = ArithmeticExpression
func calculateExpression(_ exp: ArithmeticExpression) -> Int{
    switch exp {
    case .number(let x):
        return x
    case .addition(let ex1, let ex2):
        return calculateExpression(ex1) + calculateExpression(ex2)
    case .substraction(let ex1, let ex2):
        return calculateExpression(ex1) - calculateExpression(ex2)
    }
}
let expresssion = Exp.addition(Exp.substraction(Exp.number(9), Exp.number(4)), Exp.number(15))
print("Result = \(calculateExpression(expresssion))")
*/

// MARK: СТРУКТУРЫ И КЛАССЫ

/*
struct Resolution{
    var height = 0
    var width = 0
}
var resolutionInst = Resolution(height: 100)
var resolutionCopy = resolutionInst
resolutionCopy.height = 200
print("\(resolutionInst.height) != \(resolutionCopy.height)")

class PersonInfo{
    var name : String = "Unknown"
}
let personJack = PersonInfo()
personJack.name = "Jack"
let personeTim = personJack
personeTim.name = "Tim"
print("Ooops, Jack name is '\(personJack.name)' like \(personeTim.name) name")
personeTim === personJack
*/

// MARK: СВОЙСТВА

/*
class DataImporter{
    let importFileName = "out"
    init(){
        print("Creating data importer. Wait...")
        //        sleep(3)
        print("Importer has been successfully created")
    }
}
class DataManager{
    let someData = ["BJEFV", "UHEABV", "NJAVFW"]
    lazy var importer = DataImporter()
}
let manager = DataManager()
print(manager.someData.first ?? "No data")
manager.importer.importFileName

struct Square{
    static let rate = 1
    
    var sideSize: Int {
        didSet(old){
            print("Differense is \(old - sideSize)")
        }
        willSet{
            print("Will set \(newValue)")
        }
    }
    var areaSize: Int {
        get{
            return sideSize * sideSize * Square.rate
        }
        set{
            let side = sqrt(Double(newValue))
            if(side.truncatingRemainder(dividingBy: 1.0) == 0.0){
                self.sideSize = Int(side)
            } else {
                self.sideSize = 0
            }
        }
    }
}
var simpleSquare = Square(sideSize: 2)
simpleSquare.areaSize = 64
simpleSquare.sideSize
Square.rate
*/

// MARK: МЕТОДЫ

/*
struct Point{
    var x: Int
    var y: Int
    
    mutating func moveBy(x deltaX: Int, y deltaY: Int){
        x += deltaX
        y += deltaY
    }
}
var center = Point(x: 8, y: -2)
center.moveBy(x: 2, y: 12)
center.y

enum Direction{
    case up, down, left, right
    
    mutating func moveLeft(){
        self = .left
    }
}
var shipDirection = Direction.down
shipDirection.moveLeft()
*/

// MARK: САБСКРИПЫ

/*
struct Matrix{
    var data = [[Double]]()
    init(height: Int, width: Int){
        for _ in 0..<height {
            data.append(Array(repeating: 0, count: width))
        }
    }
    func printMatrix(){
        for row in data{
            for element in row{
                print(element, terminator: " ")
            }
            print()
        }
    }
    func isValidIndex(_ row: Int, _ column: Int) -> Bool{
        return 0<=row && row < data.count && 0<=column && column < data[row].count
    }
    subscript(row: Int, column: Int) -> Double{
        get{
            assert(isValidIndex(row, column), "Index out of range")
            return data[row][column]
        }
        set{
            assert(isValidIndex(row, column), "Index out of range")
            data[row][column] = newValue
        }
    }
}
var zeroMat = Matrix(height: 5, width: 3)
zeroMat[3, 1] = 5
zeroMat.printMatrix()
*/

// MARK: НАСЛЕДОВАНИЕ

/*
class Car {
    var numberOfPassagers: Int {
        get{
            return 15
        }
    }
    final func describeCar(){
        print("It's a car")
    }
}

class HalfOfCar : Car {
    let color = "green"
    
    override var numberOfPassagers: Int{
        get{
            return super.numberOfPassagers / 2
        }
    }
}
*/

// MARK: ИНИЦИАЛИЗАТОРЫ

/*
class Food{
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "[Unknown]")
    }
}
class ReceiptIngredient: Food{
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}
class ShoppingListItem: ReceiptIngredient{
    var isPurshed = false
    func description() -> String{
        return "\(quantity) x \(name)\t" + (isPurshed ? "✔" : "✘")
    }
}
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Egg", quantity: 4)
]
breakfastList.first!.name = "Juice"
breakfastList[2].isPurshed = true

for item in breakfastList{
    print(item.description())
}

class Animal{
    let name: String
    
    required init?(name: String){
        if name.isEmpty { return nil }
        self.name = name
    }
}
let dog = Animal(name: "Dog")
let somebody = Animal(name: "")

class FourLegAnimal : Animal{
    let country: String
    
    init?(name: String, country: String){
        self.country = country
        super.init(name: name)
    }
    
    required convenience init?(name: String) {
        self.init(name: name, country: "Unknown")
    }
}
let whiteTiger = FourLegAnimal(name: "Tiger", country: "Russia")

class Greeting{
    
    func say(){
        print("Hello, world")
    }
    deinit {
        print("Goodbye, world")
    }
}
var greetingMan: Greeting? = Greeting()
greetingMan!.say()
greetingMan = nil
*/

// MARK: ОПЦИОНАЛЬНАЯ ПОСЛЕДОВАТЕЛЬНОСТЬ

/*
class Person{
    var residence: Residence?
}
class Residence{
    var numberOfRooms = 2
    func printMaxNumberOfPeople(){
        let numberOfPeople = numberOfRooms * 2
        print("Max number of people is \(numberOfPeople)")
    }
}
func printNumberOfRooms(by person: Person){
    if let number = person.residence?.numberOfRooms{
        print("Number of rooms is \(number)")
    } else {
        print("Cannot access to number of rooms")
    }
}
let person = Person()
if (person.residence?.numberOfRooms = 3) == nil{
    print("Cannot set number of rooms")
}
if person.residence?.printMaxNumberOfPeople() == nil{
    print("Cannot print number of people")
}
printNumberOfRooms(by: person)
person.residence = Residence()
printNumberOfRooms(by: person)
*/

// MARK: ОБРАБОТКА ОШИБОК

/*
enum VenderMachineError: Error {
    case invalidSelection
    case insufficientFounds(coinsNeeded: Int)
    case outOfStocks
}
func buySomeFood(withDeposit deposit: Int, foodName: String) throws -> Int{
    let foodCost = [
        "Banana" : 55,
        "Lemon Juice" : 30,
        "Chocolate" : 73
    ]
    guard let cost = foodCost[foodName] else {
        throw VenderMachineError.invalidSelection
    }
    let change = deposit - cost
    guard change >= 0 else {
        throw VenderMachineError.insufficientFounds(coinsNeeded: -change)
    }
    return change
}
do{
    let change = try buySomeFood(withDeposit: 3, foodName: "Banana")
    print("I have alredy bought the banana and I still have \(change) couns")
} catch VenderMachineError.insufficientFounds(let coinsNeeded) where coinsNeeded > 1{
    print("Insufficient Founds: \(coinsNeeded)")
} catch is VenderMachineError {
    print("Another Vender Machine Errror was accured")
} catch {
    print("Another errror was accured")
}

let change1 = try? buySomeFood(withDeposit: 17, foodName: "Chocolate")
let change2 = try! buySomeFood(withDeposit: 1_000_000, foodName: "Banana")

func bigPurshase() throws {
    defer {
        print("Buing process is finished")
    }
    
    var balance = 1000
    let productsList = [ "Banana" : 12, "Lemon Juice" : 5, "Chocolate": 10 ]
    
    for (productName, count) in productsList{
        for _ in 1...count{
            balance = try buySomeFood(withDeposit: balance, foodName: productName)
            print("Buy one \(productName)")
        }
    }
}
try? bigPurshase()
*/

// MARK: ПРИВЕДЕНИЕ ТИПОВ

/*
class MediaItem{
    let name: String
    init(name: String){
        self.name = name
    }
}
class Song: MediaItem{
    let artist: String
    init(name: String, artist: String){
        self.artist = artist
        super.init(name: name)
    }
}
class Movie: MediaItem{
    let director: String
    init(name: String, director: String){
        self.director = director
        super.init(name: name)
    }
}
let mediaLibrary = [
    Song(name: "song1", artist: "artist1"),
    Song(name: "song2", artist: "artist2"),
    Song(name: "song3", artist: "artist1"),
    Movie(name: "movie1", director: "director1"),
    Movie(name: "movie2", director: "director2"),
]

var songCount = 0, movieCount = 0
for mediaItem in mediaLibrary{
    if(mediaItem is Song){
        songCount += 1
    } else if (mediaItem is Movie){
        movieCount += 1
    }
}
print("Song count: \(songCount)")
print("Movie count: \(movieCount)")
for mediaItem in mediaLibrary{
    if let movie = mediaItem as? Movie{
        print("Movie \"\(movie.name)\", dir. \(movie.director)")
    } else if let song = mediaItem as? Song{
        print("Song \"\(song.name)\" by \(song.artist)")
    }
}
*/

// MARK: РАСШИРЕНИЯ

/*
extension Double{
    var m: Double { return self }
    var km: Double { return self * 1000 }
}
print("\(1) km - it's a \(1.km) m")
*/

// MARK: ПРОТОКОЛЫ

/*
protocol FullNamed: AnyObject{
    var fullName: String { get }
    func greet()
    init(name: String)
}
class Person: FullNamed{
    var fullName: String = "Unknown"
    func greet() {
        print("Hello, my name is \(fullName)")
    }
    required init(name: String){
        self.fullName = name
    }
}

protocol Togglable{
    mutating func toggle()
}
enum SwitchButton: Togglable{
    case on, off
    mutating func toggle() {
        if(self == .on){
            self = .off
        } else {
            self = .on
        }
    }
}

struct Vector3D: Equatable{
    var x = 0
    var y = 0
    var z = 0
}
let firstVector = Vector3D(x: 2, y: -2, z: 9)
let secondVector = Vector3D(x: 6, y: 5, z: -5)
firstVector == secondVector

extension Vector3D: Hashable { }
var vectorSet : Set<Vector3D> = []
vectorSet.insert(firstVector)

enum Level: Comparable{
    case beginner
    case intermediate
    case expert(level: Int)
}
Level.beginner < .intermediate

class SuperToggle: Togglable, FullNamed{
    var isOn = false
    var fullName: String
    
    required init(name: String) {
        self.fullName = name
    }
    func toggle() {
        isOn = !isOn
    }
    func greet() {
        if(isOn){
            print("Hi, I'm \(fullName)")
        }
    }
}
func someStrangeFunc(toggle: Togglable & FullNamed){
    toggle.greet()
    print(toggle.funcWithDefaultDef())
}
let superToggle = SuperToggle(name: "Click")
superToggle.toggle()
someStrangeFunc(toggle: superToggle)

extension FullNamed{
    var prettyName: String {
        return "*" + fullName + "*"
    }
    func funcWithDefaultDef() -> String {
        return "Be happy"
    }
}
*/

// MARK: УНИВЕРСАЛЬНЫЕ ШАБЛОНЫ

/*
func swapTwoValues<T>(first a: inout T, second b: inout T){
    let alsoA = a
    a = b
    b = alsoA
}
var strVal1 = "Hi", strVal2 = "Aloha"
swapTwoValues(first: &strVal1, second: &strVal2)
print("'\(strVal1)' can be translate as '\(strVal2)'")

struct Stack<T: Equatable>{
    var arr = [T]()
    mutating func pop() -> T{
        return arr.removeLast()
    }
    mutating func push(item: T){
        arr.append(item)
    }
}
extension Stack{
    var topItem: T? {
        return arr.last
    }
    func isTop(item: T) -> Bool{
        return self.topItem == item
    }
}
var simpleStack = Stack<String>()
simpleStack.push(item: "Hello")
simpleStack.push(item: "world")
simpleStack.pop()
simpleStack.isTop(item: "Hello")

protocol Container{
    associatedtype Item
    
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(index: Int) -> Item { get }
}

extension Stack: Container{
    var count: Int {
        return arr.count
    }
    mutating func append(_ item: T) {
        self.push(item: item)
    }
    subscript(index: Int) -> T {
        return arr[index]
    }
}

protocol SuffixableContainer: Container{
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    
    func suffix(elementsCount size: Int) -> Suffix
}

func allItemsMatch<C1: Container, C2: Container>
(_ someContainer: C1, _ anotherContainer: C2) -> Bool
where C1.Item == C2.Item,
      C1.Item: Equatable{
    
    //реализация
    return false
}

extension Container where Item: Equatable{
    func startsWith(_ item: Item) -> Bool{
        return count >= 1 && self[0] == item
    }
}
extension Array : Container { }
if [9, 8, 7].startsWith(9){
    print("First Wow!")
}

extension Container{
    func endsWith(_ item: Item) -> Bool where Item == Int {
        return count >= 1 && self[count-1] == item
    }
}
if [9, 8, 7].endsWith(7){
    print("Second Wow!")
}
*/

// MARK: ARC (Automatic Reference Count)

/*
class Person{
    let name: String
    var apartments: Apartments?
    var creditCard: CreditCard?
    init(name: String){
        self.name = name
    }
    deinit {
        print("Deinitializing person with name '\(name)'")
    }
}
class Apartments{
    weak var person: Person?
    deinit {
        print("Deinitializing apartments")
    }
}
var anna: Person? = Person(name: "Anna")
var apartments: Apartments? = Apartments()
anna!.apartments = apartments
apartments!.person = anna
anna = nil
apartments = nil

class CreditCard{
    unowned let owner: Person
    init(owner: Person){
        self.owner = owner
    }
    deinit {
        print("Deinitializing credit card")
    }
}
var mrSmith: Person? = Person(name: "Smith")
mrSmith!.creditCard = CreditCard(owner: mrSmith!)
mrSmith = nil

class HTMLElement{
    let name: String
    var text: String?
    init(name: String, text: String? = nil){
        self.name = name
        self.text = text
    }
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\\\(self.name)> \(text) <\\\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    deinit {
        print("Deinit HTML element")
    }
}
var htmlElement: HTMLElement? = HTMLElement(name: "body", text: "Hello, world!")
print(htmlElement!.asHTML())
htmlElement = nil
*/

// MARK: БЕЗОПАСНОСТЬ ХРАНЕНИЯ

/*
var stepSize = 1
func increment(_ value: inout Int){
    value += stepSize
}
//increment(&stepSize)
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
stepSize = copyOfStepSize

struct FruitStorage{
    var fruitCount = 0
    mutating func transportFruits(to anotherStorage: inout FruitStorage, count: Int){
        self.fruitCount -= count
        anotherStorage.fruitCount += count
    }
}
var fruitStorage = FruitStorage(fruitCount: 10)
//fruitStorage.transportFruits(to: &fruitStorage, count: 7)

func balance(_ firstValue: inout Int, _ secondValue: inout Int){
    let sum = firstValue + secondValue
    let half = sum / 2
    firstValue = half
    secondValue = sum - half
}
var playerInfo = (healt: 7, energy: 9)
balance(&playerInfo.healt, &playerInfo.energy)
*/

// MARK: КОНТРОЛЬ ДОСТУПА

/*
open class SomeOpenClass {
    var someInternalVar: String?
}
public class SomePublicClass {
    var someInternalVar: String?
    fileprivate func somePrivateFoo(){}
}
internal class SomeInternalClass {
    var someInternalVar: String?
}
class AnotherInternalClass {
    var someInternalVar: String?
}
fileprivate class SomeFileprivateClass {
    var someFileprivateVar: String?
}
private class SomePrivateClass {
    var somePrivateVar: String?
}

private func someFunction(firstArg: SomeInternalClass) -> (SomePrivateClass, SomeFileprivateClass){
    return (SomePrivateClass(), SomeFileprivateClass())
}

public enum SomePublicEnum{
    case somePublicCase
    case anotherPublicCase
}
class ChildClass : SomePublicClass{
    override internal func somePrivateFoo(){print()}
}
private var privateInstance = SomePrivateClass()

public struct SomePublicStruct{
    public private(set) var numberOfEdits = 0
    public var value = "" {
        didSet{
            numberOfEdits += 1
        }
    }
}
public protocol SomePublicProtocol{
    var publicVar: String { get set }
    func publicFoo()
}
private extension SomePublicClass{
    var newPrivateVar: String{
        return someInternalVar ?? ""
    }
}
private typealias AliasPublicClass = SomePublicClass
*/

// MARK: ОПЕРАТОРЫ

/*
precedencegroup CustomPrecedence{
    higherThan: MultiplicationPrecedence
}

prefix operator +++
infix operator +- : CustomPrecedence
struct Vector2D{
    var x: Int
    var y: Int
    
    static func + (left: Vector2D, right: Vector2D) -> Vector2D{
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    static prefix func - (value: Vector2D) -> Vector2D{
        return Vector2D(x: -value.x, y: -value.y)
    }
    static func += (left: inout Vector2D, right: Vector2D){
        left = left + right
    }
    static prefix func +++ (value: inout Vector2D) -> Vector2D{
        value += value
        return value
    }
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D{
        return Vector2D(x: left.x + right.x, y: left.x - right.y)
    }
    
    func toString() -> String{
        return "(\(x),\(y))"
    }
}
extension Vector2D: Equatable{
    static func == (left: Vector2D, right: Vector2D) -> Bool{
        return (left.x == right.x) && (left.y == right.y)
    }
}
var firstVector = Vector2D(x: 3, y: 9)
var secondVector = Vector2D(x: 12, y: -4)

+++firstVector
print(firstVector.toString())
print((firstVector +- secondVector).toString())
*/

// MARK: ФУНКЦИОНАЛЬНОЕ ПРОГРАММИРОВАНИЕ

/*
var numericArr = [1, 2, nil, 3, 4, 5, 6, 7, nil, nil, 8, 9]
let increasedArr = numericArr.map { element in
    return element != nil ? element! + 1 : element
}
let withoutNillArr = numericArr.compactMap { $0 }

let reducedArr = withoutNillArr.reduce(into: [Int : String]() ) { result, element in
    result[element] = "\(element)"
}
var sum = 0
reducedArr.forEach { (key, _) in
    sum += key
}
let bigNumbers = withoutNillArr.filter{ $0 > 5 }
 */
