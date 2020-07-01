import Quick
import Nimble
@testable import Common
import RxSwift
import RxBlocking

class GreetingSpec: QuickSpec {
    override func spec() {
        var sut: Observable<String>!

        beforeEach {
            sut = greeting
        }

        context("subscribe") {
            var elements: [String]!

            beforeEach {
                elements = try? sut.toBlocking().toArray()
            }

            it("should emit correct elements") {
                expect(elements).to(haveCount(1))
                expect(elements.first) == "Hello, World!"
            }
        }
    }
}
