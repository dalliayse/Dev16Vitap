trigger CaseTrigger on Case (before insert) {
    system.debug('before insert case trigger');
    //number of recrods?
    system.debug('number of records processed: ' + trigger.size);
}