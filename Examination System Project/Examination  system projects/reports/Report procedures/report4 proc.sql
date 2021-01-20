create proc GetTopics @CourseID int
as
	select Topic_id as [Topic Id],
		Topic_name as [Topic Name],
		Crs_id as [course Id]
		from Topic
		where Crs_id=@CourseID

GetTopics 1