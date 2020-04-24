SELECT question_text,
COUNT(DISTINCT user_id) as 'total users'
FROM survey_responses
GROUP BY question_text;

SELECT modal_text,
COUNT(DISTINCT user_id)
FROM onboarding_modals
GROUP BY modal_text
ORDER BY modal_text ASC;

SELECT modal_text,
COUNT(DISTINCT user_id)
FROM onboarding_modals
WHERE ab_group = 'control'
GROUP BY modal_text
ORDER BY modal_text ASC;

/* OR */

SELECT modal_text,
  COUNT(DISTINCT CASE
    WHEN ab_group = 'control' THEN user_id
    END) AS 'control_clicks'
FROM onboarding_modals
GROUP BY 1
ORDER BY 1;


SELECT modal_text,
  COUNT(DISTINCT CASE
    WHEN ab_group = 'control' THEN user_id
    END) AS 'control_clicks',
  COUNT(DISTINCT CASE
       WHEN ab_group = 'variant' THEN user_id
       END) AS 'variant_clicks'
FROM onboarding_modals
GROUP BY 1
ORDER BY 1;


 SELECT DISTINCT b.browse_date,
   b.user_id,
   c.user_id IS NOT NULL AS 'is_checkout',
   p.user_id IS NOT NULL AS 'is purchase'
 FROM browse b
 LEFT JOIN checkout c
 ON b.user_id = c.user_id
 LEFT JOIN purchase p
 ON c.user_id = p.user_id
 LIMIT 50;


 WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT COUNT(*) as 'num_browse',
  SUM(is_checkout) as 'num_checkout',
  SUM(is_purchase) as 'num_purchase',
  1.0 * SUM(is_checkout) / COUNT(*) as 'perc_checkout',
  1.0 * SUM(is_purchase) / SUM(is_checkout) as 'perc_purchase'
FROM funnels
;


WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT browse_date,
   COUNT(*) AS 'num_browse',
   SUM(is_checkout) AS 'num_checkout',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'checkout_to_purchase'
FROM funnels
GROUP BY browse_date
ORDER BY browse_date ASC;