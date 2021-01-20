
create proc selectInstructor  @ins_id int
with encryption
as
		select * 
		from Instructor
		where ins_id  = @ins_id 

selectInstructor 1


--------------------------------------------------------------------------------------
create proc insertInstructor @ins_id int, @ins_name varchar(50) , @D_num int 
with encryption
as
	begin try
		if not exists (select Ins_id from Instructor where ins_id=@ins_id)
		begin
			insert into Instructor
			values (@ins_id,@ins_name , @D_num)
		end
		else
			select 'Duplicate id'
	end try
	begin catch
		select 'ERROR'
	end catch

insertInstructor  13 ,'aya mustafa' , 1


------------------------------------------------------------------------------------------------------------


create proc updateInstructor @ins_id int, @ins_name varchar(50) , @D_num int 
with encryption
as
	begin try
	if  exists (select Ins_id from Instructor where Ins_id=@ins_id )
		begin
			update Instructor
			set ins_name=@ins_name,D_num=@D_num
			where Ins_id=@ins_id
		end
	else
		select 'Instrcture Id not found'
	end try
	begin catch
		Select 'Error'
	end catch

updateInstructor 13,'Aya Mousafa' ,3

-----------------------------------------------------------


create proc deleteInstructor @ins_id int
with encryption
as
	begin try
	if exists (select Ins_id from Instructor where Ins_id=@ins_id)
		begin
			delete from Instructor where 
			Ins_id=@ins_id
		end
	else
		select 'Instructor id not found'
	end try
	begin catch
		select 'ERROR'
	end catch

deleteInstructor 13