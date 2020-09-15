--
-- Test the CREATE statements related to cstore.
--


-- Create uncompressed table
CREATE TABLE contestant (handle TEXT, birthdate DATE, rating INT,
	percentile FLOAT, country CHAR(3), achievements TEXT[])
	USING cstore_tableam;


-- Create compressed table with automatically determined file path
CREATE TABLE contestant_compressed (handle TEXT, birthdate DATE, rating INT,
	percentile FLOAT, country CHAR(3), achievements TEXT[])
	USING cstore_tableam;

-- Test that querying an empty table works
ANALYZE contestant;
SELECT count(*) FROM contestant;
