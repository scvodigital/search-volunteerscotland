SELECT
  date_last_modified,
  first_name,
  last_name,
  email,
  location_postcode,
  constituency,
  nuts_3,
  simd_datazone,
  simd_rank,
  ward,
  council,
  tsi,
  CASE WHEN consent_tsi = 1 THEN 'Yes' ELSE 'No' END AS consent_tsi
FROM newsletter_coronavirus
WHERE
  consent_volunteering_updates = true
AND
  CAST(date_last_modified AS date) between
    '{{#unless @root.request.params.query.from_date}}2020-03-29{{else}}{{@root.request.params.query.from_date}}{{/unless}}' AND
    CURDATE()
ORDER BY date_last_modified ASC;