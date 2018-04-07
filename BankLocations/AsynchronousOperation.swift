import Foundation

class AsynchronousOperation: Operation {
    enum State: String {
        case isExecuting, isFinished
        var key: String { return rawValue }
    }
    
    let stateLock = NSLock()
    
    private var _isExecuting: Bool
    private var _isFinished: Bool
    
    override init() {
        _isExecuting = false
        _isFinished = false
        super.init()
    }
    
    override var isExecuting: Bool {
        get {
            return stateLock.withCriticalScope { _isExecuting }
        }
        set {
            willChangeValue(forKey: State.isExecuting.key)
            stateLock.withCriticalScope { _isExecuting = newValue }
            didChangeValue(forKey: State.isExecuting.key)
        }
    }
    
    override var isFinished: Bool {
        get {
            return stateLock.withCriticalScope { _isFinished }
        }
        set {
            willChangeValue(forKey: State.isFinished.key)
            stateLock.withCriticalScope { _isFinished = newValue }
            didChangeValue(forKey: State.isFinished.key)
        }
    }
    
    override func start() {
        if isCancelled { finish(); return }
        isExecuting = true
        main()
    }
    
    override func main() {
        fatalError("main() must be overriden in subclass!")
    }
    
    func finish() {
        if isExecuting { isExecuting = false }
        if !isFinished { isFinished = true }
    }
}
