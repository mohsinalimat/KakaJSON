//
//  JTM_03_ModelArray.swift
//  KakaJSONTests
//
//  Created by MJ Lee on 2019/8/10.
//  Copyright © 2019 MJ Lee. All rights reserved.
//

class JTM_03_ModelArray: XCTestCase {
    let tuples = [
        (name: "BMW", price: 100.0),
        (name: "Audi", price: 70.0),
        (name: "Bently", price: 300.0)
    ]
    
    struct SCar: Convertible {
        var name: String = ""
        var price: Double = 0.0
    }
    
    func testArray() {
        let JSON: [[String: Any]] = [
            ["name": tuples[0].name, "price": tuples[0].price],
            ["name": tuples[1].name, "price": tuples[1].price],
            ["name": tuples[2].name, "price": tuples[2].price]
        ]
        
        let cars = JSON.kk.modelArray(SCar.self)
        check(cars)
    }
    
    func testNSArray() {
        let JSON = NSArray(objects:
            ["name": tuples[0].name, "price": tuples[0].price],
            ["name": tuples[1].name, "price": tuples[1].price],
            ["name": tuples[2].name, "price": tuples[2].price]
        )
        
        let cars = JSON.kk.modelArray(SCar.self)
        check(cars)
    }
    
    func testNSMutableArray() {
        let JSON = NSMutableArray(objects:
            ["name": tuples[0].name, "price": tuples[0].price],
            ["name": tuples[1].name, "price": tuples[1].price],
            ["name": tuples[2].name, "price": tuples[2].price]
        )
        
        let cars = JSON.kk.modelArray(SCar.self)
        check(cars)
    }
    
    func testSet() {
        // NSSet\NSMutableSet
        let JSON: Set<NSDictionary> = [
            ["name": tuples[0].name, "price": tuples[0].price]
        ]
        
        let cars = JSON.kk.modelArray(SCar.self)
        XCTAssert(cars?[0].name == tuples[0].name)
        XCTAssert(cars?[0].price == tuples[0].price)
    }
    
    func testJSONString() {
        let JSONString = """
        [
            {"name":"\(tuples[0].name)","price":\(tuples[0].price)},
            {"name":"\(tuples[1].name)","price":\(tuples[1].price)},
            {"name":"\(tuples[2].name)","price":\(tuples[2].price)}
        ]
        """
        
        let cars = JSONString.kk.modelArray(SCar.self)
        check(cars)
    }
    
    func check(_ cars: [SCar]?) {
        XCTAssert(cars?.count == tuples.count)
        XCTAssert(cars?[0].name == tuples[0].name)
        XCTAssert(cars?[0].price == tuples[0].price)
        XCTAssert(cars?[1].name == tuples[1].name)
        XCTAssert(cars?[1].price == tuples[1].price)
        XCTAssert(cars?[2].name == tuples[2].name)
        XCTAssert(cars?[2].price == tuples[2].price)
    }
}
