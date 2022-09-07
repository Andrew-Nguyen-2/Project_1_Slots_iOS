//
//  AnimationModifier.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/7/22.
//

import SwiftUI

struct AnimationRunningObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {
    
    var animatableData: Value {
        didSet {
            notifyStillRunning()
        }
    }
    
    private var targetValue: Value
    private var running: () -> Void
    
    init(observedValue: Value, running: @escaping () -> Void) {
        self.running = running
        self.animatableData = observedValue
        targetValue = observedValue
    }
    
    private func notifyStillRunning() {
        guard animatableData != targetValue else { return }
        
        DispatchQueue.main.async {
            self.running()
        }
    }
    
    func body(content: Content) -> some View {
        return content
    }
}

struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {
    
    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }
    
    private var targetValue: Value
    private var completion: () -> Void
    
    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }
    
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }

        DispatchQueue.main.async {
            self.completion()
        }
    }
    
    func body(content: Content) -> some View {
        return content
    }
}

extension View {
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
    func onAnimationRunning<Value: VectorArithmetic>(for value: Value, running: @escaping () -> Void) ->
        ModifiedContent<Self, AnimationRunningObserverModifier<Value>> {
        return modifier(AnimationRunningObserverModifier(observedValue: value, running: running))
    }
}
