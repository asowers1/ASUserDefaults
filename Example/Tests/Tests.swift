// https://github.com/Quick/Quick

import Quick
import Nimble
import ASUserDefaults

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will save and load values into ASUserDefaults") {
            
            context("these are saving Ints and String") {
                
                ASUserDefaultsManager.sharedManager.save(100, key: "x")
                
                ASUserDefaultsManager.sharedManager.save("string",key: "string")
                
                it("can do maths") {
                    expect(ASUserDefaultsManager.sharedManager.load("x") as? Int) == 100
                }
                
                it("can read") {
                    expect(ASUserDefaultsManager.sharedManager.load("string") as? String) == "string"
                }
            }
        }
    }
}
