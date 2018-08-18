trigger LeadTrigger on Lead (before update) {
    new LeadTrgHandler().run();
}