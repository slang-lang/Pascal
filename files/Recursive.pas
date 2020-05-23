PROGRAM Recursive;
CONST
	VALUE_MAX: Integer := 10;
VAR
	COUNTER: Integer := 0;

	FUNCTION RecursiveFunction( value: Integer ): Boolean;
	BEGIN
		WRITELN( 'value: ' + value + ' of ' + VALUE_MAX );

		IF ( value < VALUE_MAX ) THEN RecursiveFunction( value + 1 );

		RESULT := true;
	END;

	PROCEDURE RecursiveProcedure( value: Integer );
	BEGIN
		WRITELN( 'value: ' + value + ' of ' + VALUE_MAX );

		IF ( value < VALUE_MAX ) THEN RecursiveProcedure( value + 1);
	END;

BEGIN
	RecursiveFunction( 1 );
	RecursiveProcedure( 1 );
END.
