<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Application_Date</fullName>
        <field>Clientspace_Application_Date__c</field>
        <formula>Application_Date__c</formula>
        <name>Update Application Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Opportunity__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Update Application Date from Collateral</fullName>
        <actions>
            <name>Update_Application_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Application_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
