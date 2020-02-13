
use dataanalyst;

-- Phone
-- ----------------------------------------------------------------------------------
insert into phone values (1, 'Iphone 10', 'Apple');
insert into phone values (2, 'Iphone 8', 'Apple');
insert into phone values (3, 'Note 10', 'Samsung');
insert into phone values (4, 'Pixel 3e', 'Google');
insert into phone values (5, 'Moto Z4', 'Motorola');

-- plan
-- ----------------------------------------------------------------------------------
insert into plan values (6, 'A', '400', 100, 2);
insert into plan values (7, 'B', '300', 200, 1);
insert into plan values (8, 'C', '500', 500, 3);

insert into plan values (6, 'A', '400', 100, 2, '15-jan',20);
insert into billing values (4, 2, 2020, 'jan', 1200, null, paymentdate date, overtimefee
                                                           '18-jan-2020',20) ;


-- phoneplan
-- ----------------------------------------------------------------------------------
insert into phoneplan values (1, 2, 6);
insert into phoneplan values (2, 3, 8);
insert into phoneplan values (3, 5, 7);
insert into phoneplan values (4, 4, 6);
insert into phoneplan values (5, 1, 8);
insert into phoneplan values (6, 2, 7);
insert into phoneplan values (7, 2, 6);
insert into phoneplan values (8, 3, 6);
insert into phoneplan values (9, 5, 7);
insert into phoneplan values (10, 4, 8);


-- cust
-- ----------------------------------------------------------------------------------
insert into cust values (1,'A');
insert into cust values (2,'B');
insert into cust values (3,'C');
insert into cust values (4,'D');
insert into cust values (5,'E');
insert into cust values (6,'F');
insert into cust values (7,'H');
insert into cust values (8,'G');
insert into cust values (9,'I');
insert into cust values (10,'L');
insert into cust values (11,'K');
insert into cust values (12,'A');
insert into cust values (13,'A');
insert into cust values (14,'B');
insert into cust values (15,'C');
insert into cust values (16,'Z');
insert into cust values (17,'M');
insert into cust values (18,'T');
insert into cust values (19,'R');
insert into cust values (20,'W');
insert into cust values (21,'Q');
insert into cust values (22,'P');
insert into cust values (23,'G');
insert into cust values (24,'N');
insert into cust values (25,'Z');
insert into cust values (26,'O');
insert into cust values (27,'L');
insert into cust values (28,'N');
insert into cust values (29,'W');
insert into cust values (30,'Y');


-- custphoneplan
-- ----------------------------------------------------------------------------------
insert into custphoneplan values (1, 2,2);
insert into custphoneplan values (2, 1,30);
insert into custphoneplan values (3, 6,9);
insert into custphoneplan values (4, 4,11);
insert into custphoneplan values (5, 9,22);
insert into custphoneplan values (6, 10,29);
insert into custphoneplan values (7, 7,3);
insert into custphoneplan values (8, 1,6);
insert into custphoneplan values (9, 2,27);
insert into custphoneplan values (10, 9,12);
insert into custphoneplan values (11, 7,4);
insert into custphoneplan values (12, 3,5);
insert into custphoneplan values (13, 2,10);
insert into custphoneplan values (14, 5,14);
insert into custphoneplan values (15, 6,13);
insert into custphoneplan values (16, 10,15);
insert into custphoneplan values (17, 1,16);
insert into custphoneplan values (18, 2,7);
insert into custphoneplan values (19, 3,17);
insert into custphoneplan values (20, 4,18);
insert into custphoneplan values (21, 5,19);
insert into custphoneplan values (22, 6,23);
insert into custphoneplan values (23, 7,21);
insert into custphoneplan values (24, 8,20);
insert into custphoneplan values (25, 9,24);
insert into custphoneplan values (26, 1,1);
insert into custphoneplan values (27, 7,28);
insert into custphoneplan values (28, 4,25);
insert into custphoneplan values (29, 5,8);
insert into custphoneplan values (30, 2,26);


