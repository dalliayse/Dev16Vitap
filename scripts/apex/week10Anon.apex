DeleteOppBatch doo =new DeleteOppBatch();
Database.executeBatch(doo, 2);

SheudableTasc a = new SheudableTasc();
string sch = '0 0 1 ? *MON*';
System.schedule('Merge Job', sch, a);