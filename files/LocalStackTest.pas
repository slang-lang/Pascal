PROGRAM LocalStackTest;
CONST
	c1: Integer := 1;

	FUNCTION F1(): Integer;
	CONST
		c2: Integer := 2;
	BEGIN
		WRITELN( 'c1(F1) = ' + c1 );
		WRITELN( 'c2(F1) = ' + c2 );

		RESULT := c2;
	END;

	FUNCTION F2(): Integer;
	CONST
		c1: Integer := 2;
		c3: Integer := 3;
	BEGIN
		WRITELN( 'c1(F2) = ' + c1 );

		RESULT := c1 + F1 + c3;

		WRITELN( 'c3(F2) = ' + c3 );
	END;

BEGIN
	WRITELN( 'F1() = ' + F1 );
	WRITELN( 'F2() = ' + F2 );
END.
