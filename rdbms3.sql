select* from emp;
insert into emp values(1,'Suk',1000);
insert into emp values(2,'Hirock',2000);


CREATE PROCEDURE increse_sal (
     @employee_number INT,
     @salary_increase DECIMAL(10, 2)
)
as BEGIN
    UPDATE emp
    SET sal = sal + @salary_increase
    WHERE id = @employee_number;
END;

EXEC increse_sal @employee_number=1, @salary_increase= 1000.00;
