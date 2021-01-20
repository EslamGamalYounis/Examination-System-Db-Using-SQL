/*select  Course Instructor */

alter proc selectCoursesInstuctor @Ins_Id int
with encryption
as
		select Ins_id,C.Cname
		from course_instructor CI inner Join Course C
		on CI.C_id = C.Cid and Ins_id = @Ins_Id
		


selectCoursesInstuctor 2
--------------------------------------------------------
/*insert Course Instructor */

alter proc InsertCoursesInstuctor @Ins_Id int , @CourseId int
with encryption
as
	begin try
	if exists (select Cid from Course where Cid=@CourseId)
	begin
		if @CourseId not in (select C_id from course_instructor where Ins_id =@Ins_Id )
		begin
			insert into course_instructor
			values(@Ins_Id,@CourseId)
		end
		else 
			select 'Course already set to this instructor'
	end
	else
		select 'the course id is not found'
	end try
	begin catch
		select 'ERROR'
	end catch
	

InsertCoursesInstuctor 10,5

--------------------------------------------------------
/*update Course Instructor */

alter proc updateCoursesInstuctor @Ins_Id int , @CourseId int ,@newCourceID int
with encryption
as
	begin try
	if exists (select Cid from Course where Cid=@newCourceID)
	begin
		if @CourseId in (select C_id from course_instructor where Ins_id =@Ins_Id )
		begin
			update  course_instructor
			set C_id =@newCourceID
			where Ins_id =@Ins_Id and C_id=@CourseId
		end
		else 
			select 'Course already set to this instructor'
	end
	else
		select 'the course id is not found'
	end try
	begin catch
		select 'ERROR'
	end catch

	

updateCoursesInstuctor 10,5,3

-----------------------------------------------------------
/*delete Course Instructor */

create proc deleteCoursesInstuctor @Ins_Id int,@Cid int
with encryption
as
	begin try
	if exists (select Ins_id from course_instructor where Ins_id=@Ins_Id)
		begin
			delete from course_instructor where 
			Ins_id=@Ins_Id and C_id=@Cid
		end
	else
		select 'Instructor id not found'
	end try
	begin catch
		select 'ERROR'
	end catch

deleteCoursesInstuctor 10,3



		








