<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Task_Notification</fullName>
        <description>New Task Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Test_additional_task_fields</template>
    </alerts>
    <rules>
        <fullName>Safety - Team Alakai</fullName>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Task.ActivityDate</field>
            <operation>greaterThan</operation>
            <value>1/1/2018</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Category__c</field>
            <operation>equals</operation>
            <value>Safety</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Sub_Category_1__c</field>
            <operation>equals</operation>
            <value>Training - Safety</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
