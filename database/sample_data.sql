USE library_management_db;

-- Clear previous demo data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE fines;
TRUNCATE TABLE reservations;
TRUNCATE TABLE loans;
TRUNCATE TABLE book_copies;
TRUNCATE TABLE book_authors;
TRUNCATE TABLE books;
TRUNCATE TABLE authors;
TRUNCATE TABLE publishers;
TRUNCATE TABLE categories;
TRUNCATE TABLE members;
TRUNCATE TABLE digital_resources;
TRUNCATE TABLE admins;
SET FOREIGN_KEY_CHECKS = 1;

-- Administrators (admin / admin123)
INSERT INTO admins (admin_id, username, password_hash, is_active) VALUES
(1, 'admin', 'scrypt:32768:8:1$oL9ahuDAUoC09nny$3c77e6eabe4402b5a44d655362d907bd8aaccbc54ba9f09c30308ad6bd8446874f6c34cba1172b22d18c7cdbc6f65d7a4a39973c4e5c1dc85d30e2809862b713', 1),
(2, 'librarian', 'scrypt:32768:8:1$oL9ahuDAUoC09nny$3c77e6eabe4402b5a44d655362d907bd8aaccbc54ba9f09c30308ad6bd8446874f6c34cba1172b22d18c7cdbc6f65d7a4a39973c4e5c1dc85d30e2809862b713', 1);

-- Categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Computer Science & IT'),
(2, 'Software Engineering & Architecture'),
(3, 'Data Science & Machine Learning'),
(4, 'Literature & Classic Fiction'),
(5, 'Biographies & Memoirs'),
(6, 'Personal Growth & Psychology'),
(7, 'Business & Finance'),
(8, 'Indian History & Heritage');

-- Publishers
INSERT INTO publishers (publisher_id, publisher_name, city) VALUES
(1, 'Pearson India', 'New Delhi'),
(2, 'McGraw-Hill Education India', 'Chennai'),
(3, 'Penguin Random House India', 'Gurugram'),
(4, 'Oxford University Press India', 'New Delhi'),
(5, 'HarperCollins Publishers India', 'Noida'),
(6, 'Universities Press', 'Hyderabad'),
(7, 'Rupa Publications India', 'New Delhi'),
(8, 'Shroff Publishers & Distributors', 'Mumbai');

-- Authors
INSERT INTO authors (author_id, author_name, country) VALUES
(1, 'Thomas H. Cormen', 'USA'),
(2, 'Robert C. Martin', 'USA'),
(3, 'Abraham Silberschatz', 'USA'),
(4, 'Andrew S. Tanenbaum', 'Netherlands'),
(5, 'Stuart Russell & Peter Norvig', 'USA'),
(6, 'Martin Kleppmann', 'UK'),
(7, 'David Thomas & Andrew Hunt', 'USA'),
(8, 'Gayle Laakmann McDowell', 'USA'),
(9, 'Dr. A.P.J. Abdul Kalam', 'India'),
(10, 'Paulo Coelho', 'Brazil'),
(11, 'James Clear', 'USA'),
(12, 'Yuval Noah Harari', 'Israel'),
(13, 'Morgan Housel', 'USA'),
(14, 'Robert T. Kiyosaki', 'USA'),
(15, 'R.K. Narayan', 'India'),
(16, 'Khushwant Singh', 'India'),
(17, 'Amish Tripathi', 'India'),
(18, 'Aravind Adiga', 'India'),
(19, 'George Orwell', 'UK'),
(20, 'F. Scott Fitzgerald', 'USA');

