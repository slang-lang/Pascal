
// library imports
import System.Collections.Vector;

// project imports


public object StackFrame extends SymbolTable {
    public void Constructor( string name, SymbolTable parent = null ) {
        base.Constructor( name, parent );
    }
}


public object CallStack {
    public void Constructor() {
        mFrames = new Vector<StackFrame>();
    }

    public StackFrame peek() {
        return mFrames.last();
    }

    public void popFrame() modify {
        mFrames.pop_back();
    }

    public void pushFrame( StackFrame frame ) modify {
        mFrames.push_back( frame );
    }

    private Vector<StackFrame> mFrames;
}
