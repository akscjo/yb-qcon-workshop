-- Insert 100 demo records into the "transactions" table
INSERT INTO transactions (from_acct, to_acct, from_route, to_route, amount)
SELECT
    LEFT(md5(random()::text), 10) AS from_acct,
    LEFT(md5(random()::text), 10) AS to_acct,
    LEFT(md5(random()::text), 9) AS from_route,
    LEFT(md5(random()::text), 9) AS to_route,
    floor(random() * 10000) AS amount
FROM generate_series(1, 100);
