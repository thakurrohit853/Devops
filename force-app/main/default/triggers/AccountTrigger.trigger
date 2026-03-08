trigger AccountTrigger on Account (before insert,before update) {
    if(Trigger.isBefore && Trigger.isInsert){
       
    }
     if(Trigger.isBefore && Trigger.isUpdate){
       //Comment the code
    }
}
