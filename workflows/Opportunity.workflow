<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Closed_Won_Notificaiton</fullName>
        <description>Closed Won Notificaiton</description>
        <protected>false</protected>
        <recipients>
            <recipient>ImplementationManager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Sales</recipient>
            <type>roleSubordinates</type>
        </recipients>
        <recipients>
            <recipient>Pricing</recipient>
            <type>roleSubordinates</type>
        </recipients>
        <recipients>
            <recipient>jordan.conley@proservice.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lorence.alacar@proservice.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales/Closed_Won_Notification</template>
    </alerts>
    <alerts>
        <fullName>EMAIL_Opportunity_Ready_For_Healthcare_Pricing</fullName>
        <description>EMAIL - Opportunity Ready For Healthcare Pricing</description>
        <protected>false</protected>
        <recipients>
            <recipient>laura.mitchell@proservice.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Alert_For_Healthcare_Pricing</template>
    </alerts>
    <alerts>
        <fullName>EMAIL_Opportunity_Ready_For_Worker_s_Comp_Pricing</fullName>
        <description>EMAIL - Opportunity Ready For Worker's Comp Pricing</description>
        <protected>false</protected>
        <recipients>
            <recipient>laura.mitchell@proservice.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Alert_For_Workers_Comp_Pricing</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_for_Opportunity_Owner_BDM_to_review_the_completed_Proposal</fullName>
        <description>Email Alert for Opportunity Owner BDM to review the completed Proposal</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/test</template>
    </alerts>
    <alerts>
        <fullName>Imp_Handover_Ready</fullName>
        <ccEmails>lorence.alacar@proservice.com</ccEmails>
        <description>Imp Handover Ready</description>
        <protected>false</protected>
        <recipients>
            <recipient>ImplementationManager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Implementation_Handover_Notification</template>
    </alerts>
    <alerts>
        <fullName>Lead_Application_Request_Email</fullName>
        <ccEmails>salesoperations@proservice.com</ccEmails>
        <description>Lead Application Request Email</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lead_Application_Request_Email_Existing</template>
    </alerts>
    <alerts>
        <fullName>Lead_Application_Request_Email_Startup</fullName>
        <ccEmails>salesoperations@proservice.com</ccEmails>
        <description>Lead Application Request Email_Startup</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lead_Application_Request_Email_Startup</template>
    </alerts>
    <alerts>
        <fullName>Proposal_Assembly_complete_alert_for_Sales</fullName>
        <description>Proposal Assembly complete alert for Sales</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Proposal_Assembly_complete_alert_for_Sales</template>
    </alerts>
    <alerts>
        <fullName>Send_Authorization_Email_Alert</fullName>
        <description>Send Authorization Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Authorization_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>HC_Complete_Date</fullName>
        <field>HC_Pricing_Complete_Date__c</field>
        <formula>NOW()</formula>
        <name>HC Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>HC_Ready_Date</fullName>
        <field>HC_Ready_for_Pricing_Date__c</field>
        <formula>NOW()</formula>
        <name>HC Ready Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Implementation_Hand_Off_Readiness</fullName>
        <description>Set Implementation Hand-Off Readiness Date</description>
        <field>Implementation_Hand_Off_Readiness_Date__c</field>
        <formula>Today()</formula>
        <name>Implementation Hand-Off Readiness</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sales_Manager_Email</fullName>
        <field>Sales_Manager_Email__c</field>
        <formula>Owner.Manager.Email</formula>
        <name>Sales Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opportunity_Stage</fullName>
        <description>Update Opportunity Stage to Submit to Pricing</description>
        <field>StageName</field>
        <literalValue>Submit to Pricing</literalValue>
        <name>Update Opportunity Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_PRMC_Risk_Rate_Tier</fullName>
        <field>PRMC_Risk_Rate_Tier__c</field>
        <formula>IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H009') , 0.5932,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H010') , 0.61,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H011'), 0.63,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H012'), 0.65,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H014'), 0.67,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H015'), 0.695,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H017'), 0.72,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H018'), 0.745,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H020'), 0.77,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H023'), 0.795,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H025'), 0.82,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H030'), 0.845,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H035'), 0.872,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H040'), 0.904,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H045'), 0.937,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H050'), 0.97,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H060'), 1,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H065'), 1.031,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H070'), 1.062,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H075'), 1.092,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H080'), 1.125,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H085'), 1.162,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H090'), 1.201,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H095'), 1.236,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H100'), 1.285,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H105'), 1.312,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H110'), 1.36,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H115'), 1.395,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H120'), 1.44,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H125'), 1.485,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H130'), 1.536,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H135'), 1.59,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H140'), 1.644,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H145'), 1.707,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H150'), 1.77,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H155'), 1.824,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H160'), 1.89,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H162'), 1.949,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H164'), 2.023,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H166'), 2.096,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H168'), 2.168,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H170'), 2.241,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H180'), 2.32,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H185'), 2.399,
