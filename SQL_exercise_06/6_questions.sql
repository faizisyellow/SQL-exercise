-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists

   use sql_exercises;

-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
	SELECT * FROM Scientists JOIN AssignedTo ON Scientists.SSN = AssignedTo.Scientist JOIN Projects ON AssignedTo.Project = Projects.Code ORDER BY Projects.Name,Scientists.Name;

-- 6.2 Select the project names which are not assigned yet
	SELECT * FROM Projects WHERE Code NOT IN(SELECT Project FROM AssignedTo);