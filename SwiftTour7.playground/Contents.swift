//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum PrinterError : ErrorType {
    case OutOfPaper
    case NoToner
    case OnFire
}

func sendToPrinter(printerName: String) throws -> String {
    if printerName == "NoToner" {
        throw PrinterError.NoToner
    }else if printerName == "NoPaper" {
        throw PrinterError.OutOfPaper
    }else if printerName == "OnFire" {
        throw PrinterError.OnFire
    }
    
    return "Job sent"
}

do {
    let resp = try sendToPrinter("NoToner")
    print(resp)
}catch {
    print(error)
}

do {
    let resp = try sendToPrinter("NoPaper")
    print(resp)
}catch PrinterError.OutOfPaper {
    print("NoPaper")
}catch PrinterError.NoToner {
    print("NoToner")
}catch {
    print(error)
}

let printerSuccess = try? sendToPrinter("Good")
let printerFailure = try? sendToPrinter("NoPaper")


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(itemName: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(itemName)
    return result
}

fridgeContains("Bananer")
print(fridgeIsOpen)


