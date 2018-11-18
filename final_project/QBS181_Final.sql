

-- Question 1
-- imported IC_BP.csv into SQL as tschwedhelm.IC_BP
-- Part a
-- create new final exam table from imported file
SELECT * INTO tschwedhelm.final1 FROM tschwedhelm.IC_BP
EXEC sp_rename 'tschwedhelm.final1.BPAlerts', 'BPStatus', 'COLUMN'
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1 ORDER BY NEWID()
-- Part b
-- setting BPStatus to Controlled (1) or Uncontrolled (0)
UPDATE tschwedhelm.final1 SET BPStatus = 1 WHERE BPStatus = 'Normal' OR BPStatus = 'Hypo1'
UPDATE tschwedhelm.final1 SET BPStatus = 0 WHERE BPStatus != 'Normal' AND BPStatus != 'Hypo1' AND
BPStatus != '1'
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1 ORDER BY NEWID()
-- Part c
-- merge final1 table with Demographics table
SELECT * INTO tschwedhelm.final1c FROM tschwedhelm.final1 A INNER JOIN Demographics B ON
A.ID=B.contactid
-- cleaning new table by dropping unnecessary columns
ALTER TABLE tschwedhelm.final1c DROP COLUMN gh1, gh2, gh3, gh4, gh5, pf02, test, contactid
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1c ORDER BY NEWID()
-- Part d
ALTER TABLE tschwedhelm.final1c ADD interval INT
-- adding a column for the first observation date
SELECT * INTO tschwedhelm.final1d FROM tschwedhelm.final1c A INNER JOIN (SELECT ID 'ID2',
MIN(ObservedTime) 'minobserve' FROM tschwedhelm.final1c GROUP BY ID) B ON
A.ID=B.ID2
-- creating 12 week intervals from the patient's first observation time
UPDATE tschwedhelm.final1d SET interval = 0 WHERE minobserve = ObservedTime
UPDATE tschwedhelm.final1d SET interval = 1 WHERE DATEDIFF(week, minobserve, ObservedTime) <= 12
AND DATEDIFF(day, minobserve, ObservedTime) > 0
UPDATE tschwedhelm.final1d SET interval = 2 WHERE DATEDIFF(week, minobserve, ObservedTime) > 12
AND DATEDIFF(week, minobserve, ObservedTime) <= 24
UPDATE tschwedhelm.final1d SET interval = 3 WHERE DATEDIFF(week, minobserve, ObservedTime) > 24
AND DATEDIFF(week, minobserve, ObservedTime) <= 36
UPDATE tschwedhelm.final1d SET interval = 4 WHERE DATEDIFF(week, minobserve, ObservedTime) > 36
AND DATEDIFF(week, minobserve, ObservedTime) <= 48
UPDATE tschwedhelm.final1d SET interval = 5 WHERE DATEDIFF(week, minobserve, ObservedTime) > 48
AND DATEDIFF(week, minobserve, ObservedTime) <= 60
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1d ORDER BY NEWID()
-- creating AvgSBP and AvgDBP columns for each patient for each 12 week interval
-- by creating a temporary table and joining
SELECT * INTO tschwedhelm.final1dd FROM tschwedhelm.final1d A INNER JOIN (SELECT ID 'ID3', interval
'int', AVG(SystolicValue) 'AvgSBP' FROM tschwedhelm.final1d GROUP BY ID, interval) B ON A.ID=B.ID3
AND A.interval=B.int
DROP TABLE tschwedhelm.final1d
SELECT * INTO tschwedhelm.final1d FROM tschwedhelm.final1dd A INNER JOIN (SELECT ID 'ID4', interval
'int2', AVG(Diastolicvalue) 'AvgDBP' FROM tschwedhelm.final1dd GROUP BY ID, interval) B ON A.ID=B.ID4
AND A.interval=B.int2
DROP TABLE tschwedhelm.final1dd
-- dropping unnecessary columns that were added in the process
ALTER TABLE tschwedhelm.final1d DROP COLUMN ID2, ID3, ID4, int, int2, SystolicValue, Diastolicvalue
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1d ORDER BY NEWID()
-- need to delete duplicate rows
-- adding column with row number (identity column)
ALTER TABLE tschwedhelm.final1d ADD row_id INT IDENTITY(1,1)
-- deleting duplicate values because there are patients who texted multiple times on the last date
DELETE tschwedhelm.final1d WHERE row_id > (SELECT MIN(row_id) FROM tschwedhelm.final1d Z WHERE
Z.ID=tschwedhelm.final1d.ID AND Z.interval=tschwedhelm.final1d.interval)
-- deleting duplicate columns
ALTER TABLE tschwedhelm.final1d DROP COLUMN row_id
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1d ORDER BY NEWID()
-- Part e and f
-- creating two tables, one with uncontrolled BP at start and another with controlled BP after 12 weeks
SELECT * INTO tschwedhelm.final1f1 FROM tschwedhelm.final1d WHERE BPStatus=0 AND interval=0
SELECT * INTO tschwedhelm.final1f2 FROM tschwedhelm.final1d WHERE BPStatus=1 AND interval=1
EXEC sp_rename 'tschwedhelm.final1f2.ID', 'ID2', 'COLUMN'
-- merging these two tables to find which values are in common
SELECT ID INTO tschwedhelm.final1f FROM tschwedhelm.final1f1 A INNER JOIN tschwedhelm.final1f2 B ON
A.ID=B.ID2
SELECT COUNT (ID) FROM tschwedhelm.final1f
-- =27 patients brought from uncontrolled to controlled
-- this just gives the count and the patient IDs, not the values or dates
DROP TABLE tschwedhelm.final1f1
DROP TABLE tschwedhelm.final1f2
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final1f ORDER BY NEWID()



-- Question 2
-- merge tables Demographics, ChronicConditions, and Text
SELECT * INTO tschwedhelm.final2 FROM Demographics A INNER JOIN ChronicConditions B ON
A.contactid=B.tri_patientid INNER JOIN Text C ON A.contactid=C.tri_contactId
-- cleaning new table by dropping unnecessary columns
ALTER TABLE tschwedhelm.final2 DROP COLUMN gh1, gh2, gh3, gh4, gh5, pf02, test,
tri_contactId, tri_patientid
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final2 ORDER BY NEWID()
-- selecting latest sent date per contactid
-- merging table table with the latest date
SELECT * INTO tschwedhelm.final2a FROM tschwedhelm.final2 A INNER JOIN (SELECT contactid 'ID',
MAX(TextSentDate) 'maxdate' FROM tschwedhelm.final2 GROUP BY contactid
) B ON A.contactid=B.ID AND A.TextSentDate=B.maxdate
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final2a ORDER BY NEWID()
-- adding column with row number (identity column)
ALTER TABLE tschwedhelm.final2a ADD row_id INT IDENTITY(1,1)
-- deleting duplicate values because there are patients who texted multiple times on the last date
DELETE tschwedhelm.final2a WHERE row_id > (SELECT MIN(row_id) FROM tschwedhelm.final2a Z WHERE
Z.contactid=tschwedhelm.final2a.contactid AND Z.maxdate=tschwedhelm.final2a.maxdate)
-- deleting duplicate columns
ALTER TABLE tschwedhelm.final2a DROP COLUMN row_id, ID, TextSentDate
-- select random 10 rows from the table to display
SELECT TOP 10 * FROM tschwedhelm.final2a ORDER BY NEWID()
