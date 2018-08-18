<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Internal_Lead</fullName>
        <ccEmails>marketing@proservice.com</ccEmails>
        <ccEmails>jody@proservice.com</ccEmails>
        <ccEmails>alexandra.foster@proservice.com</ccEmails>
        <description>New Internal Lead</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leads_Web_to_Lead_email_response_Internal_Lead</template>
    </alerts>
    <alerts>
        <fullName>New_Referral</fullName>
        <ccEmails>marketing@proservice.com</ccEmails>
        <ccEmails>jody@proservice.com</ccEmails>
        <ccEmails>alexandra.foster@proservice.com</ccEmails>
        <description>New Referral</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leads_Web_to_Lead_email_response_Referral</template>
    </alerts>
    <alerts>
        <fullName>New_Web_Lead</fullName>
        <ccEmails>marketing@proservice.com</ccEmails>
        <ccEmails>jody@proservice.com</ccEmails>
        <ccEmails>alexandra.foster@proservice.com</ccEmails>
        <description>New Web Lead</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leads_Web_to_Lead_email_response_To_Marketing</template>
    </alerts>
    <alerts>
        <fullName>New_Web_Lead_Ebook_Request</fullName>
        <ccEmails>marketing@proservice.com</ccEmails>
        <ccEmails>jody@proservice.com</ccEmails>
        <ccEmails>alexandra.foster@proservice.com</ccEmails>
        <description>New Web Lead Ebook Request</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Leads_Web_to_Lead_ebook_email_response_To_Marketing</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Email</fullName>
        <field>Email</field>
        <formula>Email  &amp; ("_disqualified")</formula>
        <name>Update Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email_1</fullName>
        <field>Email</field>
        <formula>Email  &amp; ("_disqualified")</formula>
        <name>Update Email 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_the_Approval_for_Integration</fullName>
        <field>Approved_for_Salesforce_Integration__c</field>
        <literalValue>0</literalValue>
        <name>Update the Approval for Integration</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Test</fullName>
        <actions>
            <name>Update_the_Approval_for_Integration</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Future Review,Disqualified</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>contains</operation>
            <value>@saltedstone.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Update_Email_1</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
