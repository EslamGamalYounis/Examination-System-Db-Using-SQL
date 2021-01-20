--course
create proc selectcourse  @cid int
with encryption
as
		select * 
		from Course
		where Cid = @cid


selectcourse  1

----
create proc insertcourse @cid int,@cname varchar(50)
with encryption
as
	begin try
		if not exists (select cid from Course where Cid=@cid)
		begin
			insert into Course
			values (@cid,@cname)
		end
		else
			select 'Duplicate id'
	end try
	begin catch
		select 'ERROR'
	end catch

insertcourse 4,'c#'



--------------

create proc updatecourse @cid int,@cname varchar(50) 
with encryption
as
	begin try
	if  exists (select Cid from Course where Cid=@cid )
		begin
			update Course
			set Cname=@cname,Cid=@cid
			where Cid=@cid
		end
	else
		select 'course Id not found'
	end try
	begin catch
		Select 'Error'
	end catch

updatecourse 4,'c++'



---------------------

create proc deletecourse @cid int
with encryption
as
	begin try
	if exists (select Cid from Course where Cid=@cid)
		begin
			delete from Course where 
			Cid=@cid
		end
	else
		select 'course id not found'
	end try
	begin catch
		select 'ERROR'
	end catch

deletecourse 4
