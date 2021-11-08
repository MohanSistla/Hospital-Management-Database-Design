-- Selecting firstname and last name of doctor associated with inpatient where days of stay is atleast 6 days.

select Hospital_Employees.givename, Hospital_Employees.surname 
from Hospital_Employees,Patient_Admission,Doctors 
where Hospital_Employees.Employee_id = Doctors.Employee_id and 
Doctors.Dept_ID = Patient_Admission.Dept_ID 
and Patient_Admission.Patient_ID in (select Inpatient.Patient_ID from Inpatient where Inpatient.Stay_days>=6); 

-- Finding the bill number,patient id and associated doctor of the inpatient patients who payed the amount more than 1500 using insurance mode of payment
-- with more than 5 stay days .

select bill.Billno,bill.Patient_ID,doctors.Doctor_id from bill,inpatient,patient_admission,doctors,hospital_employees 
where bill.Patient_ID = inpatient.Patient_ID and Inpatient.Patient_ID = patient_admission.Patient_ID 
and patient_admission.Dept_ID = doctors.Dept_ID and doctors.Employee_id = hospital_employees.Employee_id
and bill.Billno = (select bill.Billno from bill where bill.TotalAmount > 1500 and bill.Payment_Mode = 'Insurance') and inpatient.Stay_days >5;

-- Calculating the department which generates maximum bill.

select department.Dept_ID,department.Department_name,sum(bill.TotalAmount) as total_amount from department,bill,patient_admission 
where bill.Patient_ID = patient_admission.Patient_ID and 
patient_admission.Dept_ID = department.Dept_ID group by department.Department_name order by total_amount desc limit 1;

-- If Extra 200 dollars is charged per stay day for an inpatient, calculating the total amount to be paid by respective inpatient patients.

select inpatient.Patient_ID, ((inpatient.Stay_days*200) + bill.TotalAmount) as New_payment from bill natural join inpatient;

-- Finding room numbers where inpatient who have paid more than $2000 in insurance are admitted

select rooms.Room_no from rooms,patient_admission,bill,inpatient where 
bill.Patient_ID = inpatient.Patient_ID and inpatient.Patient_ID = patient_admission.Patient_ID and
patient_admission.Dept_ID = rooms.Dept_id having sum(bill.TotalAmount)>2000 and bill.Payment_Mode = 'Insurance';

-- Calculating total working hours ordered from largest to smallest of doctors associated with each department  .

select department.Dept_ID, department.Department_name, sum(doctors.Working_hours) as Total_Hours 
from doctors,department where doctors.Dept_ID = department.Dept_ID 
group by department.Department_name order by Total_Hours desc;

-- Finding the doctors who have treated outpatient patients who did not prescribe the revisit date 

select doctors.Doctor_id from doctors,patient_admission,outpatient 
where doctors.Dept_ID = patient_admission.Dept_ID and patient_admission.Patient_ID = outpatient.Patient_ID
and outpatient.Revisit_Date is NULL;

--Finding the patient names who are born after 1985

select doctors.Doctor_id from doctors where strftime('%y',Date_of_join) >2010;

-- Finding rooms associated with inpatient patients

select rooms.Room_no from rooms,inpatient,patient_admission 
where inpatient.Patient_ID = patient_admission.Patient_ID and patient_admission.Dept_ID = rooms.Dept_id;

-- Finding number patients associated with each department

select department.Dept_ID,department.Department_name,count(patient_admission.Patient_ID) 
from patient_admission,department where patient_admission.Dept_ID = department.Dept_ID group by department.Dept_ID,department.Department_name;