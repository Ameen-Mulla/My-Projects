create schema Healthcare;

Select * from healthcare.healthcare_dataset;

# Name, Age, Gender, Blood Type, Medical Condition, Date of Admission, Doctor, Hospital,
# Insurance Provider, Billing Amount, Room Number, Admission Type, Discharge Date, Medication, Test Results

alter table  healthcare.healthcare_dataset 
rename column `Name` to Patient_Name;
alter table  healthcare.healthcare_dataset 
rename column `Blood Type` to Blood_Type;
alter table  healthcare.healthcare_dataset 
rename column `Medical Condition` to Medical_Condition;
alter table  healthcare.healthcare_dataset 
rename column `Date of Admission` to Date_of_Admission;
alter table  healthcare.healthcare_dataset 
rename column `Insurance Provider` to Insurance_Provider;
alter table  healthcare.healthcare_dataset 
rename column `Billing Amount` to  Billing_Amount;
alter table  healthcare.healthcare_dataset 
rename column `Room Number` to Room_Number;
alter table  healthcare.healthcare_dataset 
rename column `Admission Type` to Admission_Type;
alter table  healthcare.healthcare_dataset 
rename column `Discharge Date` to Discharge_Date;
alter table  healthcare.healthcare_dataset 
rename column `Test Results` to Test_Results;
commit;

# Note : Removed spaces from the columns and changed it to using "_" to avoid error while refering columns.

#  Total Billing Amount per Insurance Provider.

select Insurance_Provider, round(sum(Billing_Amount),2) as  Total_Bill
from healthcare.healthcare_dataset
Group by Insurance_Provider
order by Total_Bill Desc;

#  Patients Admitted in the Last Year.

select *
from healthcare.healthcare_dataset
where year(Date_of_Admission) = 2023;


select *
from healthcare.healthcare_dataset
where year(Date_of_Admission) = year(curdate()- interval 1 year);


# Top 5 Doctors by Number of Patients.

select Doctor,count(*) As Patient_count
from healthcare.healthcare_dataset
group by Doctor
order by Patient_count Desc
Limit 5;

# Write an SQL query to find the highest Paid Hopsitals.

select 
Hospital, round(sum(billing_amount)) as total_amount_paid
from healthcare.healthcare_dataset
group by hospital
order by total_amount_paid desc
Limit 5;

# Top 10 insure provider with amount paid.

select
Insurance_Provider,round(sum(Billing_Amount)) as Paid_amount
from healthcare.healthcare_dataset
group by Insurance_Provider
order by Paid_amount desc
Limit 10;

# Find the Patient details who admitted on 01-01-2024.
 
select Patient_Name,Date_of_Admission
from healthcare.healthcare_dataset
where Date_of_Admission = '2024-01-01';

# Prevoius Month report.

select *
from healthcare.healthcare_dataset
where Date_of_Admission between '2024-01-01' and '2024-01-31';

# Prev month patient details.

select *
from healthcare.healthcare_dataset
where Date_of_Admission >= date_format((curdate() - interval 1 month),'%Y-%M-01')
and Date_of_Admission < date_format ((curdate()- interval 1 month ),'%Y-%M-31');




