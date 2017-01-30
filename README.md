# About
This is a basic implementation of the Timesheet Single Table Inheritance example discussed in **The Rails 4 Way**. 

A user is able to create an AcceptedTimesheet, create a DraftTimesheet from the AcceptedTimesheet, Create a SubmittedTimesheet from the DraftTimesheet and Update the AcceptedTimesheet from the SubmittedTimesheet.

AcceptedTimesheet -> creates DraftTimesheet -> creates SubmittedTimesheet -> updates AcceptedTimesheet.

## Table Hierarchy
- Timesheet
  - DraftTimesheet 
  - SubmittedTimesheet
  - AcceptedTimesheet

