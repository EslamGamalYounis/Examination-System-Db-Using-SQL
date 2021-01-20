alter proc Report3  @instructorId int
as
	select c.Cname AS [course name] ,count(sc.Sid) [No of student]
	from Course c inner join course_instructor CI
	on c.Cid = CI.C_id
	inner join student_course sc
	on sc.Cid=c.Cid
	where CI.Ins_id= @instructorId
	group by c.Cname

Report3 1



	