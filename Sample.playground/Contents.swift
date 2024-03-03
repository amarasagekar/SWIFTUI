import UIKit

//let number = [1,2, 10, 4, 7 , 2]
//
//print(number.map({ value in
//    return value * 2
//}))
//
//// exlude optionl or  nil
//print(number.compactMap({ value in
//    return value
//}))
//
//
//
//var a = 23
//var b = 34
//
//
//func swapNum<G>(_ a: inout  G, _ b: inout G){
//    (a, b) = (b, a)
//
//}
//
//swapNum(&b, &a)
//

var str = "Hello wolrd"

func capletter(lette: String) -> String?{
    guard lette.isEmpty == false else {return nil}
    
    let result = lette.filter { ("A"..."Z").contains($0)}
    
    return result.isEmpty ? nil : result
}

print(capletter(lette: str))
