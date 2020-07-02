import Combine
import ComposableArchitecture
import RxCombine
import RxSwift
import Firebase

public struct FeatureAState: Equatable {
    public init(
        text: String? = nil
    ) {
        self.text = text
    }

    public var text: String?
}

public enum FeatureAAction: Equatable {
    case greet
    case didGreet(String)
}

public struct FeatureAEnvironment {
    public init(greeting: @escaping () -> Observable<String>) {
        self.greeting = greeting
    }

    public var greeting: () -> Observable<String>
}

public let featureAReducer = Reducer<FeatureAState, FeatureAAction, FeatureAEnvironment> { state, action, env in
    switch action {
    case .greet:
        return env.greeting()
            .asPublisher()
            .catch { _ in Empty(completeImmediately: true) }
            .map(FeatureAAction.didGreet)
            .eraseToEffect()

    case .didGreet(let text):
        state.text = text
        return .none
    }
}
