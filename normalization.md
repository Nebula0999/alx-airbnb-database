Removed payment from booking to make it an independent attribute. This is because payment had to have its own attributes like id, method, amount, etc which would make the database redundant if it were
with booking table.
