------------------------------------------------------------------------------------------
--Question_choice table
-- select topic proc
create Proc selectQuestionChoice @QuesNum int,@choiceNum int
as
	select *
	from Question_choice
	where Qnum = @QuesNum and ChoiceNum=@choiceNum

selectQuestionChoice 1,1


--insert into QuesChoice
create Proc insertQuestionChoice  @QuesNum int,@choiceNum int,@chiceBody varchar(300)
as
begin try
if not exists (select Qnum,ChoiceNum from Question_choice where Qnum=@QuesNum and ChoiceNum=@QuesNum  )
	begin
	insert into Question_choice
	values (@QuesNum,@choiceNum,@chiceBody)
	end
	else
		select 'Duplicate Topic Id'
end try
begin catch
	Select 'error'
end catch

insertQuestionChoice 61,1,'aaaaaaaaaaa'

-- update QuestionChoice

create Proc updateQuestionChoice  @QuesNum int,@choiceNum int,@chiceBody varchar(300)
as
begin try
if  exists (select Qnum,ChoiceNum from Question_choice where Qnum=@QuesNum and ChoiceNum=@QuesNum)
	begin
	update Question_choice
	 set ChoiceBody=@chiceBody
	 where Qnum=@QuesNum and ChoiceNum=@QuesNum
	end
	else
		select 'Question num or choice num not found'
end try
begin catch
	Select 'error'
end catch

updateQuestionChoice 1,1,'bbbbbbbbbbbbbbb'

--delete from QuestionChoice
create Proc deleteQuesChoice @QuesNum int, @ChoiceNum int
as
begin try
if  exists (select Qnum,ChoiceNum from Question_choice where Qnum=@QuesNum and ChoiceNum=@ChoiceNum )
	begin
		delete from Question_choice
		where Qnum=@QuesNum and ChoiceNum=@ChoiceNum
	end
	else
		select 'Question num or choice num not found'
end try
begin catch
	Select 'error'
end catch

deleteQuesChoice 61,1
