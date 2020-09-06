func sumOfOdd(intArray: [Int]) -> Int{
    var sum = 0
    for number in intArray{
        if number % 2 == 1 {
            sum += number
        }
    }
    return sum
}

var intArray = [10,11,12,13,14,15,16]
var intArray2 = [1,2,3,4,5,6,7]

print(sumOfOdd(intArray: intArray))
print(sumOfOdd(intArray: intArray2))



