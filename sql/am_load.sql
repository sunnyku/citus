--
-- Test loading data into cstore_fdw tables.
--

-- COPY with incorrect delimiter
COPY contestant FROM '/Users/jefdavi/wd/cstore2/data/contestants.1.csv'
	WITH DELIMITER '|'; -- ERROR

-- COPY with invalid program
COPY contestant FROM PROGRAM 'invalid_program' WITH CSV; -- ERROR

-- COPY into uncompressed table from file
COPY contestant FROM '/Users/jefdavi/wd/cstore2/data/contestants.1.csv' WITH CSV;

-- COPY into uncompressed table from program
COPY contestant FROM PROGRAM 'cat /Users/jefdavi/wd/cstore2/data/contestants.2.csv' WITH CSV;

-- COPY into compressed table
COPY contestant_compressed FROM '/Users/jefdavi/wd/cstore2/data/contestants.1.csv' WITH CSV;

-- COPY into uncompressed table from program
COPY contestant_compressed FROM PROGRAM 'cat /Users/jefdavi/wd/cstore2/data/contestants.2.csv'
	WITH CSV;

-- Test column list
CREATE TABLE famous_constants (id int, name text, value real)
    USING cstore_tableam;
COPY famous_constants (value, name, id) FROM STDIN WITH CSV;
3.141,pi,1
2.718,e,2
0.577,gamma,3
5.291e-11,bohr radius,4
\.

COPY famous_constants (name, value) FROM STDIN WITH CSV;
avagadro,6.022e23
electron mass,9.109e-31
proton mass,1.672e-27
speed of light,2.997e8
\.

SELECT * FROM famous_constants ORDER BY id, name;

DROP TABLE famous_constants;
