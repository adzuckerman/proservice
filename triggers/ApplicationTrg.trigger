/*
Created by: MB(GTR) - 26-Mar-2018
Summary: Application Trg handler class-Used for Opportunity mapping to application object
*/
trigger ApplicationTrg on Application__c (before insert, before update) 
{
    new ApplicationTrgHandler().run();
}