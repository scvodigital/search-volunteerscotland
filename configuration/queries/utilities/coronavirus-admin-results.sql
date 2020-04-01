{{#if @root.request.params.query.council ~}}
SELECT first_name,last_name,email,constituency,nuts_3,simd_datazone,simd_rank,ward,tsi FROM newsletter_coronavirus WHERE consent_volunteering_updates = true AND consent_tsi = true AND council = {{{safeStringify @root.request.params.query.council}}} AND cast(date_last_modified as date) between '{{#unless @root.request.params.query.from_date}}2020-03-29{{else}}{{@root.request.params.query.from_date}}{{/unless}}' and CURDATE() ORDER BY date_last_modified ASC;
{{else}}
SELECT email FROM newsletter_coronavirus WHERE 1 = 0
{{/if ~}}