-- Books (20 Famous Tech and General Titles)
INSERT INTO books (book_id, isbn, title, publisher_id, category_id, published_year) VALUES
(1, '978-0262046305', 'Introduction to Algorithms (CLRS)', 1, 1, 2022),
(2, '978-0132350884', 'Clean Code: A Handbook of Agile Software', 1, 2, 2008),
(3, '978-0078022159', 'Database System Concepts', 2, 1, 2019),
(4, '978-0137523658', 'Computer Networks', 1, 1, 2021),
(5, '978-1119456339', 'Operating System Concepts', 2, 1, 2018),
(6, '978-0134610993', 'Artificial Intelligence: A Modern Approach', 1, 3, 2020),
(7, '978-9352135240', 'Designing Data-Intensive Applications', 8, 2, 2017),
(8, '978-0135957059', 'The Pragmatic Programmer', 1, 2, 2019),
(9, '978-0984782857', 'Cracking the Coding Interview', 8, 2, 2016),
(10, '978-8173711463', 'Wings of Fire: An Autobiography', 6, 5, 1999),
(11, '978-0143424123', 'Ignited Minds', 3, 5, 2002),
(12, '978-0062315007', 'The Alchemist', 5, 4, 1993),
(13, '978-1847941831', 'Atomic Habits', 3, 6, 2018),
(14, '978-0062316097', 'Sapiens: A Brief History of Humankind', 5, 6, 2015),
(15, '978-9390166268', 'The Psychology of Money', 7, 7, 2020),
(16, '978-1612680194', 'Rich Dad Poor Dad', 3, 7, 2017),
(17, '978-8185986173', 'Malgudi Days', 4, 4, 1982),
(18, '978-0143065883', 'Train to Pakistan', 3, 8, 1956),
(19, '978-9380658018', 'The Immortals of Meluha', 7, 4, 2010),
(20, '978-0451524935', '1984', 5, 4, 1949);

-- Book Authors Mapping
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 9),
(12, 10),
(13, 11),
(14, 12),
(15, 13),
(16, 14),
(17, 15),
(18, 16),
(19, 17),
(20, 19);

-- Accession Copies (Multiple copies per book)
INSERT INTO book_copies (copy_id, book_id, accession_no, status) VALUES
(1, 1, 'LIB-ACC-01-A', 'AVAILABLE'),
(2, 1, 'LIB-ACC-01-B', 'AVAILABLE'),
(3, 1, 'LIB-ACC-01-C', 'AVAILABLE'),
(4, 2, 'LIB-ACC-02-A', 'AVAILABLE'),
(5, 2, 'LIB-ACC-02-B', 'AVAILABLE'),
(6, 2, 'LIB-ACC-02-C', 'AVAILABLE'),
(7, 3, 'LIB-ACC-03-A', 'AVAILABLE'),
(8, 3, 'LIB-ACC-03-B', 'AVAILABLE'),
(9, 3, 'LIB-ACC-03-C', 'AVAILABLE'),
(10, 4, 'LIB-ACC-04-A', 'AVAILABLE'),
(11, 4, 'LIB-ACC-04-B', 'AVAILABLE'),
(12, 4, 'LIB-ACC-04-C', 'AVAILABLE'),
(13, 5, 'LIB-ACC-05-A', 'AVAILABLE'),
(14, 5, 'LIB-ACC-05-B', 'AVAILABLE'),
(15, 6, 'LIB-ACC-06-A', 'AVAILABLE'),
(16, 6, 'LIB-ACC-06-B', 'AVAILABLE'),
(17, 7, 'LIB-ACC-07-A', 'AVAILABLE'),
(18, 7, 'LIB-ACC-07-B', 'AVAILABLE'),
(19, 7, 'LIB-ACC-07-C', 'AVAILABLE'),
(20, 8, 'LIB-ACC-08-A', 'AVAILABLE'),
(21, 8, 'LIB-ACC-08-B', 'AVAILABLE'),
(22, 9, 'LIB-ACC-09-A', 'AVAILABLE'),
(23, 9, 'LIB-ACC-09-B', 'AVAILABLE'),
(24, 9, 'LIB-ACC-09-C', 'AVAILABLE'),
(25, 10, 'LIB-ACC-10-A', 'AVAILABLE'),
(26, 10, 'LIB-ACC-10-B', 'AVAILABLE'),
(27, 10, 'LIB-ACC-10-C', 'AVAILABLE'),
(28, 11, 'LIB-ACC-11-A', 'AVAILABLE'),
(29, 11, 'LIB-ACC-11-B', 'AVAILABLE'),
(30, 12, 'LIB-ACC-12-A', 'AVAILABLE'),
(31, 12, 'LIB-ACC-12-B', 'AVAILABLE'),
(32, 12, 'LIB-ACC-12-C', 'AVAILABLE'),
(33, 13, 'LIB-ACC-13-A', 'AVAILABLE'),
(34, 13, 'LIB-ACC-13-B', 'AVAILABLE'),
(35, 13, 'LIB-ACC-13-C', 'AVAILABLE'),
(36, 14, 'LIB-ACC-14-A', 'AVAILABLE'),
(37, 14, 'LIB-ACC-14-B', 'AVAILABLE'),
(38, 15, 'LIB-ACC-15-A', 'AVAILABLE'),
(39, 15, 'LIB-ACC-15-B', 'AVAILABLE'),
(40, 15, 'LIB-ACC-15-C', 'AVAILABLE'),
(41, 16, 'LIB-ACC-16-A', 'AVAILABLE'),
(42, 16, 'LIB-ACC-16-B', 'AVAILABLE'),
(43, 17, 'LIB-ACC-17-A', 'AVAILABLE'),
(44, 17, 'LIB-ACC-17-B', 'AVAILABLE'),
(45, 18, 'LIB-ACC-18-A', 'AVAILABLE'),
(46, 18, 'LIB-ACC-18-B', 'AVAILABLE'),
(47, 19, 'LIB-ACC-19-A', 'AVAILABLE'),
(48, 19, 'LIB-ACC-19-B', 'AVAILABLE'),
(49, 20, 'LIB-ACC-20-A', 'AVAILABLE'),
(50, 20, 'LIB-ACC-20-B', 'AVAILABLE');

