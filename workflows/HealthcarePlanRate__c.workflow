<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Healthcare_Plan_Rate_Update_18_digit</fullName>
        <field>ProductIDTEXT__c</field>
        <formula>CASESAFEID( Product__c )</formula>
        <name>Healthcare Plan/Rate - Update 18 digit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Healthcare_Plan_Rate_Update_Family</fullName>
        <field>ProductFamily__c</field>
        <formula>TEXT( Product__r.Family )</formula>
        <name>Healthcare Plan/Rate - Update Family</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Healthcare Plan%2FRate - Update 18 digit SFDC ID</fullName>
        <actions>
            <name>Healthcare_Plan_Rate_Update_18_digit</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Healthcare_Plan_Rate_Update_Family</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>HealthcarePlanRate__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
