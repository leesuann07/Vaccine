-- 1
create table tbl_cust(
	p_no char(4) primary key,
	p_name varchar2(20),
	p_birth char(8),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4),
	p_city char(2),
	p_gender char(1)
);
-- 2
create table tbl_order(
	p_seno number(8) primary key,
	i_code char(4),
	p_no char(4),
	p_date date
);
-- 3
create table tbl_injection(
	i_code char(4) primary key,
	i_name varchar(20),
	i_age varchar(20)
);
-- 4
insert into tbl_cust values('0001','홍길동','19910113','010','1234','5678','10','M');
insert into tbl_cust values('0002','김길동','19900113','010','1234','5678','10','M');
insert into tbl_cust values('0003','박길동','19900113','010','1234','5678','10','M');
insert into tbl_cust values('0004','홍길순','19930113','010','1234','5678','10','M');
insert into tbl_cust values('0005','홍동순','19900125','010','1234','5678','10','M');
insert into tbl_cust values('0006','홍민민','19950113','010','1234','5678','10','M');

-- 5
insert into tbl_order values(20000001,'1111','0001','20190101');
insert into tbl_order values(20000002,'1111','0002','20190102');
insert into tbl_order values(20000003,'2222','0003','20190103');

-- 6
insert into tbl_injection values('1111','vacc1','20-30');
insert into tbl_injection values('2222','vacc2','10-20');
insert into tbl_injection values('3333','vacc3','30-40');
insert into tbl_injection values('4444','vacc4','50-60');
insert into tbl_injection values('5555','vacc5','70-80');


-- 7
select * from tbl_cust;


-- 8
select b.i_code, i_name, count(*) as cnt
from tbl_order a,tbl_injection b
where a.i_code = b.i_code
group by (b.i_code, i_name)
order by cnt desc;

--9
select substr(p_seno,1,4)|| '-'|| substr(p_seno,5,4) p_seno,a.p_no,p_name,c.i_code,i_name,TO_CHAR(p_date,'YYYY-MM-DD') as p_date  
from tbl_cust a, tbl_order b , tbl_injection c
where a.p_no = b.p_no and b.i_code = c.i_code;

select p_no, p_name, (substr(p_birth,1,4) || '년' || substr(p_birth,5,2) || '월' || substr(p_birth,7,2) || '일') p_birth ,(p_tel1 || '-' || p_tel2 || '-' || p_tel3)p_tel, decode(p_gender,'M','남','F','여') p_gender,
decode(p_city,'10','서울','20','경기','30','부산','40','대구') p_city from tbl_cust order by p_no;
