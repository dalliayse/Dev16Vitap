trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {

    //this will be true in before insert and before update
    if (Trigger.isBefore) {
        system.debug('Contact Before Trigger');
        if (Trigger.isInsert) {
            system.debug('contact before insert trigger');
        }
        if (Trigger.isUpdate) {
            system.debug('contact before update trigger');
        }
    }

     if (Trigger.isAfter) {
        system.debug('Contact After Trigger');
        if (Trigger.isInsert) {
            system.debug('contact After insert trigger');
        }
        if (Trigger.isUpdate) {
            system.debug('contact After update trigger');
        }
    }

}