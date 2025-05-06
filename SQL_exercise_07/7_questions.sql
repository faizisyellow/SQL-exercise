-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 

 use sql_exercises;

-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
		SELECT Client.Name FROM Client JOIN Package ON Client.AccountNumber=Package.Recipient AND Package.Weight=1.5; 
    
-- 7.2 What is the total weight of all the packages that he sent?
		SELECT SUM(Weight) FROM Package WHERE Package.Sender=(SELECT AccountNumber FROM Client WHERE Name='Al Gore\'s Head');
		
