{{~#with @root.request.body ~}}
INSERT INTO newsletter_coronavirus (
  consent_tsi, consent_volunteering_updates, constituency, latitude, longitude,
  email, first_name, last_name, local_authority, location_postcode, nuts_3, simd_datazone,
  simd_rank, ward, tsi, council
) VALUES (
  {{#if (compare consent_tsi "true")}}1{{else}}0{{/if}},
  {{#if (compare consent_volunteering_updates "true")}}1{{else}}0{{/if}},
  {{{mysqlEscape (default constituency "")}}},
  {{#if (contains coordinates ",")~}}
    {{{mysqlEscape (default (firstItem (split coordinates ",")) "") true}}},
    {{{mysqlEscape (default (lastItem (split coordinates ",")) "") true}}},
  {{else}}
    NULL,
    NULL,
  {{~/if}}
  {{{mysqlEscape email}}},
  {{{mysqlEscape (default first_name "")}}},
  {{{mysqlEscape (default last_name "")}}},
  {{{mysqlEscape (default local_authority "")}}},
  {{{mysqlEscape (default location_postcode "")}}},
  {{{mysqlEscape (default nuts_3 "")}}},
  {{{mysqlEscape (default simd_datazone "")}}},
  {{{mysqlEscape (default simd_rank "")}}},
  {{{mysqlEscape (default ward "")}}},
  {{{mysqlEscape (default tsi "")}}},
  {{{mysqlEscape (default council "")}}}
)
ON DUPLICATE KEY UPDATE
  consent_tsi = VALUES (consent_tsi),
  consent_volunteering_updates = VALUES (consent_volunteering_updates),
  constituency = VALUES (constituency),
  latitude = VALUES (latitude),
  longitude = VALUES (longitude),
  first_name = VALUES (first_name),
  last_name = VALUES (last_name),
  local_authority = VALUES (local_authority),
  location_postcode = VALUES (location_postcode),
  nuts_3 = VALUES (nuts_3),
  simd_datazone = VALUES (simd_datazone),
  simd_rank = VALUES (simd_rank),
  ward = VALUES (ward),
  tsi = VALUES (tsi),
  council = VALUES (council)
{{~/with~}}