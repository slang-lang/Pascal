PROGRAM BooleanTest;
VAR A: BOOLEAN := TRUE;
BEGIN
	WRITELN( A );

	IF A THEN BEGIN
		WRITELN( 'TRUE' );
	END
	ELSE BEGIN
		WRITELN( 'FALSE' );
	END;
END.
