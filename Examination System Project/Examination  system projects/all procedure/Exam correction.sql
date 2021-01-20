
alter proc ExamCorrection @stdID int, @examId int
as
declare c1 cursor
for select esq.Ex_id,esq.Sid,esq.Qnum,esq.std_Ans,q.Model_Ans
from Exam_std_ques esq inner join Question q
on Q.Qnum=esQ.Qnum
where esq.Ex_id=@examId and Sid=@stdID

declare @Exam_ID int,@StudId int,@quesNum int ,@Student_Ans varchar(300),@Model_Ans varchar(300)
open c1
fetch c1 into @Exam_ID,@studId,@quesNum,@Student_Ans,@Model_Ans
while @@FETCH_STATUS=0
	begin
		declare @x int
		SELECT SOUNDEX(@Student_Ans) ,SOUNDEX(@Model_Ans) 
		select @x=DIFFERENCE(@Student_Ans,@Model_Ans);
		if @x=4
		begin
			update Exam_std_ques
			set std_Ques_grade =(select fullmark_grade from Question where Qnum=@quesNum)
			where Ex_id=@Exam_ID and Sid=@StudId and Qnum=@quesNum
		end
		else
		begin
		update Exam_std_ques
		set std_Ques_grade=0
		where Ex_id=@Exam_ID and Sid=@StudId and Qnum=@quesNum
		end
       fetch c1 into @Exam_ID,@studId,@quesNum,@Student_Ans,@Model_Ans
   end
close c1
deallocate c1

update student_course
set crs_grade=(select sum(std_Ques_grade) 
	from Exam_std_ques 
	where Ex_id=@examId and Sid=@stdID)
where Sid=@stdID and Cid =(select Crs_id 
					from Exam 
					where Ex_id = @examId )


ExamCorrection 1,12

