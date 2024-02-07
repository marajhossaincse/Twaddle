import UIKit

var greeting = "Hello, playground"

enum CustomLogger {
    static func log<Val>(_ val: Val) {
        print("Captured and printing to the log: \(val)")
    }
}

CustomLogger.log(1)
CustomLogger.log("maraj9hossain")
CustomLogger.log(Date.now)
CustomLogger.log(true)

struct Mathematics {
    static func add<T: Numeric>(_ firstVal: T, _ secondVal: T) -> T {
        firstVal + secondVal
    }
}

Mathematics.add(1, 1.5)
