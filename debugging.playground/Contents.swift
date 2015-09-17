//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?
class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]!
        wordB = words[1]!
    }
    
//: [EXPLAIN YOUR ANSWER TO Q1 HERE]
/*An optional type is stated with a question mark, and wordA is not an optional, so it won't accept the optionals word[0] and word[1]*/

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    static func arePalindromes(words: [String]) -> Bool! {
        var reversedWords = words.map() {
            String($0.characters.reverse())
        }
        var numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//: [EXPLAIN YOUR ANSWER TO Q2 HERE]
    /*The compiler dislikes the loop b/c let initializes a constant, and i changes
    We should return true, not nil, because we are returning a strict Bool and not an optional.*/
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    static func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters : [Character : Int] = [Character: Int]()
        var lenA = wordA.characters.count
        var lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return nil
    }
}

//: [EXPLAIN YOUR ANSWER TO Q3 HERE]
/*We only declared the dictionary, we didn't initialize it.*/

//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

