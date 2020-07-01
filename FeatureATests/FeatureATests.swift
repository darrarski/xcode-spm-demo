import XCTest
@testable import FeatureA
import ComposableArchitecture
import RxSwift

final class FeatureATests: XCTestCase {

    func testGreeting() throws {
        let greetingSubject = PublishSubject<String>()
        let store = TestStore(
            initialState: FeatureAState(text: nil),
            reducer: featureAReducer,
            environment: FeatureAEnvironment(
                greeting: { greetingSubject.asObservable() }
            )
        )

        store.assert(
            .send(.greet),
            .do {
                greetingSubject.onNext("TEST")
                greetingSubject.onCompleted()
            },
            .receive(.didGreet("TEST")) {
                $0.text = "TEST"
            }
        )
    }

}
