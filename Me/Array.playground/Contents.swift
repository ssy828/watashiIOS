//: Playground - noun: a place where people can play

import Foundation

var list: [Int] = [ ]
var count: Int = list.count // 배열이름 리스트가 카운트를 사용하겠다.
print("list의 엘리먼트 개수:",count)
list.append(3) //추가한다.

count = list.count
print("list의 엘리먼트 개수:",count)
list.append(contentsOf: [1,2])
// var list2: [Int] = [1,2,3]
// list.append(contentsOf: list2)  
// 위의 식도 가능!

print(list[0])

print(list[0])
list.insert(4, at: 0 ) // at: 몇번째 배열에 저장하겠다
print(list)
list.remove(at: 0)
print(list[0])



