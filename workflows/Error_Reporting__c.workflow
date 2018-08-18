<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Special_Considerations_on_Creation</fullName>
        <field>Special_Considerations_on_Creation__c</field>
        <formula>Client__r.Special_Considerations__c</formula>
        <name>Special Considerations on Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Special Considerations at Service Mistakes Reporting Creation</fullName>
        <actions>
            <name>Special_Considerations_on_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
