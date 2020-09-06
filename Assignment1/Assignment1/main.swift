//
//  main.swift
//  Assignment1
//
//  Created by İbrahim Doğan on 4.05.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import Foundation

class Book {
    var title: String
    var isbn: Int
    var price: Double
    
    init(title: String){
        self.title = title
        self.isbn = Int.random(in: 1000000000 ..< 10000000000)
        self.price = ((Double.random(in: 10 ..< 100)) * 1000).rounded() / 1000
    }
}

class Library {
    var name: String
    var address: String
    var bookList: [Book] = []

    init(name: String, address: String){
        self.name = name
        self.address = address
    }
    
    func cheapest() -> Double {
        var temp = bookList[0].price
        for book in bookList{
            if book.price < temp{
                temp = book.price
            }
        }
        return temp
    }
    
    func mostExpensive() -> Double {
        var temp = bookList[0].price
        for book in bookList{
            if book.price > temp{
                temp = book.price
            }
        }
        return temp
    }
    
    func allBooks(){
        for book in bookList{
            print("Title: \(book.title), ISBN: \(book.isbn), Price: \(book.price)")
        }
    }
    
    func searchBook(str: String) -> Int{
        var result = -1
        for book in bookList{
            if book.title.contains(str){
                print("Title: \(book.title), ISBN: \(book.isbn), Price: \(book.price)")
                result = 1
            }
        }
        return result
    }
    
}
print("Library name:")
var name = readLine()

print("Library Address:")
var address = readLine()


var myLibrary = Library(name: name!, address:address!)

print(myLibrary.name, myLibrary.address)

var bookList: [Book] = []

print("How many book you have:")
if let typed = readLine() {
  if let totalBooks = Int(typed) {
    for _ in 1...totalBooks {
        print("Book name:")
        let title = readLine()
        let book = Book(title: title!)
          bookList.append(book)
    }
  }
}
myLibrary.bookList = bookList

print("\n###############################")
print("Cheapest Book:",myLibrary.cheapest())
print("Most Expensive Book:",myLibrary.mostExpensive())
print("\n###############################")
print("All Books in the Library:")
myLibrary.allBooks()

//To search a book input: 1
//To add a book input: 2
//To print book list input: 3
//To display the menu input: 4
//To exit input: 5
print("\n###############################\n")
print("To search a book input: 1")
print("To add a book input: 2")
print("To print book list input: 3")
print("To display the menu input: 4")
print("To exit input: 5")

while true{
    
    
    print("Input: ")
    
    if let typed = readLine() {
    if let input = Int(typed) {
        
        if input == 1 {
            print("What is your search word:")
            let keyword = readLine()
            let search = myLibrary.searchBook(str: keyword!)
            if search == -1 {
                print("No books found :(")
            }
        }
        
        if input == 2 {
            print("Book name:")
            let title = readLine()
            let book = Book(title: title!)
            myLibrary.bookList.append(book)
            
            print("Book added!")
            print("Title: \(book.title), ISBN: \(book.isbn), Price: \(book.price)")

        }
        
        if input == 3 {
            print("All Books in the Library:")
            myLibrary.allBooks()
        }
        
        if input == 4  {
            print("To search a book input: 1")
            print("To add a book input: 2")
            print("To print book list input: 3")
            print("To display the menu input: 4")
            print("To exit input: 5")
        }
        
        
        if input == 5 {
            break
        }
        
        
        }
    }
    
}

print("bye bye")
