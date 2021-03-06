<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>NPS_Survey_Month_Date</fullName>
        <field>NPS_Survey_Month_Date3__c</field>
        <formula>CASE( 
VOC_Survey_Month__c, 
"January",DATE(2018,1,1), 
"February",DATE(2018,2,1), 
"March",DATE(2018,3,1), 
"April",DATE(2018,4,1), 
"May",DATE(2018,5,1), 
"June",DATE(2018,6,1), 
"July",DATE(2018,7,1), 
"August",DATE(2018,8,1), 
"September",DATE(2018,9,1), 
"October",DATE(2018,10,1), 
"November",DATE(2018,11,1), 
"December",DATE(2017,12,1), 
null)</formula>
        <name>NPS Survey Month (Date)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>NPS Survey Month %28Date%29</fullName>
        <actions>
            <name>NPS_Survey_Month_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.VOC_Survey_Month__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
