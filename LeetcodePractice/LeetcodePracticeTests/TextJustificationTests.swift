//
//  TextJustificationTests.swift
//  LeetcodePracticeTests
//
//  Created by Sarah Clark on 5/14/24.
//


// TODO: Try solving this hard problem later after you finish the easy and medium questions.
/*
 Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.

 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.

 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

 For the last line of text, it should be left-justified, and no extra space is inserted between words.

 Note:

 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.


 Example 1:
 Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
 Output:
 [
 "This    is    an",
 "example  of text",
 "justification.  "
 ]
 

 Example 2:
 Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
 Output:
 [
 "What   must   be",
 "acknowledgment  ",
 "shall be        "
 ]
 Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
 Note that the second line is also left-justified because it contains only one word.
 
 Example 3:
 Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
 Output:
 [
 "Science  is  what we",
 "understand      well",
 "enough to explain to",
 "a  computer.  Art is",
 "everything  else  we",
 "do                  "
 ]

 Constraints:

 1 <= words.length <= 300
 1 <= words[i].length <= 20
 words[i] consists of only English letters and symbols.
 1 <= maxWidth <= 100
 words[i].length <= maxWidth

 */

/*
 import XCTest

 final class TextJustificationTests: XCTestCase {

 class Solution {

 func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
 var result: [String] = []
 var lineWords: [String] = []
 var lineLength = 0

 for word in words {
 // Check if adding the current word to the line exceeds the maxWidth
 if lineLength + lineWords.count + word.count > maxWidth {
 // Distribute spaces between words
 let spaces = maxWidth - lineLength
 let spaceCount = lineWords.count > 1 ? lineWords.count - 1 : 1
 var extraSpaces = spaceCount > 1 ? spaces % (spaceCount - 1) : spaces
 let spacePerWord = spaceCount > 1 ? spaces / (spaceCount - 1) : spaces

 var line = ""
 for (i, w) in lineWords.enumerated() {
 line += w
 if i < lineWords.count - 1 {
 line += String(repeating: " ", count: spacePerWord)
 if extraSpaces > 0 {
 line += " "
 extraSpaces -= 1
 }
 }
 }
 // Left justify the last line if it has only one word
 if lineWords.count == 1 {
 line += String(repeating: " ", count: maxWidth - line.count)
 }
 result.append(line)

 // Reset line parameters for the next line
 lineWords = []
 lineLength = 0
 }

 // Add word to the current line
 lineWords.append(word)
 lineLength += word.count
 }

 // Process the last line
 var lastLine = lineWords.joined(separator: " ")
 lastLine += String(repeating: " ", count: maxWidth - lastLine.count)
 result.append(lastLine)

 return result
 }
 }

 func testExample1() {
 let solution = Solution()
 let words = ["This", "is", "an", "example", "of", "text", "justification."]
 let maxWidth = 16

 let justifiedString = [
 "This    is    an",
 "example  of text",
 "justification.  "
 ]

 XCTAssertEqual(solution.fullJustify(words, maxWidth), justifiedString)
 }

 func testExample2() {
 let solution = Solution()
 let words = ["What","must","be","acknowledgment","shall","be"]
 let maxWidth = 16

 let justifiedString = [
 "What   must   be",
 "acknowledgment  ",
 "shall be        "
 ]

 XCTAssertEqual(solution.fullJustify(words, maxWidth), justifiedString)
 }

 func testExample3() {
 let solution = Solution()
 let words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"]
 let maxWidth = 20

 let justifiedString = [
 "Science  is  what we",
 "understand      well",
 "enough to explain to",
 "a  computer.  Art is",
 "everything  else  we",
 "do                  "
 ]

 XCTAssertEqual(solution.fullJustify(words, maxWidth), justifiedString)
 }

 }
 */
