import Foundation

var str = "It is a truth, universally acknowledged, that a single man in possession of a good fortune must be in want of a wife."

let sequenceLength = 2

// 1. Split the string


/**
 This function takes a string, and breaks it up into every sequence of length: elementLength
 
 e.g., for str "abcde" and elementLength==1 -> ["a","b","c","d","e"]
 
 for str "abcde" and elementLength==2 -> ["ab","bc","cd","de"]
 */
func splitString(str: String, elementLength: Int) -> [String] {
    
    let strArr = str.characters.map {String($0)}
    
    guard 1 != elementLength else {
        return strArr
    }
    
    var outputArr = [String]()
    
    for i in 0 ..< (strArr.count - (elementLength - 1)) {
        
        var newElement = [String]()
        
        for j in i ..< (i + elementLength) {
            
            newElement.append(strArr[j])
            
        }
        
        outputArr.append(newElement.joined())
    }
    
    return outputArr
}

let test = splitString(str: str, elementLength: sequenceLength)


/**
 Example:
 ["h","e","l","l","o"] -> ["h":1, "e":1, "l":2, "o":1]
 */
func hashSequence(arr: [String]) -> [String:Int] {
    
    var outputDict = [String:Int]()
    
    for element in arr {
        
        if nil == outputDict[element] {
            outputDict[element] = 1
        } else {
            outputDict[element]! += 1
        }
        
    }
    
    return outputDict
}


let sampleHash = hashSequence(arr: test)

let len = 2
let sample = "hello, world"

/**
 This provides a convenience method on String to return a String representing the first n characters of self.
 
 E.g., "hello".firstNCharacters(4) -> "hell"
 
 If n > string.characters.count, will return the whole string rather than an error.
 */
extension String {
    func firstNCharacters(_ n: Int) -> String {
        
        let c = self.characters.count
        if n >= c {
            return self
        } else {
            
            let index = self.index( self.startIndex, offsetBy: n)
            return self.substring(to: index)
            
        }
 
    }
}

/**
 Example:
 ```
 ["aa":1, "ab":2, "bb":3],"a" -> ["aa":1, "ab":2]
 ```
 */
func eligibleComponents(dataset: [String:Int], componentSoFar: String) -> [String:Int] {
    
    let lengthSoFar = componentSoFar.characters.count
    
 
    let tuples = dataset.filter {(key, value) in
        key.firstNCharacters(lengthSoFar) == componentSoFar
    }
 
    // there should be a good way to convert an array of the form [(key: x, value: y), (key: x, value: y), ...] to a dictionary of the form [x:y]
    // but I can't find it, so in the meantime, we'll do a loop
    var outputDict = [String:Int]()
    for (key, value) in tuples {
        outputDict[key] = value
 
    }
    return outputDict
}


/**
 Example:
 ```
 ["aa":0, "ab":2, "ba":3, "bb":4] -> [2:"ab",6:"bb",9:"ba"]
 ```
 */
func makeCumulativeDictionary(dict: [String:Int]) -> [Int:String] {
    var outputDict = [Int:String]()
    var cumulativeValue = 0
    for (key, value) in dict {
        guard value != 0 else {
            continue
        }
        cumulativeValue += value
        outputDict[cumulativeValue] = key
    }
    return outputDict
    
}


/**
 Because we are working exclusively with non-zero quantities of values, the pick value can be between 1 and the max value in the cumulative dictionary (inclusive)
 
 Example:
 ```
 [2:"ab",6:"bb",9:"ba"], 7 -> "ba"
 */
func pickFromCumulativeDictionary(dict: [Int:String], value: Int) -> String {
    
    // USE ARRAY OF TUPLES INSTEAD OF DICTS?
    
}




func nextComponent(dataset: [String:Int], componentSoFar: String) -> String {
    
    let lengthSoFar = componentSoFar.characters.count
    
    var total = 0
    
    for (key, value) in dataset {
        total += value
    }
    
    return ""
    
}
