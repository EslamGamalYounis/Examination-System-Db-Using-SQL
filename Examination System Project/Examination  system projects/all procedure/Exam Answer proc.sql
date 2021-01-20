create proc ExamAnswers @std_Id int,@examId int,@Qnum int,@Answer varchar(300)
as
	if exists(select Sid from Student where Sid=@std_Id)
	begin
	if exists(select Ex_id from Exam where Ex_id=@examId)
	begin
	if exists(select Qnum from Question where Qnum=@Qnum)
	begin
	insert into Exam_std_ques(Sid,Ex_id,Qnum,std_Ans)
	values(@std_Id,@examId,@Qnum,@Answer)
	end
	else
	select 'Question num not found'
	end
	else
	select 'Exam id not found'
	end
	else
	select 'student id not found'

ExamAnswers 1,12,45,'eeeeeeeeee'