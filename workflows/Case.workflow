<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Account_Manager_at_ACE_Creation</fullName>
        <field>ACE_Account_Manager__c</field>
        <formula>TEXT(Account.Account_Manager__c)</formula>
        <name>Account Manager at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BDM_at_ACE_Creation</fullName>
        <field>ACE_BDM__c</field>
        <formula>Account.BDM__c</formula>
        <name>BDM at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Book_at_ACE_Creation</fullName>
        <field>Book__c</field>
        <formula>IF(TEXT(Account.System__c) = "HRP", "HK", 
IF(TEXT(Account.System__c) = "Ulti", "HK", 
IF(TEXT(Account.System__c) = "PrismHR", "DT", 
IF(TEXT(Account.System__c) = "HRP CLOUD", "DT", 
IF(TEXT(Account.System__c) = "PRISM CLOUD", "DT", 
NULL)))))</formula>
        <name>Book at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Collateral_Prep_Requested_Date_End</fullName>
        <field>Collateral_Prep_Requested_Date_End__c</field>
        <formula>DATETIMEVALUE(NOW())</formula>
        <name>Collateral Prep Requested Date End</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Collateral_Prep_Requested_Start_Date</fullName>
        <field>Collateral_Prep_Requested_Date_Start__c</field>
        <formula>NOW()</formula>
        <name>Collateral Prep Requested Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cost_Center_at_ACE_Creation</fullName>
        <field>ACE_Cost_Center__c</field>
        <formula>TEXT(Account.Cost_Center__c)</formula>
        <name>Cost Center at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Description_based_on_Record_Type</fullName>
        <field>Description</field>
        <formula>CASE($RecordType.Name,"ACE","Desired Text", "")</formula>
        <name>Description based on Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KARS_Admin_at_ACE_Creation</fullName>
        <field>ACE_KARS_Admin__c</field>
        <formula>Account.KARS_Admin__c</formula>
        <name>KARS Admin at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Original_Start_Date_at_ACE_Creation</fullName>
        <field>Account_Original_Start_Date__c</field>
        <formula>IF( TEXT(Account.Status_Description__c)="Active",
Account.Status_Date__c,
NULL)</formula>
        <name>Original Start Date at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Service_Type_at_ACE_Creation</fullName>
        <field>ACE_Service_Type__c</field>
        <formula>Account.Service_Type__c</formula>
        <name>Service Type at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Team_at_ACE_Creation</fullName>
        <field>ACE_Team__c</field>
        <formula>Account.Team__c</formula>
        <name>Team at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tier_at_ACE_Creation</fullName>
        <field>ACE_Tier__c</field>
        <formula>Account.Service_Level__c</formula>
        <name>Tier at ACE Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Account fields at ACE Case Creation</fullName>
        <actions>
            <name>Account_Manager_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BDM_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Book_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cost_Center_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>KARS_Admin_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Original_Start_Date_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Service_Type_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Team_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tier_at_ACE_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Captures value of Account fields at ACE Case Creation</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Collateral Prep Requested End Date</fullName>
        <actions>
            <name>Collateral_Prep_Requested_Date_End</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>AND(
ISCHANGED(Status),
ISPICKVAL(PRIORVALUE(Status),"Collateral Prep Requested"),
ISBLANK(Collateral_Prep_Requested_Date_End__c))</description>
        <formula>AND(
ISCHANGED(Status),
ISPICKVAL(PRIORVALUE(Status),"Collateral Prep Requested"))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Collateral Prep Requested Start Date</fullName>
        <actions>
            <name>Collateral_Prep_Requested_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(Status),
ISPICKVAL(Status,"Collateral Prep Requested"),
ISBLANK(Collateral_Prep_Requested_Date_Start__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
