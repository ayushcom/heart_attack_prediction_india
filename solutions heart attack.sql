# 1)Retrieve all patient details from Maharashtra

SELECT 
    *
FROM
    heart_attack_prediction_india
WHERE
    State_Name = 'Maharashtra';
    
# 2)Count the number of male and female patients

 SELECT 
    Gender, COUNT(*) AS Count
FROM
    heart_attack_prediction_india
GROUP BY Gender;   

# 3)Find the average age of patients

SELECT 
    AVG(Age) AS Average_Age
FROM
    heart_attack_prediction_india;

# 4)Find patients with high cholesterol levels (above 200)

SELECT 
    *
FROM
    heart_attack_prediction_india
WHERE
    Cholesterol_Level > 200;
    
# 5)List unique states in the dataset

SELECT DISTINCT
    State_Name
FROM
    heart_attack_prediction_india;
    
# 6)Find the top 5 states with the highest number of heart attack cases

SELECT 
    State_Name, COUNT(*) AS Heart_Attack_Count
FROM
    heart_attack_prediction_india
WHERE
    Heart_Attack_History = 1
GROUP BY State_Name
ORDER BY Heart_Attack_Count DESC
LIMIT 5;

#7) Find patients who have both diabetes and hypertension

SELECT 
    patient_id, State_Name,age,gender,Diabetes,Hypertension
FROM
    heart_attack_prediction_india
WHERE
    Diabetes = 1 AND Hypertension = 1;

#8) Rank patients based on their cholesterol level within each state

SELECT Patient_ID, State_Name, Cholesterol_Level,
RANK() OVER (PARTITION BY State_Name ORDER BY Cholesterol_Level DESC) AS Cholesterol_Rank
FROM heart_attack_prediction_india;

#9) Find patients older than the average age in the dataset

SELECT 
    *
FROM
    heart_attack_prediction_india
WHERE
    Age > (SELECT 
            AVG(Age)
        FROM
            heart_attack_prediction_india);
            
#10) Find the total number of patients in each state and sort them in descending order

SELECT 
    State_Name, COUNT(*) AS Patient_Count
FROM
    heart_attack_prediction_india
GROUP BY State_Name
ORDER BY Patient_Count DESC;

#11) Find the percentage of patients at high heart attack risk in each state

SELECT 
    State_Name,
    COUNT(CASE
        WHEN Heart_Attack_Risk = 1 THEN 1
    END) * 100.0 / COUNT(*) AS Risk_Percentage
FROM
    heart_attack_prediction_india
GROUP BY State_Name;


#12 )Find the state with the highest average emergency response time

SELECT 
    State_Name,
    AVG(Emergency_Response_Time) AS Avg_Response_Time
FROM
    heart_attack_prediction_india
GROUP BY State_Name
ORDER BY Avg_Response_Time DESC
LIMIT 1;
    

#13) Classify patients into income brackets (Low, Medium, High) based on their Annual Income

SELECT 
    Patient_ID,
    Annual_Income,
    CASE
        WHEN Annual_Income < 500000 THEN 'Low'
        WHEN Annual_Income BETWEEN 500000 AND 1500000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Bracket
FROM
    heart_attack_prediction_india;