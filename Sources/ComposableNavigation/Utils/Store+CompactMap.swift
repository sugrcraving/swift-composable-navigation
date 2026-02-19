import ComposableArchitecture

public extension Store where State: Equatable {
	func compactMap<NonOptionalState, Unwrapped>(
		_ transform: (Store<NonOptionalState, Action>) -> Unwrapped
	) -> Unwrapped? where State == NonOptionalState? {
        guard let _ = withState({ $0 }) else {
            return nil
        }
        
        return transform(
            scope(
                state: \.unsafelyUnwrapped,
                action: \.self
            )
        )
	}
}