-- 16 Indian Members with Realistic Contact Details
INSERT INTO members (member_id, member_no, full_name, email, phone, joined_on, status) VALUES
(1, 'MEM-2024-001', 'Aarav Sharma', 'aarav.sharma@gmail.com', '+91 98765 43210', '2024-01-15', 'ACTIVE'),
(2, 'MEM-2024-002', 'Priya Patel', 'priya.patel@gmail.com', '+91 98234 56789', '2024-02-10', 'ACTIVE'),
(3, 'MEM-2024-003', 'Rohan Verma', 'rohan.verma@gmail.com', '+91 97123 45678', '2024-03-05', 'ACTIVE'),
(4, 'MEM-2024-004', 'Ananya Iyer', 'ananya.iyer@gmail.com', '+91 99887 76655', '2024-03-22', 'ACTIVE'),
(5, 'MEM-2024-005', 'Vikram Malhotra', 'vikram.malhotra@gmail.com', '+91 98112 23344', '2024-04-12', 'ACTIVE'),
(6, 'MEM-2024-006', 'Sneha Kulkarni', 'sneha.kulkarni@gmail.com', '+91 97654 32109', '2024-05-01', 'ACTIVE'),
(7, 'MEM-2024-007', 'Aditya Nair', 'aditya.nair@gmail.com', '+91 99456 78123', '2023-09-10', 'ACTIVE'),
(8, 'MEM-2024-008', 'Neha Deshmukh', 'neha.deshmukh@gmail.com', '+91 98345 67890', '2024-06-18', 'ACTIVE'),
(9, 'MEM-2024-009', 'Siddharth Mehta', 'sid.mehta@gmail.com', '+91 98901 23456', '2024-07-02', 'ACTIVE'),
(10, 'MEM-2024-010', 'Tanvi Joshi', 'tanvi.joshi@gmail.com', '+91 98450 11223', '2024-07-15', 'ACTIVE'),
(11, 'MEM-2024-011', 'Kunal Kapoor', 'kunal.kapoor@gmail.com', '+91 97234 55667', '2024-08-01', 'ACTIVE'),
(12, 'MEM-2024-012', 'Pooja Hegde', 'pooja.hegde@gmail.com', '+91 99123 88776', '2024-08-19', 'ACTIVE'),
(13, 'MEM-2024-013', 'Arjun Rao', 'arjun.rao@gmail.com', '+91 98665 44332', '2024-09-05', 'ACTIVE'),
(14, 'MEM-2024-014', 'Meera Nambiar', 'meera.nambiar@gmail.com', '+91 98440 99887', '2024-09-20', 'ACTIVE'),
(15, 'MEM-2024-015', 'Varun Dhawan', 'varun.dhawan@gmail.com', '+91 97334 22110', '2024-10-10', 'INACTIVE'),
(16, 'MEM-2024-016', 'Shruti Haasan', 'shruti.haasan@gmail.com', '+91 98110 55443', '2024-10-25', 'ACTIVE');

