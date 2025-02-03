//
//  Test.swift
//  Pokedex1Gen
//
//  Created by Sebastian Cerda Fuentes on 03-02-25.
//

import Foundation
import UIKit
// lo dejo aca para los weones

class Test {
    private var testString: String
    private var testInt: Int?

    init(initString: String) {
        self.testString = initString
    }

    func testFunction(testParameter: String, secondTestParameter: Int) {
        testString = testParameter
        testInt = secondTestParameter
    }
}


class ImplementationTest: UIViewController {
    let testView = Test(initString: "Hi!")
    // testString = "Hi!"
    // testInt = Nulo

    override func viewDidLoad() {
        super.viewDidLoad()
        testView.testFunction(testParameter: "bye", secondTestParameter: 1)
        // testString = "bye"
        // testInt = 1
    }
}

