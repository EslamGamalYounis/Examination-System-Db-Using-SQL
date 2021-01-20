use [Examination system]
create proc getStudentGrade @student_Id int
with encryption
as	
	if exists(select Sid from Student where Sid=@student_Id)
	begin
		select C.Cname,SC.crs_grade
		from student_course SC
		inner join Course C 
		on SC.Cid =C.Cid and SC.Sid= @student_Id
	end
	else
		select 'this student is not found'

getStudentGrade 1
	


	