-- Select rows from BALLOON_A and BALLOON_B tables using oracle right join.

SELECT
    A.ID ID_A,
    A.COLOR COLOR_A,
    B.ID ID_B,
    B.COLOR COLOR_B
FROM
    BALLOON_A A
RIGHT JOIN BALLOON_B B ON A.COLOR = B.COLOR;