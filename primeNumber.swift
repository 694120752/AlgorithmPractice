import Foundation
//标题：素数之积 | 时间限制：1秒 | 内存限制：262144K | 语言限制：不限
//RSA加密算法在网络安全世界中无处不在，它利用了极大整数因数分解的困难度，数据越大，安全系数越高，给定一个32位正整数，请对其进行因数分解，找出是哪两个素数的乘积。
//输入描述:
//一个正整数num
//
//0 < num <= 2147483647
//
//输出描述:
//如果成功找到，以单个空格分割，从小到大输出两个素数，分解失败，请输出-1 -1
//
//示例1
//输入
//15
//输出
//3 5
//说明
//因数分解后，找到两个素数3和5，使得3*5=15，按从小到大排列后，输出3 5
//
//示例2
//输入
//27
//输出
//-1 -1
//说明
//通过因数分解，找不到任何素数，使得他们的乘积为27，输出-1 -1

if let inputNumStr = readLine() {
    // 前置知识 ：一个数m的因数 要么在根号m内 要么有一个在根号m外
    var inputNum = Int(inputNumStr) ?? 0
    if inputNum < 4 {
        print(-1, separator: "", terminator: " ")
        print(-1, separator: "", terminator: " ")
    } else {
        var resultArr:Array<Int> = []
        var num = 2
        repeat {
            if (inputNum % num == 0) && isPrimeNumber(num) { // 找到了一个质因数
                resultArr.append(num)
                inputNum = inputNum / num
                num = 2
                break
            }
            num += 1
        } while (num * num <= inputNum)
        if inputNum != 1 {
            resultArr.append(inputNum)
        }
        if resultArr.count == 2 {
            print(resultArr.first!, separator: "", terminator: " ")
            print(resultArr.last!, separator: "", terminator: " ")
        } else {
            print(-1, separator: "", terminator: " ")
            print(-1, separator: "", terminator: " ")
        }
    }
}

func isPrimeNumber(_ num:Int) -> Bool {
    for i in 2..<num {
        if num % i == 0{
            return false
        }
    }
    return true
}
