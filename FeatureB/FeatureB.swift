import ComposableArchitecture

public struct FeatureBState {
    public init() {}
}

public enum FeatureBAction {}

public struct FeatureBEnvironment {
    public init() {}
}

public let featureBReducer = Reducer<FeatureBState, FeatureBAction, FeatureBEnvironment>.empty
