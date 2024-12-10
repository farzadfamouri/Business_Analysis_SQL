-- Create a new table called oscars
CREATE TABLE oscars (
    title VARCHAR,
    award VARCHAR
);

-- Insert the data into the oscars table
INSERT INTO oscars (title, award)
VALUES
('TRANSLATION SUMMER', 'Best Film'),
('DORADO NOTTING', 'Best Film'),
('MARS ROMAN', 'Best Film'),
('CUPBOARD SINNERS', 'Best Film'),
('LONELY ELEPHANT', 'Best Film');

SELECT * 
FROM oscars;