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

insert into PORTFOLIOS values (101,'imgTest1',);













