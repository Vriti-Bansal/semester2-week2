-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit
#

-- write your sql code here
SELECT Books.title,Members.name,Loans.loan_date from Loans JOIN Members ON Members.id=Loans.member_id JOIN Books ON Books.id=Loans.book_id;
SELECT Books.title,Loans.id from Books LEFT JOIN Loans ON Books.id=Loans.book_id;
SELECT LibraryBranch.name,Books.title from LibraryBranch LEFT JOIN Books ON Books.branch_id=LibraryBranch.id;
SELECT LibraryBranch.name,COUNT(Books.id) from LibraryBranch LEFT JOIN Books on Books.branch_id=LibraryBranch.id group by LibraryBranch.name;
SELECT LibraryBranch.name,COUNT(Books.id) from LibraryBranch JOIN Books on Books.branch_id=LibraryBranch.id group by LibraryBranch.name having COUNT(Books.id)>7;
SELECT Members.name,COUNT(Loans.id) from Members LEFT JOIN Loans on Loans.member_id=Members.id group by Members.name;
SELECT Members.name,COUNT(Loans.id) from Members LEFT JOIN Loans on Loans.member_id=Members.id group by Members.name having COUNT(Loans.id)=0;
SELECT LibraryBranch.name,COUNT(Loans.id) from LibraryBranch LEFT JOIN Books ON Books.branch_id=LibraryBranch.id LEFT JOIN Loans on Loans.book_id=Books.id  group by LibraryBranch.name; 
SELECT Members.name from Members JOIN Loans ON Loans.member_id=Members.id WHERE return_date is NULL;