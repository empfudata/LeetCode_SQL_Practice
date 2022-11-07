-- 1148.Article Views I
/*
Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.

Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+

Result table:
+------+
| id   |
+------+
| 4    |
| 7    |
+------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Views;
CREATE TABLE Views (
  `article_id` INTEGER,
  `author_id` INTEGER,
  `viewer_id` INTEGER,
  `view_date` DATETIME);

INSERT INTO Views (`article_id`, `author_id`, `viewer_id`, `view_date`) VALUES
  ('1', '3', '5', '2019-08-01'),
  ('1', '3', '6', '2019-08-02'),
  ('2', '7', '7', '2019-08-01'),
  ('2', '7', '6', '2019-08-02'),
  ('4', '7', '1', '2019-07-22'),
  ('3', '4', '4', '2019-07-21'),
  ('3', '4', '4', '2019-07-21');

-- Writing your MySQL query statement below
SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY author_id
HAVING COUNT(viewer_id) >= 1
ORDER BY author_id ASC;