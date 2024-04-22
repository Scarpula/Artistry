select * from MEMBERS;

select * from PAYMENTS;

create sequence payment_num
start with 1
increment by 1;

insert into PAYMENTS values (4,
								'admin',
								1,
								1,
								'test1',
								1,
								'test1',
								sysdate);
						
								
select * from payments where mb_email='admin' order by pay_idx desc;