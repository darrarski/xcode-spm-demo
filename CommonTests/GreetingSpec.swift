import Quick
import Nimble
@testable import Common
import RxSwift

class GreetingSpec: QuickSpec {
    override func spec() {
        var sut: Observable<String>!

        beforeEach {
            sut = greeting
        }

        context("subscribe") {
            var elements: [String]!

            beforeEach {
                elements = []
                _ = sut.subscribe(onNext: { elements.append($0) })
            }

            it("should emit correct elements") {
                expect(elements).to(haveCount(1))
                expect(elements.first) == "Hello, World!"
            }
        }
    }
}
