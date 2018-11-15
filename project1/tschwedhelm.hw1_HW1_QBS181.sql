SELECT * INTO tschwedhelm.hw1 FROM Demographics
ALTER TABLE tschwedhelm.hw1 DROP COLUMN gh1, gh2, gh3, gh4, gh5, pf02, test

EXEC sp_rename 'tschwedhelm.hw1.tri_age', 'Age', 'COLUMN'
EXEC sp_rename 'tschwedhelm.hw1.gendercode', 'Gender', 'COLUMN'
EXEC sp_rename 'tschwedhelm.hw1.contactid', 'ID', 'COLUMN'
EXEC sp_rename 'tschwedhelm.hw1.address1_stateorprovince', 'State', 'COLUMN'
EXEC sp_rename 'tschwedhelm.hw1.tri_imaginecareenrollmentemailsentdate', 'EmailSentdate', 'COLUMN'
EXEC sp_rename 'tschwedhelm.hw1.tri_enrollmentcompletedate', 'Completedate', 'COLUMN'
ALTER TABLE tschwedhelm.hw1 ADD Days nvarchar (100)
UPDATE tschwedhelm.hw1 SET Days = DATEDIFF(Day, try_convert(datetime, EmailSentdate), try_convert(datetime, Completedate))

ALTER TABLE tschwedhelm.hw1 ADD EnrollmentStatus nvarchar (100)
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Complete' WHERE tri_imaginecareenrollmentstatus = 167410011
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Email sent' WHERE tri_imaginecareenrollmentstatus = 167410001
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Non responder' WHERE tri_imaginecareenrollmentstatus = 167410004
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Facilitated Enrollment' WHERE tri_imaginecareenrollmentstatus = 167410005
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Incomplete Enrollments' WHERE tri_imaginecareenrollmentstatus = 167410002
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Opted Out' WHERE tri_imaginecareenrollmentstatus = 167410003
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Unprocessed' WHERE tri_imaginecareenrollmentstatus = 167410000
UPDATE tschwedhelm.hw1 SET EnrollmentStatus = 'Second email sent' WHERE tri_imaginecareenrollmentstatus = 167410006

ALTER TABLE tschwedhelm.hw1 ADD Sex nvarchar (100)
UPDATE tschwedhelm.hw1 SET Sex = 'Female' WHERE Gender = '2'
UPDATE tschwedhelm.hw1 SET Sex = 'Male' WHERE Gender = '1'
UPDATE tschwedhelm.hw1 SET Sex = 'Other' WHERE Gender = '167410000'
UPDATE tschwedhelm.hw1 SET Sex = 'Unknown' WHERE Gender = 'NULL'

ALTER TABLE tschwedhelm.hw1 ADD Agegroup nvarchar (100)
UPDATE tschwedhelm.hw1 SET Agegroup = '0-25' WHERE Age >0 AND Age <26
UPDATE tschwedhelm.hw1 SET Agegroup = '26-50' WHERE Age >25 AND Age <51
UPDATE tschwedhelm.hw1 SET Agegroup = '51-75' WHERE Age >50 AND Age <76
UPDATE tschwedhelm.hw1 SET Agegroup = '76-100' WHERE Age >75 AND Age <101
UPDATE tschwedhelm.hw1 SET Agegroup = '101-125' WHERE Age >100 AND Age <126

SELECT TOP 10 * FROM tschwedhelm.hw1
