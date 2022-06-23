use studentTestAsus;
CREATE VIEW DSdiemthi AS
select student.name,test.name nametest,studenttest.mark,studenttest.date1
from studentTest join test on studentTest.testid = test.testId join student  on studentTest.RN = student.RN;
select * from student
where not exists (select * from studenttest where student.RN = studenttest.RN);
select s.name,t.Name,st.mark,st.date1
from studenttest st join test t on st.testid = t.testid join student s on st.RN = s.RN
where st.mark < 5;
create view dsiemtrungbinh AS
select Student.name,avg(mark) as 'trungbinh'
from studenttest join student  on studenttest.RN = student.RN
group by name ;
select dsdiemtrungbinh.name,max(dsdiemtrungbinh.trungbinh) as 'diem cao nhat'
from dsdiemtrungbinh;
select dsdiemthi.nametest,max(mark) as 'diem cao nhat'
from dsdiemthi
group by dsdiemthi.nametest
order by  dsdiemthi.Nametest ASC;
update student set age = age + 1
where RN >0;
alter table student add status varchar(10);
update student set status = 'young'
where Age < 30 and RN>0;
update student set status = 'old'
where Age >= 30 and RN>0;