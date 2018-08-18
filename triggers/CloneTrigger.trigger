trigger CloneTrigger on SBQQ__Quote__c (before insert) { 
 for (SBQQ__Quote__c q: Trigger.new) { 
  if (q.isClone()) { 
    q.isClone__c = true;
    q.CloneSourceId__c = q.getCloneSourceId();
    q.Primary_Quote__c = false;
  }
 } 
}