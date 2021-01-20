/*select department*/

create proc selectDepartment @Dnum int
with encryption
as
		select * 
		from Department
		where Dnum = @Dnum


selectDepartment 1
--------------------------------------------------------
/*insert department*/

create proc insertDepartment @DeptNum int,@DeptName varchar(50)
with encryption
as
	begin try
		if not exists (select Dnum from Department where Dnum=@DeptNum)
		begin
			insert into Department
			values (@DeptNum,@DeptName)
		end
		else
			select 'Duplicate id'
	end try
	begin catch
		select 'ERROR'
	end catch

insertDepartment 12,'Dept5'

--------------------------------------------------------
/*update department*/

create proc updateDepartment @DeptNum int,@DeptName varchar(50) 
with encryption
as
	begin try
	if  exists (select Dnum from Department where Dnum=@DeptNum )
		begin
			update Department
			set Dname=@DeptName,Dnum=@DeptNum
			where Dnum=@DeptNum
		end
	else
		select 'Dpartment Id not found'
	end try
	begin catch
		Select 'Error'
	end catch

updateDepartment 12,'Dept5Update'

-----------------------------------------------------------
/*delete department*/

create proc deleteDepartment @DeptNum int
with encryption
as
	begin try
	if exists (select Dnum from Department where Dnum=@DeptNum)
		begin
			delete from Department where 
			Dnum=@DeptNum
		end
	else
		select 'Department num not found'
	end try
	begin catch
		select 'ERROR'
	end catch

deleteDepartment 12



		








