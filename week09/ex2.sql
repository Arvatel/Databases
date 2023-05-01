CREATE FUNCTION retrieveCustomers(start_pos INT, end_pos INT)
RETURNS TABLE (
    customer_id INTEGER,
    store_id SMALLINT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(50),
    address_id SMALLINT,
    activebool BOOLEAN,
    create_date date,
    last_update timestamp,
    active INTEGER
)
AS $$
BEGIN
    IF start_pos < 0 OR end_pos < 0 OR end_pos > 600 THEN
        RAISE EXCEPTION 'Invalid start or end_pos parameter';
    END IF;

    RETURN QUERY (
        SELECT *
        FROM customer
        ORDER BY address_id
        LIMIT (end_pos - start_pos + 1) OFFSET (start_pos - 1)
    );
END;
$$ LANGUAGE plpgsql;