IF( ISPICKVAL( PRMC_HMSA_Tier__c, 'H190'), 2.478,
NULL)))))))))))))))))))))))))))))))))))))))))))))</formula>
        <name>Update PRMC Risk Rate Tier</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Q_Card_Grade</fullName>
        <field>QMI_QCard_Grade__c</field>
        <formula>IF (QMI_QCard_Grade_Pct__c &gt;= 0.80, "A",
IF (QMI_QCard_Grade_Pct__c &gt;= 0.65, "B",
IF (QMI_QCard_Grade_Pct__c &gt;= 0.50, "C",
IF (QMI_QCard_Grade_Pct__c &gt; 0, "D", 
NULL))))</formula>
        <name>Update Q-Card Grade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WC_Complete_Date</fullName>
        <field>WC_Pricing_Complete_Date__c</field>
        <formula>NOW()</formula>
        <name>WC Complete Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WC_Ready_Date</fullName>
        <field>WC_Ready_for_Pricing_Date__c</field>
        <formula>NOW()</formula>
        <name>WC Ready Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>HC Complete Date</fullName>
        <actions>
            <name>HC_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.HC_pricing_complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>HC Ready Date</fullName>
        <actions>
            <name>HC_Ready_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.HCReadyforPricing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Implementation Hand-Off Readiness</fullName>
        <actions>
            <name>Implementation_Hand_Off_Readiness</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Implementation_Hand_Off_Ready__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set the Implementation Hand-Off Readiness Date for Sales Ops to indicate that all fields required for hand-off to Implementation are complete, and timestamp when the box has been checked</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Application Request Email_Existing Business</fullName>
        <actions>
            <name>Lead_Application_Request_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Send_Lead_Application_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Startup_Company__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Application Request Email_Startup</fullName>
        <actions>
            <name>Lead_Application_Request_Email_Startup</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Send_Lead_Application_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Startup_Company__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Proposal Assembly complete alert for Sales</fullName>
        <actions>
            <name>Proposal_Assembly_complete_alert_for_Sales</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Sales_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Proposal Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>QMI section reminder to BDM</fullName>
        <actions>
            <name>Fill_out_QMI_section</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Info Gathering</value>
        </criteriaItems>
        <description>Send reminder to BDM (Opp Owner) to fill QMI section when Opp is in Info gathering phase.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Ready for Pricing Stage Update</fullName>
        <actions>
            <name>Update_Opportunity_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.HCReadyforPricing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.WCreadyforpricing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Stage to be updated to Submit for Pricing when either HC or WC Ready for pricing is checked true</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Authorization Email</fullName>
        <actions>
            <name>Send_Authorization_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Send_email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send Authorization Email Workflow when the send email checkbox is marked true on the opty.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update PRMC Risk Rate Tier</fullName>
        <actions>
            <name>Update_PRMC_Risk_Rate_Tier</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update PRMC Risk Rate Tier based on selection in PRMC HMSA Tier field.</description>
        <formula>OR( NOT(ISBLANK(TEXT(PRMC_HMSA_Tier__c))), ISBLANK(TEXT(PRMC_HMSA_Tier__c))  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update QMI Q-Card Grade</fullName>
        <actions>
            <name>Update_Q_Card_Grade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(CreatedDate))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>WC Complete Date</fullName>
        <actions>
            <name>WC_Complete_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.WC_pricing_complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>WC Ready Date</fullName>
        <actions>
            <name>WC_Ready_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.WCreadyforpricing__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Fill_out_QMI_section</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Opportunity.CRMG_WF__Today__c</offsetFromField>
        <priority>3</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Fill-out QMI section</subject>
    </tasks>
</Workflow>
