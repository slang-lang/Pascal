
// library imports
import System.Collections.List;

// project imports
import Symbol;


public object SymbolTable {
	public string mName const;
	public SymbolTable mParent const;

	public void Constructor(string name, SymbolTable parent = null) {
		mName = name;
		mParent = parent;
		mStartIndex = parent ? parent.size() : 0;
		mSymbols = new List<Symbol>();
	}

	public Symbol at( int stackIndex ) const throws {
		if ( stackIndex < mStartIndex ) {
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

