alter proc GenerateExam @ExamId int ,@courseName varchar(50),@NoOfMCQ int ,@NoOfTF int 
as
	if exists (select Ex_id from Exam where Ex_id=@ExamId)
	select 'there is already this ID '
	else
	begin
	if @NoOfTF+@NoOfMCQ =10
	begin
	
	if exists(select Cid from Course where Cname=@courseName)
	begin
	declare @Cid int
	select @Cid=Cid 
	from Course
	where Cname=@courseName

	insert into Exam (Ex_id,NoOfMCQ,NoOfTF,Crs_id)
	values(@ExamId,@NoOfMCQ,@NoOfTF,@Cid)
	
	
	
	insert into Exam_Ques(Qnum,Ex_id)
	select top(@NoOfMCQ)Qnum,@ExamId
	from question
	where Qtype='MCQ' and Cid=@Cid
	order by newid()

	insert into Exam_Ques(Qnum,Ex_id)
	select top(@NoOfTF)Qnum,@ExamId
	from question
	where Qtype='T/F' and Cid=@Cid
	order by newid()
	end
	else
	select 'This course is not found'
	end
	else
	select 'No of questions must be 10'
	end
GenerateExam 12,'javascript',3,7 