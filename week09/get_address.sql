CREATE OR REPLACE FUNCTION get_addresses()
    RETURNS TABLE (address_id INT, address TEXT)
AS $$
BEGIN
    RETURN QUERY
    SELECT address.address_id, address.address::text
    FROM address
    WHERE address.address LIKE '%11%'
    AND city_id BETWEEN 400 AND 600;
END;
$$ LANGUAGE plpgsql;

