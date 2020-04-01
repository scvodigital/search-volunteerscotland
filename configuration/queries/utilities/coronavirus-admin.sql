SELECT DISTINCT council, COUNT(email) AS submissions FROM newsletter_coronavirus WHERE consent_volunteering_updates = true AND consent_tsi = true AND location_postcode != '' AND council != '' GROUP BY council ORDER BY council ASC;