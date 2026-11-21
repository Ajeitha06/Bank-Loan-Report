Select count(id) as total_application from finl_loan;
UPDATE finl_loan
SET issue_date = DATE_FORMAT(
    STR_TO_DATE(issue_date, '%d-%m-%Y'),
    '%Y-%m-%d'
);
ALTER TABLE finl_loan
MODIFY COLUMN issue_date DATE;
select count(id) as total_applications from finl_loan
where month(issue_date)=12;
Select count(id) as total_application from finl_loan
where month(issue_date)=11;
## Total funded amount
select sum(loan_amount) as total_funded_amount from finl_loan;
Select sum(loan_amount) as total_funded_amount from finl_loan 
where month(issue_date)=12;
Select sum(loan_amount) as total_funded_amount from finl_loan
where month(issue_date)=11;
## Total Amount Recieved
Select sum(total_payment) as Total_Amount_Recieved from finl_loan;
Select sum(total_payment) as Total_Amount_Recieved from finl_loan
Where month(issue_date)=12;
Select sum(total_payment) as Total_Amount_Recieved from finl_loan
Where month(issue_date)=11;
## Average int rate
Select avg(int_rate)*100 as avg_int_rate from finl_loan;
Select avg(int_rate)*100 as avg_int_rate from finl_loan 
where month(issue_date)=12;
Select avg(int_rate)*100 as avg_int_rate from finl_loan
where month (issue_date)=11;
## Avg DTI
Select avg(dti)*100 as avg_dti from finl_loan;
select avg(dti)*100 as avg_dti from finl_loan
where month(issue_date)=12;
select avg(dti)*100 as avg_dti from finl_loan
where month(issue_date)=11;
## Good Loan issued
select 
   (count(case when loan_status ='Fully Paid' or loan_status = 'Current' then id end)*100)/count(id) as good_loan_Percentage
   From finl_loan;
Select count(id) as good_loan_application from finl_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';
Select sum(loan_amount) as good_funded_amount from finl_loan
where loan_status ='Fully Paid' or loan_status = 'Current';
select sum(total_payment) as good_loan_received from finl_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';
## Bad Loan 
select 
   (count(case when loan_status ='Charged Off'  then id end)*100)/count(id) as bad_loan_Percentage
   From finl_loan;
   Select count(id) as good_loan_application from finl_loan
where loan_status = 'Charged Off';
Select sum(loan_amount) as good_funded_amount from finl_loan
where loan_status ='Charged Off';
select sum(total_payment) as good_loan_received from finl_loan
where loan_status = 'Charged Off';
## Loan Status
Select 
loan_status,
count(id) as Total_Application,
sum(total_payment) as Total_Amount_Received,
sum(Loan_amount)as total_funded_amount,
Avg(int_rate)as Int_rate,
Avg(dti)as DTI
from 
finl_loan
group by loan_status;

Select 
 loan_status,
 sum(total_payment) as MTD_Total_Amount_Received,
 sum(loan_amount) as MTD_Total_Funded_Amount
 from finl_loan
 where month(issue_date)=12
 group by loan_status;
 
 ## Month
 Select 
   Month(issue_date) As Month_Number,
   monthname(issue_date) As Month_Name,
   Count(id) As Total_Loan_Application,
   Sum(loan_amount)As Total_Funded_Amount,
   sum(total_payment)As Total_Amount_Received
   From finl_loan
   group by month(issue_date), monthname(issue_date)
   order by month(issue_date);
   
## State

Select
  address_state as State,
  count(id) as Total_Loan_Application,
  Sum(loan_amount) as Total_Funded_Amount,
  Sum(total_payment) as Total_Amount_Received
  From finl_loan
  group by address_state
  order by address_state;
  
  ## Term
  select	
     term As term,
     count(id) As Total_Loan_Application,
     sum(loan_amount) As Total_Funded_Amount,
     sum(total_payment) As Total_Amount_Received
     from finl_loan
     group by term
     order by term;
     
     ## Employee Length
     Select 
      emp_length as Employee_length,
      count(id) as Total_Loan_Application,
      Sum(loan_amount) as Total_Funded_Amount,
      Sum(total_payment) as Total_Amount_Received
      From finl_loan
      group by emp_length
      order by emp_length;
      
	## Purpose
    select
      purpose as Purpose,
      count(id) as Total_Loan_Application,
      sum(loan_amount) as Total_Funded_Amount,
      sum(total_payment) as Total_Amount_Received
      from finl_loan
      group by purpose
      order by purpose;
      
      ## Home Ownership
      select 
       home_ownership as Home_Ownership,
       count(id) as Total_Loan_Application,
       sum(loan_amount) as Total_Funded_Amount,
       sum(total_payment) as Total_Amount_Received
       from finl_loan
       group by home_ownership
       order by home_ownership;