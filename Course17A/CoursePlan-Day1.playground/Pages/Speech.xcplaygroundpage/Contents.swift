//: [Previous](@previous)

import Foundation

//: ## Speech

let year = 2017
let welcome = "Happy \(year)!"

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import AVFoundation

let greet = AVSpeechUtterance(string: "Hello, everyone!")
let what  = AVSpeechUtterance(string: welcome)
let who   = AVSpeechSynthesizer()

greet.pitchMultiplier    = 2.1
greet.postUtteranceDelay = 0.4

who.speak(greet)
who.speak(what)

//: [Next](@next)
