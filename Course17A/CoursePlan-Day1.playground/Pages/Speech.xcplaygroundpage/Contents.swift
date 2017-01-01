//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

str = str.replacingOccurrences(of: "playground", with: "everyone")

//: ## Speech

let year = 2017
let welcome = "Happy \(year)!"

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import AVFoundation

let greet = AVSpeechUtterance(string: str)
let what  = AVSpeechUtterance(string: welcome)
let who   = AVSpeechSynthesizer()

greet.pitchMultiplier    = 2.1
greet.postUtteranceDelay = 0.4

who.speak(greet)
who.speak(what)

//: [Next](@next)
