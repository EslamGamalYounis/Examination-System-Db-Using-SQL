-- select Question proc
create Proc selectQuestion @QNum int
as
	select *
	from Question
	where Qnum = @QNum

selectQuestion 3	

--insert into Question
create Proc insertQuestion @Qnum int,@QType varchar(5),@Qhead varchar(300),@Model_Ans varchar(50),@fullmark_grade int,@Cid int
with encryption
as
begin try
if not exists (select Qnum from Question where Qnum=@Qnum )
	begin
	insert into Question
	values (@Qnum,@QType,@Qhead,@Model_Ans,@fullmark_grade,@Cid)
	end
	else
		select 'Duplicate Question Num'
end try
begin catch
	Select 'error'
end catch

insertQuestion 65,'MCQ','what is the property that change text color in css','color',5,3

-- update Question

create Proc updateQuestion @Qnum int,@QType varchar(5),@Qhead varchar(300),@Model_Ans varchar(50),@fullmark_grade int,@Cid int
with encryption
as
	begin try
	if  exists (select Qnum from Question where Qnum=@Qnum )
		begin
		update Question
		set Qnum=@Qnum,Qtype=@QType,
		Qhead=@Qhead,Model_Ans=@Model_Ans,
		fullmark_grade=@fullmark_grade,Cid=@Cid
		where Qnum=@Qnum
		end
	else
		select 'Question Num Not Found'
	end try
	begin catch
		Select 'ERROR'
	end catch

updateQuestion 65,'MCQ','what is the property that change text color in css','color',4,1

--delete from Question
create Proc deleteQuestion @Qnum int
with encryption
as
	begin try
	if  exists (select Qnum from Question where Qnum=@Qnum )
	begin
		delete from Question
		where Qnum=@Qnum
	end
	else
		select 'Question Num Not Found'
	end try
	begin catch
		Select 'error'
	end catch

deleteQuestion 65
--sp_helptext 'deleteQuestion'