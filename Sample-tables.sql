-- Create BALLOON_A table

CREATE TABLE BALLOON_A (
    ID INT PRIMARY KEY,
    COLOR VARCHAR2 (100) NOT NULL
);

-- Create BALLOON_B table

CREATE TABLE BALLOON_B (
    ID INT PRIMARY KEY,
    COLOR VARCHAR2 (100) NOT NULL
);

-- Insert data into BALLOON_A table

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (1, 'Red');

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (2, 'Green');

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (3, 'Blue');

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (4, 'Purple');

-- Insert data into BALLOON_B table

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (1, 'Green');

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (2, 'Red');

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (3, 'Cyan');

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (4, 'Brown');