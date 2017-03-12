//: Playground - noun: a place where people can play

import AVFoundation


let voices = AVSpeechSynthesisVoice.speechVoices()
    .map { voice in
        (voice.identifier, voice.name, voice.language)
    }
    .filter { id, name, lang in
        (lang.hasPrefix("en") || lang.hasPrefix("ru"))
    }
    .map { id, name, lang in
        "[\(lang)] – \(name) - \(id)"
    }


func f(id: String, name: String, lang: String) -> String {
    2735
    return "[\(lang)] – \(name) - \(id)"
}

// com.apple.ttsbundle.Karen-compact