-- Circulation Loans (Rich mix of overdue, active, and returned)
INSERT INTO loans (loan_id, member_id, copy_id, issue_date, due_date, return_date, status) VALUES
-- Overdue 1: 14 days overdue
(1, 1, 1, DATE_SUB(CURDATE(), INTERVAL 28 DAY), DATE_SUB(CURDATE(), INTERVAL 14 DAY), NULL, 'ISSUED'),
-- Overdue 2: 7 days overdue
(2, 3, 4, DATE_SUB(CURDATE(), INTERVAL 21 DAY), DATE_SUB(CURDATE(), INTERVAL 7 DAY), NULL, 'ISSUED'),
-- Overdue 3: 4 days overdue
(3, 5, 7, DATE_SUB(CURDATE(), INTERVAL 18 DAY), DATE_SUB(CURDATE(), INTERVAL 4 DAY), NULL, 'ISSUED'),
-- Active on-time loans
(4, 2, 10, DATE_SUB(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 9 DAY), NULL, 'ISSUED'),
(5, 4, 13, DATE_SUB(CURDATE(), INTERVAL 4 DAY), DATE_ADD(CURDATE(), INTERVAL 10 DAY), NULL, 'ISSUED'),
(6, 6, 17, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_ADD(CURDATE(), INTERVAL 11 DAY), NULL, 'ISSUED'),
(7, 7, 22, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 12 DAY), NULL, 'ISSUED'),
(8, 8, 25, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 13 DAY), NULL, 'ISSUED'),
(9, 9, 30, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY), NULL, 'ISSUED'),
(10, 10, 33, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY), NULL, 'ISSUED'),
-- Returned loans
(11, 11, 36, DATE_SUB(CURDATE(), INTERVAL 40 DAY), DATE_SUB(CURDATE(), INTERVAL 26 DAY), DATE_SUB(CURDATE(), INTERVAL 27 DAY), 'RETURNED'),
(12, 12, 38, DATE_SUB(CURDATE(), INTERVAL 35 DAY), DATE_SUB(CURDATE(), INTERVAL 21 DAY), DATE_SUB(CURDATE(), INTERVAL 18 DAY), 'RETURNED'),
(13, 13, 41, DATE_SUB(CURDATE(), INTERVAL 50 DAY), DATE_SUB(CURDATE(), INTERVAL 36 DAY), DATE_SUB(CURDATE(), INTERVAL 35 DAY), 'RETURNED'),
(14, 14, 43, DATE_SUB(CURDATE(), INTERVAL 45 DAY), DATE_SUB(CURDATE(), INTERVAL 31 DAY), DATE_SUB(CURDATE(), INTERVAL 25 DAY), 'RETURNED'),
(15, 1, 47, DATE_SUB(CURDATE(), INTERVAL 60 DAY), DATE_SUB(CURDATE(), INTERVAL 46 DAY), DATE_SUB(CURDATE(), INTERVAL 45 DAY), 'RETURNED'),
(16, 2, 49, DATE_SUB(CURDATE(), INTERVAL 55 DAY), DATE_SUB(CURDATE(), INTERVAL 41 DAY), DATE_SUB(CURDATE(), INTERVAL 40 DAY), 'RETURNED');

-- Mark issued copies
UPDATE book_copies SET status = 'ISSUED' WHERE copy_id IN (1, 4, 7, 10, 13, 17, 22, 25, 30, 33);

-- Fines (Unpaid for overdue + Paid for late returned)
INSERT INTO fines (fine_id, loan_id, amount, paid_amount, status, created_on) VALUES
(1, 1, 70.00, 0.00, 'UNPAID', DATE_SUB(CURDATE(), INTERVAL 14 DAY)),
(2, 2, 35.00, 0.00, 'UNPAID', DATE_SUB(CURDATE(), INTERVAL 7 DAY)),
(3, 3, 20.00, 0.00, 'UNPAID', DATE_SUB(CURDATE(), INTERVAL 4 DAY)),
(4, 12, 15.00, 15.00, 'PAID', DATE_SUB(CURDATE(), INTERVAL 18 DAY)),
(5, 14, 30.00, 30.00, 'PAID', DATE_SUB(CURDATE(), INTERVAL 25 DAY));