-- billing
-- ----------------------------------------------------------------------------------
insert into billing values (1, 1, 2020, 'jan', 500, null);
insert into billing values (2, 1, 2020, 'feb', 300, null);
insert into billing values (3, 1, 2020, 'mar', 700, null);
insert into billing values (4, 2, 2020, 'jan', 1200, null);
insert into billing values (5, 2, 2020, 'feb', 800, null);
insert into billing values (6, 2, 2020, 'mar', 1000, null);
insert into billing values (7, 3, 2020, 'jan', 900, null);
insert into billing values (8, 3, 2020, 'feb', 1300, null);
insert into billing values (9, 3, 2020, 'jan', 1100, null);
insert into billing values (10, 4, 2020, 'jan', 1500, null);
insert into billing values (11, 4, 2020, 'feb', 1600, null);
insert into billing values (12, 4, 2020, 'mar', 900, null);
insert into billing values (13, 5, 2020, 'jan', 800, null);
insert into billing values (14, 5, 2020, 'feb', 600, null);
insert into billing values (15, 5, 2020, 'mar', 1000, null);
insert into billing values (16, 6, 2020, 'feb', 300, null);
insert into billing values (17, 6, 2020, 'jan', 1400, null);
insert into billing values (18, 6, 2020, 'mar', 1100, null);
insert into billing values (19, 7, 2020, 'jan', 1250, null);
insert into billing values (20, 7, 2020, 'feb', 1200, null);
insert into billing values (21, 7, 2020, 'mar', 1100, null);
insert into billing values (22, 8, 2020, 'jan', 2000, null);
insert into billing values (23, 8, 2020, 'feb', 1200, null);
insert into billing values (24, 8, 2020, 'mar', 1300, null);
insert into billing values (25, 9, 2020, 'jan', 1200, null);
insert into billing values (26, 9, 2020, 'feb', 1300, null);
insert into billing values (27, 9, 2020, 'mar', 900, null);
insert into billing values (28, 10, 2020, 'jan', 200, null);
insert into billing values (29, 10, 2020, 'feb', 200, null);
insert into billing values (30, 10, 2020, 'mar', 200, null);
insert into billing values (31, 11, 2020, 'jan', 1200, null);
insert into billing values (32, 11, 2020, 'feb', 1100, null);
insert into billing values (33, 12, 2020, 'mar', 1000, null);
insert into billing values (34, 12, 2020, 'jan', 1200, null);
insert into billing values (35, 12, 2020, 'feb', 1100, null);
insert into billing values (36, 13, 2020, 'mar', 1000, null);
insert into billing values (37, 13, 2020, 'jan', 1200, null);
insert into billing values (38, 13, 2020, 'feb', 1100, null);
insert into billing values (39, 4, 2020, 'mar', 1000, null);
insert into billing values (40, 14, 2020, 'jan', 1200, null);
insert into billing values (41, 14, 2020, 'feb', 1100, null);
insert into billing values (42, 15, 2020, 'mar', 1000, null);
insert into billing values (43, 15, 2020, 'jan', 1200, null);
insert into billing values (44, 15, 2020, 'feb', 1100, null);
insert into billing values (45, 16, 2020, 'mar', 1000, null);
insert into billing values (46, 16, 2020, 'jan', 1200, null);
insert into billing values (47, 16, 2020, 'feb', 1100, null);
insert into billing values (48, 17, 2020, 'mar', 1000, null);
insert into billing values (49, 17, 2020, 'jan', 1200, null);
insert into billing values (50, 17, 2020, 'feb', 1100, null);
insert into billing values (51, 18, 2020, 'mar', 1000, null);
insert into billing values (52, 18, 2020, 'jan', 1200, null);
insert into billing values (53, 18, 2020, 'feb', 1100, null);
insert into billing values (54, 19, 2020, 'mar', 1000, null);
insert into billing values (55, 19, 2020, 'jan', 1200, null);
insert into billing values (56, 19, 2020, 'feb', 1100, null);
insert into billing values (57, 20, 2020, 'mar', 1000, null);
insert into billing values (58, 20, 2020, 'jan', 1200, null);
insert into billing values (59, 20, 2020, 'feb', 1100, null);
insert into billing values (60, 21, 2020, 'mar', 1000, null);
insert into billing values (61, 21, 2020, 'jan', 1200, null);
insert into billing values (62, 21, 2020, 'feb', 1100, null);
insert into billing values (63, 22, 2020, 'mar', 1000, null);
insert into billing values (64, 22, 2020, 'jan', 1200, null);
insert into billing values (65, 22, 2020, 'feb', 1100, null);
insert into billing values (66, 23, 2020, 'mar', 1000, null);
insert into billing values (67, 23, 2020, 'jan', 1200, null);
insert into billing values (68, 23, 2020, 'feb', 1100, null);
insert into billing values (69, 24, 2020, 'mar', 1000, null);
insert into billing values (70, 24, 2020, 'jan', 1200, null);
insert into billing values (71, 24, 2020, 'feb', 1100, null);
insert into billing values (72, 25, 2020, 'mar', 1000, null);
insert into billing values (73, 25, 2020, 'jan', 1200, null);
insert into billing values (74, 25, 2020, 'feb', 1100, null);
insert into billing values (75, 26, 2020, 'mar', 1000, null);
insert into billing values (76, 26, 2020, 'jan', 1200, null);
insert into billing values (77, 26, 2020, 'feb', 1100, null);
insert into billing values (78, 27, 2020, 'mar', 1000, null);
insert into billing values (79, 27, 2020, 'jan', 1200, null);
insert into billing values (80, 27, 2020, 'feb', 1100, null);
insert into billing values (81, 28, 2020, 'mar', 1000, null);
insert into billing values (82, 28, 2020, 'jan', 1200, null);
insert into billing values (83, 28, 2020, 'feb', 1100, null);
insert into billing values (84, 29, 2020, 'mar', 1000, null);
insert into billing values (85, 29, 2020, 'jan', 1200, null);
insert into billing values (86, 29, 2020, 'feb', 1100, null);
insert into billing values (87, 30, 2020, 'mar', 1000, null);
insert into billing values (88, 30, 2020, 'jan', 1200, null);
insert into billing values (89, 30, 2020, 'feb', 1100, null);
insert into billing values (90, 11, 2020, 'mar', 1100, null);

commit;
