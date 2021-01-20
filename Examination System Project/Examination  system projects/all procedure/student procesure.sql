Student
-------
--select :

create Proc GetStd @st_id int
as
	select *
	from Student
	where Sid = @st_id

GetStd 1	

-----------------------------------
--insert :

alter proc insertStudent @st_id int,@st_name varchar(30),@st_Email varchar(40),@Dno int,@Pass varchar(50)
as
begin try
	if not exists (select Sid from Student where Sid=@st_id )
begin
	insert into Student
		values (@st_id,@st_name,@st_Email,@Pass,@Dno)
	end
	else
		select 'Duplicate Student Id'
end try
begin catch
	Select 'error'
end catch

insertStudent 4,'laila','lailasamir2020@gmail.com','12345',1
------------------------------------

create Proc Stupdate @st_id int,@st_name varchar(30),@st_Email varchar(40),@Pass varchar(50),@Dno int
as
begin try
if  exists (select Sid from Student where Sid=@st_id )
	begin
	update Student
	 set Sname=@st_name,Email=@st_Email,password=@Pass,Dnum=@Dno
	 where Sid=@st_id
	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch

Stupdate 4,'laila','laila@gmail.com','12345',1


------------------------------------
Delete:

create Proc StDelete @st_id int
as
begin try
if  exists (select Sid from Student where Sid=@st_id )
	begin
		delete from Student
		where Sid=@st_id
	end
	else
		select 'Student Id is not found'
end try
begin catch
	Select 'error'
end catch