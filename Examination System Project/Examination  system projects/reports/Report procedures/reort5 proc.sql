use [Examination system]

alter proc get_ques @exam_num int 
as
select Question.Qhead as Questions from  Question
inner join Exam_Ques on  Question.Qnum =Exam_Ques.Qnum
 where Exam_Ques.Ex_id = @exam_num 

get_ques 12