create proc getStdInfo @DepartmentNo int
as
	select Sid as [Student ID],
	 Sname as [Student Name],
	 Email as [Student Email],
	 Dnum as [Department No]
	from Student
	where Dnum=@DepartmentNo

getStdInfo 3
