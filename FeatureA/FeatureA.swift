import ComposableArchitecture

public struct FeatureAState {
    public init() {}
}

public enum FeatureAAction {}

public struct FeatureAEnvironment {
    public init() {}
}

public let featureAReducer = Reducer<FeatureAState, FeatureAAction, FeatureAEnvironment>.empty
