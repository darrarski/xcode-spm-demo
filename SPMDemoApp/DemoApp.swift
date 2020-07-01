import ComposableArchitecture
import FeatureA
import FeatureB

public struct DemoAppState {
    public init(
        aState: FeatureAState,
        bState: FeatureBState
    ) {
        self.aState = aState
        self.bState = bState
    }

    public var aState: FeatureAState
    public var bState: FeatureBState
}

public enum DemoAppAction {
    case featureA(FeatureAAction)
    case featureB(FeatureBAction)
}

public struct DemoAppEnvironment {
    public init(
        environmentA: FeatureAEnvironment,
        environmentB: FeatureBEnvironment
    ) {
        self.environmentA = environmentA
        self.environmentB = environmentB
    }

    public var environmentA: FeatureAEnvironment
    public var environmentB: FeatureBEnvironment
}

public let demoAppReducer = Reducer<DemoAppState, DemoAppAction, DemoAppEnvironment>.combine(
    featureAReducer.pullback(
        state: \.aState,
        action: /DemoAppAction.featureA,
        environment: \.environmentA
    ),
    featureBReducer.pullback(
        state: \.bState,
        action: /DemoAppAction.featureB,
        environment: \.environmentB
    )
)
