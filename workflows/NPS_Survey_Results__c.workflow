<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>NPS_Survey_Alert</fullName>
        <description>NPS Survey Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>andy.chu@proservice.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NPS_Email_Alert</template>
    </alerts>
    <rules>
        <fullName>NPS Promoter Survey Result - Auto Task</fullName>
        <active>false</active>
        <criteriaItems>
            <field>NPS_Survey_Results__c.NPS_Score__c</field>
            <operation>greaterOrEqual</operation>
            <value>9</value>
        </criteriaItems>
        <description>A</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
