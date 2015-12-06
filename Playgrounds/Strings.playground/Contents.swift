//: Playground - noun: a place where people can play


import UIKit

let x:NSString = "😡"
x.length

let y = "😡"
y.characters.count


let eAcute:NSString = "\u{E9}"                         // é
eAcute.length

let combinedEAcute:NSString = "\u{65}\u{301}"
combinedEAcute.length

let url = NSURL(string: "https://en.wikipedia.org/wiki/Elliott_Fitch_Shepard")

url?.scheme
url?.path

/*

[
{
name: "Ученый кот",
badge: ["iOS", "Swift"]
avatar: "http://cat"
},
{
name: "Собака",
badge: ["iOS"],
avatar: "http://cat"
}
]

*/

//let data = NSData(contentsOfURL: url!)
//
//NSString(data: data!, encoding: NSUTF8StringEncoding)

