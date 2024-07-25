-- Update the 'sex' column by swapping 'm' to 'f' and 'f' to 'm'
UPDATE salary
SET sex = CASE 
    WHEN sex = 'm' THEN 'f' 
    ELSE 'm' 
END;
