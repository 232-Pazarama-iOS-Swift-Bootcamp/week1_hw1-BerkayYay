//
//  main.swift
//  Homework-1
//
//  Created by Berkay YAY on 25.09.2022.
//

import Foundation

// -MARK: Kullanici
// Isim, cinsiyet, yas, meslek girilecek
class User {
    var name: String?
    var gender: String?
    var age: Int?
    var job: String?
    
    init(name: String, gender: String, age: Int, job: String) {
        self.name = name
        self.gender = gender
        self.age = age
        self.job = job
    }
    init(){
    }
    
    func userDetails(){
        print("User name: \(name!), Gender: \(gender!), Age: \(age!), Job: \(job!)")
    }
}

struct Product{
    var productName: String?
    var productCategory: String
    var productSupplier: String?
    var productGrade: Int?
    var comments: [String]
    
    init(productName: String,productCategory: String, productSupplier: String, productGrade: Int, comments: [String]) {
        self.productName = productName
        self.productCategory = productCategory
        self.productSupplier = productSupplier
        self.productGrade = productGrade
        self.comments = comments
    }
    
    func listProductDetails(){
        print("-----------------------------------------")
        print("Product Name: \(String(describing: productName!))")
        print("Product Supplier: \(String(describing: productSupplier!))")
        print("Product Grade: \(String(describing: productGrade!))")
        print("Product Comments: ")
        if !comments.isEmpty {
            for (comment) in comments{
                print("\(comment.description)")
                
            }
        }
        print("-----------------------------------------")
        
        
    }
}

let product1 = Product(productName: "Bow", productCategory: "Weapon", productSupplier: "Rols Weaponary", productGrade: 3, comments: ["Comment-1", "Comment-2"])
let product2 = Product(productName: "Sword", productCategory: "Weapon", productSupplier: "Rols Weaponary", productGrade: 5, comments:  ["Comment-3", "Comment-4"])
let product3 = Product(productName: "Armor", productCategory: "Clothes", productSupplier: "Smithens Armor Shop", productGrade: 2, comments: ["Comment-5", "Comment-6"])
let product4 = Product(productName: "Helmet", productCategory: "Clothes", productSupplier: "Smithens Armor Shop", productGrade: 1, comments: ["Comment-7", "Comment-8"])

print("Enter your name: ")
var name = readLine()
print("Enter your gender: ")
var gender = readLine()
print("Enter your age: ")
var age = readLine()
print("Enter your job: (Hunter, Warrior)")
var job = readLine()

var user = User()
if name != nil {
    user.name = name
}
if gender != nil {
    user.gender = gender
}
if age != nil {
    user.age = Int(age!)
}
if job != nil {
    user.job = job
}

var basket: [Product]? = []

print("WELCOME! \(user.name!)")
var input: String? = nil
var input2: String? = nil
while input != "q" {
    print("Please select a operation: ")
    print("Operations: ")
    print("1- Products")
    print("2- Basket")
    print("q- For quit")
    input = readLine()
    
    switch input{
    case "1":
        switch user.job{
        case "Hunter":
            product1.listProductDetails()
            product3.listProductDetails()
            print("Avaliable operations: ")
            print("1- Add Basket")
            print("2- Add Favorites")
            print("Back- Back to the main page")
            input2 = readLine()
            switch input2{
            case "1":
                print("Enter product name to add to basket: ")
                input2 = readLine()
                if input2 == product1.productName{
                    basket?.append(product1)
                }
                else if input2 == product3.productName{
                    basket?.append(product3)
                }
                else {
                    print("Enter valid name")
                }
            default:
                print("Choose valid operation type!")
            }
        case "Back":
            continue
        case "Warrior":
            product2.listProductDetails()
            product3.listProductDetails()
            product4.listProductDetails()
            print("Avaliable operations: ")
            print("1- Add Basket")
            print("2- Add Favorites")
            print("Back- Back to the main page")
            input2 = readLine()
            switch input2{
            case "1":
                print("Enter product name to add to basket: ")
                input2 = readLine()
                if input2 == product2.productName{
                    basket?.append(product1)
                }
                else if input2 == product3.productName{
                    basket?.append(product3)
                }
                else if input2 == product4.productName{
                    basket?.append(product4)
                }
                else {
                    print("Enter valid name")
                }
            default:
                print("Choose valid operation type!")
            }
        default:
            print("Select valid job")
        }
    case "2":
        print("My Basket: ")
        guard basket != nil else {
            break
        }
        for product in basket! {
            guard product.productName != nil else {
                break
            }
            print("\(product.productName ?? "")")
        }
    case "q":
        print("Stopping the proccess")
    default:
        print("Choose valid operation type!")
    }
    
    
}









