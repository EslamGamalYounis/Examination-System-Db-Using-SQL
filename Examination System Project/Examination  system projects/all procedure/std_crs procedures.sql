std_crs
____________________________

select:
_______

create Proc Getall @st_id int, @crs_id int
as
	select *
	from student_course
	where Sid = @st_id and Cid=@crs_id

Getall 1,1

___________________________________________________________

insert :
________

create proc insertStdCrs @st_id int,@Crs_id int,@grade int
as
begin try
	if not exists (select Sid from student_course where Sid=@st_id )
begin
	insert into student_course
		values (@st_id,@Crs_id,@grade)
	end
	else
		select 'Duplicate Student Id'
end try
begin catch
	Select 'error'
end catch

insertStdCrs 1,1,200

_______________________________________________________________

update:
_______

create Proc updateStdCrs @st_id int,@Crs_id int,@grade int
as
begin try
if  exists (select Sid,Cid from student_course where Sid=@st_id )
	begin
	update student_course
	 set Sid=@st_id,Cid=@Crs_id,Crs_grade=@grade
	 where Sid=@st_id and Cid=@Crs_id
	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch

updateStdCrs 1,1,1000

_____________________________________________________________________

Delete: 
_______

alter Proc deleteStdCrs @std_id int,@course_id int 
as
begin try
if  exists (select Sid,Cid from student_course where Sid=@std_id and Cid=@course_id)
	begin
		delete from student_course
		where  Sid=@std_id and Cid=@course_id
	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch

deleteStdCrs 10,3
