create table credit_proposal
(
c_id varchar2(50),
prop_id varchar2(50) unique,
crd_prop_sts_code varchar2(50),
created_date date,
action_date date,
action_by varchar2(50),
prop_san varchar2(10)
);

create table customer_det
(
c_id varchar2(50) primary key,
first_name varchar2(50),
middle_name varchar2(50),
last_name varchar2(50),
address varchar2(100),
city varchar2(50),
state varchar2(50),
country varchar2(50),
zip_code number,
email varchar2(50),
phone_no number,
dob date,
pan_no varchar2(50),
aadhar_no varchar2(50),
branch_code varchar2(50)
);

create table user_det
(
user_id varchar2(50) primary key,
user_name varchar2(100),
email varchar2(50),
user_desgn varchar2(50),
branch_code varchar2(50)
);

create table branch_det
(
branch_code varchar2(50) primary key,
branch_name varchar2(100),
region_code varchar2(50),
region_name varchar2(100),
zone_code varchar2(50),
zone_name varchar2(100)
);

create table proposal_det
(
prop_id varchar2(50) primary key,
net_income number,
expt_total number,
prop_desc varchar2(150),
prop_status varchar2(50),
san_total number
);

create table status_ref
(
status_code varchar2(50),
status_desc varchar2(100)
);

create table credit_prop_process
(
prop_id varchar2(50),
action_date date,
action_by varchar2(50),
status_code varchar2(50)
);
