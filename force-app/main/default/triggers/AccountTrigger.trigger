trigger AccountTrigger on SOBJECT (before insert,before update) {
    if(Trigger.isBefore && Trigger.isInsert){
       
    }
     if(Trigger.isBefore && Trigger.isUpdate){
       
    }
}