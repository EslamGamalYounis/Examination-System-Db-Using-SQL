alter proc student_ans @exam_num int , @std_id int
as
select Question.Qhead as Question ,Exam_std_ques.std_Ans as answer from  Question
inner join Exam_std_ques on  Question.Qnum = Exam_std_ques.Qnum
 where Exam_std_ques.Ex_id = @exam_num and Exam_std_ques.Sid =@std_id

 student_ans 12,1