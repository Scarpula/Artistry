select * from MEMBERS;

select * from PAYMENTS;

create sequence payment_num
start with 1
increment by 1;

insert into PAYMENTS values (5,
								'admin',
								1,
								1,
								'test1',
								1,
								'test if pay memo is to long how it does look like... these are meanless sentence...',
								sysdate);
						
								
select * from payments where mb_email='admin' order by pay_idx desc;





select * from Chat_room;

insert into chat_room values (1, 'admin', 'test_room1', 'test_room1', 1, sysdate, 'F');
insert into chat_room values (2, 'admin', 'test_room2', 'test_room2', 1, sysdate, 'F');
insert into chat_room values (3, 'admin', 'test_room3', 'test_room3', 1, sysdate, 'F');
insert into chat_room values (4, 'admin', 'test_room4', 'test_room4', 1, sysdate, 'F');

update MEMBERS set mb_type = 0 where mb_email = 'admin';

delete MEMBERS where mb_email != 'admin';

insert into members values ('imgTest5','imgTest5','imgTest5','imgTest5','imgTest5','imgTest5',null,'imgTest5',sysdate,0);

select * from PORTFOLIOS;

insert into PORTFOLIOS values (103,'imgTest1','../portfolio_img/3.jpg','emoji3','emoji',sysdate,'test3');
insert into PORTFOLIOS values (104,'imgTest1','../portfolio_img/4.jpg','emoji4','emoji',sysdate,'test4');
insert into PORTFOLIOS values (105,'imgTest1','../portfolio_img/5.jpg','emoji5','emoji',sysdate,'test5');
insert into PORTFOLIOS values (106,'imgTest1','../portfolio_img/6.jpg','emoji6','emoji',sysdate,'test6');
insert into PORTFOLIOS values (107,'imgTest1','../portfolio_img/7.jpg','emoji7','emoji',sysdate,'test7');
insert into PORTFOLIOS values (108,'imgTest1','../portfolio_img/8.jpg','emoji8','emoji',sysdate,'test8');
insert into PORTFOLIOS values (109,'imgTest1','../portfolio_img/9.jpg','emoji9','emoji',sysdate,'test9');
insert into PORTFOLIOS values (110,'imgTest1','../portfolio_img/10.jpg','emoji10','emoji',sysdate,'test10');













