/*
Created: 07.02.2019
Modified: 14.02.2019
Project: Medical services
Model: Medical services model
Database: PostgreSQL 9.5
*/


-- Create tables section -------------------------------------------------

-- Table Request

CREATE TABLE "Request"(
 "ID_Request" Integer NOT NULL,
 "R_Name" Text NOT NULL,
 "R_Begin_Date" Date NOT NULL,
 "R_End_Date" Date,
 "R_Update_Date" Date NOT NULL,
 "ID_Status" Integer NOT NULL,
 "ID_Patient" Integer
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Request

CREATE INDEX "IX_Relationship3" ON "Request" ("ID_Status")
;

CREATE INDEX "IX_Relationship10" ON "Request" ("ID_Patient")
;

-- Add keys for table Request

ALTER TABLE "Request" ADD CONSTRAINT "PK_Request" PRIMARY KEY ("ID_Request")
;

-- Table Act

CREATE TABLE "Act"(
 "ID_Act" Integer NOT NULL,
 "A_Name" Text NOT NULL,
 "A_Date" Date NOT NULL,
 "ID_Request" Integer,
 "E_Login" Text
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Act

CREATE INDEX "IX_Relationship1" ON "Act" ("ID_Request")
;

CREATE INDEX "IX_Relationship7" ON "Act" ("E_Login")
;

-- Add keys for table Act

ALTER TABLE "Act" ADD CONSTRAINT "PK_Act" PRIMARY KEY ("ID_Act")
;

-- Table Referral

CREATE TABLE "Referral"(
 "ID_Referral" Integer NOT NULL,
 "Ref_Date" Date NOT NULL,
 "ID_Request" Integer,
 "ID_Type" Integer NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Referral

CREATE INDEX "IX_Relationship2" ON "Referral" ("ID_Request")
;

CREATE INDEX "IX_Relationship5" ON "Referral" ("ID_Type")
;

-- Add keys for table Referral

ALTER TABLE "Referral" ADD CONSTRAINT "PK_Referral" PRIMARY KEY ("ID_Referral")
;

-- Table Status

CREATE TABLE "Status"(
 "ID_Status" Integer NOT NULL,
 "S_Name" Text NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Status

ALTER TABLE "Status" ADD CONSTRAINT "PK_Status" PRIMARY KEY ("ID_Status")
;

-- Table Type

CREATE TABLE "Type"(
 "ID_Type" Integer NOT NULL,
 "T_Name" Text NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Type

ALTER TABLE "Type" ADD CONSTRAINT "PK_Type" PRIMARY KEY ("ID_Type")
;

-- Table Employee

CREATE TABLE "Employee"(
 "E_Login" Text NOT NULL,
 "E_Name" Text NOT NULL,
 "E_DOB" Date NOT NULL,
 "ID_Post" Integer,
 "ID_Password" Bigint
)
WITH (
 autovacuum_enabled=true)
;

-- Create indexes for table Employee

CREATE INDEX "IX_Relationship8" ON "Employee" ("ID_Post")
;

CREATE INDEX "IX_Relationship9" ON "Employee" ("ID_Password")
;

-- Add keys for table Employee

ALTER TABLE "Employee" ADD CONSTRAINT "PK_Employee" PRIMARY KEY ("E_Login")
;

-- Table Post

CREATE TABLE "Post"(
 "ID_Post" Integer NOT NULL,
 "P_Name" Text NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Post

ALTER TABLE "Post" ADD CONSTRAINT "PK_Post" PRIMARY KEY ("ID_Post")
;

-- Table Password

CREATE TABLE "Password"(
 "P_Value" Text NOT NULL,
 "ID_Password" Bigint NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Password

ALTER TABLE "Password" ADD CONSTRAINT "PK_Password" PRIMARY KEY ("ID_Password")
;

-- Table Patient

CREATE TABLE "Patient"(
 "ID_Patient" Integer NOT NULL,
 "P_Name" Text NOT NULL,
 "P_DOB" Date NOT NULL
)
WITH (
 autovacuum_enabled=true)
;

-- Add keys for table Patient

ALTER TABLE "Patient" ADD CONSTRAINT "PK_Patient" PRIMARY KEY ("ID_Patient")
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Act" ADD CONSTRAINT "Request_Acts" FOREIGN KEY ("ID_Request") REFERENCES "Request" ("ID_Request") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Referral" ADD CONSTRAINT "Request_Referral" FOREIGN KEY ("ID_Request") REFERENCES "Request" ("ID_Request") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Request" ADD CONSTRAINT "Status_Request" FOREIGN KEY ("ID_Status") REFERENCES "Status" ("ID_Status") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Referral" ADD CONSTRAINT "Type_Referral" FOREIGN KEY ("ID_Type") REFERENCES "Type" ("ID_Type") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Act" ADD CONSTRAINT "Employee_Act" FOREIGN KEY ("E_Login") REFERENCES "Employee" ("E_Login") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Employee" ADD CONSTRAINT "Post_Employee" FOREIGN KEY ("ID_Post") REFERENCES "Post" ("ID_Post") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "Employee" ADD CONSTRAINT "Password_Employee" FOREIGN KEY ("ID_Password") REFERENCES "Password" ("ID_Password") ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE "Request" ADD CONSTRAINT "Request_Patient" FOREIGN KEY ("ID_Patient") REFERENCES "Patient" ("ID_Patient") ON DELETE NO ACTION ON UPDATE NO ACTION
;




