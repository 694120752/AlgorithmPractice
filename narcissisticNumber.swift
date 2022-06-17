import Darwin
///*
//给定非空字符串s，将该字符串分割成一些子串，使每个子串的ASCII码值的和均为水仙花数。
//1、若分割不成功，则返回0
//2、若分割成功且分割结果不唯一，则返回-1
//3、若分割成功且分割结果唯一，则返回分割后子串的数目
//371 = 3^3 + 7^3 + 1^3
//*/
///**
//* 既然是水仙花数，那么每个分割的的字串，都必须是水仙花数
//* 将字符串转化为ASCII码值数组
//* 字串是连续的，因此连续取字符，直到是水仙花数，如果取完了还不符合，则不是
//* f3@d5a8  -1 多种分割方式
//* AXdddF 2 一种分割方式，分割次数2
//* abc 0不符合
//*/

func isFlower(_ num:Int) ->Bool {
    if (num < 100 || num > 999) {
        return false
    }
    let digit = num % 10
    let tenDigit = Int(num/10) % 10
    let hunderDigit = Int(num/100)
    if num == Int((pow(Float(digit), 3) + pow(Float(tenDigit), 3) + pow(Float(hunderDigit), 3)))
    {
        return true
    }
    return false
}

// 将字符拆分
func spliteStringToArmStrongNumber(_ str:String){
    if str.count <= 0 {
        return // 字符串切割完了
    }
    // ascii 值
    var currentAsciiValue = 0
    // 当前的string里的index
    var stringIndex = 0
    for subStr in str {
        currentAsciiValue += Int(Character(String(subStr)).asciiValue ?? 0)
        if isFlower(currentAsciiValue) {  // 找到了
            // 把找到的塞进去
            let findStr = str[str.startIndex...str.index(str.startIndex, offsetBy: stringIndex)]
            spliteArr.append(String(findStr))
            var nextIndex = stringIndex + 1
            if nextIndex >= str.count  //越界了
            {
                nextIndex = str.count - 1
            }
            let nextRoundStr = str[str.index(str.startIndex, offsetBy: nextIndex) ..< str.endIndex]
            spliteStringToArmStrongNumber(String(nextRoundStr))
        }
        stringIndex += 1
    }
}

// 分割好的 符合水仙花要求的子字符串
var spliteArr:Array<String> = []
if let inputString = readLine() {
    // 收到了输入的字符
    spliteStringToArmStrongNumber(inputString)
    var totalString = ""
    for subString in spliteArr {
        totalString += subString
    }
    let fullStringArr = totalString.components(separatedBy: inputString)
    let result = fullStringArr.count - 1
    if result > 1 { // 解不唯一
        print(-1)
    } else if result == 0 { // 分割失败
        print(0)
    } else {
        print(spliteArr.count)
    }  
}
