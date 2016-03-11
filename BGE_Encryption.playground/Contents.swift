//: Playground - noun: a place where people can play

import UIKit

func bgeEncryption(sentance: String) -> String {
	
	let arrStr = sentance.lowercaseString
		.componentsSeparatedByCharactersInSet(NSCharacterSet.punctuationCharacterSet()) /** remove punctuation */
		.joinWithSeparator("") /** recombine into string */
		.componentsSeparatedByString(" ") /** array of words */
		.filter({
			$0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
				.isEmpty == false }) /** remove whitespaces */
		.map({ Array($0.characters) }) /** make an array of an array of single length characters */
	if let key = arrStr.first where arrStr.count >= 2 {
		return arrStr[1..<arrStr.count]
			.reduce("", combine: {
				return $0 + ($1.count >= key.count ? String($1[key.count - 1]) : " " )
			})
	}
	return ""
}

// MARK: - Test Cases
let blank = ("", "")
bgeEncryption(blank.0)
blank.1

let keyOnly = ("dog", "")
bgeEncryption(keyOnly.0)
keyOnly.1

let animals = ("The affected animals adventure everywhere.", "five")
bgeEncryption(animals.0)
animals.1

let dogs = ("Dogs fight able abolish acclaim famous is airwaves favor diary darling handbag.", "hello world")
bgeEncryption(dogs.0)
dogs.1

let halos = ("Four hazy halos abduct an aligned abhors rafters on rabid rants.", "you got it")
bgeEncryption(halos.0)
halos.1

let mine = ("the abTasdf iohfrh msityj dssjyjt s triwefwewee poswefwef vf mymeee okygh er pocnbn meo qwd mue", "This is my code")

bgeEncryption(mine.0)
mine.1
