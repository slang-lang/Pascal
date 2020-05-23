
// library imports
import System.Collections.Vector;

// project imports


public object StackFrame {
	public int mLevel const;
    public string mName const;
	public StackFrame mParent const;

    public void Constructor( string name, StackFrame parent = null ) {
        mLevel = parent ? parent.mLevel + 1 : 0;
        mName = name;
		mParent = parent;
		mStartIndex = parent ? parent.size() : 0;
		mSymbols = new List<Symbol>();
    }

	public Symbol at( int stackIndex ) const throws {
        //print( "at(" + stackIndex + ")" );

		if ( mParent && stackIndex < mStartIndex ) {
			return mParent.at( stackIndex );
		}

		return mSymbols.at( stackIndex - mStartIndex );
	}

	public void declare(Symbol symbol) modify throws {
		if ( mSymbols.contains(symbol) ) {
			throw new Exception("duplicate symbol '" + symbol.mName + "' declared");
		}

		//print( cast<string>( symbol ) );

		mSymbols.push_back(symbol);
	}

	public Symbol lookup(string name, bool onlyCurrentScope = false) const {
        //print( "lookup(\"" + name + "\")" );

		foreach ( Symbol sym : mSymbols ) {
			if ( sym == name ) {
				return sym;
			}
		}

		if ( mParent && !onlyCurrentScope ) {
			return mParent.lookup(name);
		}

		return Symbol null;
	}

	public int size() const {
		return mStartIndex + mSymbols.size();
	}

	private int mStartIndex;
	private List<Symbol> mSymbols;
}


public object CallStack {
    public void Constructor() {
        mFrames = new Vector<StackFrame>();
    }

    public StackFrame peek() {
        return mFrames.last();
    }

    public void popFrame() modify {
        //print( "Popping stack frame" );

        mFrames.pop_back();
    }

    public StackFrame pushFrame( StackFrame frame ) modify {
        //print( "Pushing new stack frame: " + frame.mName );

        mFrames.push_back( frame );

        return frame;
    }

    public StackFrame pushFrame( string name, StackFrame parent = null ) modify {
        return pushFrame( new StackFrame( name, parent ) );
    }

    private Vector<StackFrame> mFrames;
}
