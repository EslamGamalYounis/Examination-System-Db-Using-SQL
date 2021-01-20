use [Examination system]

-- select topic proc
create Proc selectTopic @TopicId int
as
	select *
	from Topic
	where Topic_id = @TopicId

selectTopic 1	

--insert into topic
create Proc insertTopic @TopicId int,@TopicName varchar(50),@courseId int
as
begin try
if not exists (select Topic_id from Topic where Topic_id=@TopicId )
	begin
	insert into Topic
	values (@TopicId,@TopicName,@courseId)
	end
	else
		select 'Duplicate Topic Id'
end try
begin catch
	Select 'error'
end catch

insertTopic 11,'Text',1

-- update Topic

create Proc updateTopic @TopicId int,@TopicName varchar(50),@courseId int
as
begin try
if  exists (select Topic_id from Topic where Topic_id=@TopicId )
	begin
	update Topic
	 set Topic_name=@TopicName,Crs_id=@courseId
	 where Topic_id=@TopicId
	end
	else
		select 'Topic Id not found'
end try
begin catch
	Select 'error'
end catch

updateTopic 11,'video',1

--delete from topic
create Proc deleteTopic @TopicId int
as
begin try
if  exists (select Topic_id from Topic where Topic_id=@TopicId )
	begin
		delete from Topic
		where Topic_id=@TopicId
	end
	else
		select 'Topic Id not found'
end try
begin catch
	Select 'error'
end catch

deleteTopic 11

