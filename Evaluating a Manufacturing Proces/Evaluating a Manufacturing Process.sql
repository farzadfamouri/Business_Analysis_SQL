WITH rolling_stats AS (
    -- Step 1: Calculate row_number, avg_height, and stddev_height in a rolling window
    SELECT 
        operator,
        ROW_NUMBER() OVER w AS row_number,
        height,
        AVG(height) OVER w AS avg_height,
        STDDEV(height) OVER w AS stddev_height
    FROM manufacturing_parts
    WINDOW w AS (
        PARTITION BY operator 
        ORDER BY item_no 
        ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    )
),
control_limits AS (
    -- Step 2: Calculate UCL and LCL, and filter only complete windows (>= 5 rows)
    SELECT
        operator,
        row_number,
        height,
        avg_height,
        stddev_height,
        avg_height + (3 * stddev_height / SQRT(5)) AS ucl,
        avg_height - (3 * stddev_height / SQRT(5)) AS lcl
    FROM rolling_stats
    WHERE row_number >= 5
)
-- Step 3: Flag rows where height is outside control limits
SELECT
    operator,
    row_number,
    height,
    avg_height,
    stddev_height,
    ucl,
    lcl,
    CASE 
        WHEN height NOT BETWEEN lcl AND ucl THEN TRUE
        ELSE FALSE
    END AS alert
FROM control_limits
ORDER BY row_number;