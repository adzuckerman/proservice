<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Work_Comp_Lost_Cost_Update_18_digit_SF</fullName>
        <field>ProductIDTEXT__c</field>
        <formula>CASESAFEID( Product__c )</formula>
        <name>Work Comp Lost Cost - Update 18 digit SF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Work Comp Lost Cost - Update 18 digit SFDC ID</fullName>
        <actions>
            <name>Work_Comp_Lost_Cost_Update_18_digit_SF</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>WorkCompLostCost__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
