SC3DBDefinition202103.sql is the latest database creation file. This is a MySQL script. You can install the database with the command:
mysql -u root -p < SC3DBDefinition202003.sql,
but first, you need to modify the SC3DBDefinition202003.sql file: replace '@SC3DB' with the database name everywhere - currently, the names SC3DB, SENTINELs, LaiCjau etc. are used.
and replace '@SC3DBParameters' with a key with the ID of organization and region name - e.g. 'smi:igf.edu.pl/NAWA#eventParameters'.

To install the database, you need to know the root password for MySQL.

The Linux bash script 'doSC3DB.bash' does all of the above. Its calling is:
./doSC3DB.bash <database name> <script name> [<authority id>]
where:
<database name> - database name, e.g. SC3DB,
<script name> - name of the script, in this case SC3DBDefinition202103.sql
<authority id> - organization identifier, e.g.igf.edu.pl.
Attention! This script deletes the previous database content. Therefore, if you need to update the database, you should use patches.

The MySQL command to insert a patch is:
mysql -u root -p <database name> <<patch file name>
e.g. mysql -u root -p SENTINELS < SC3DBPatch20200326.txt

The script for patching is 'doPath.bash'. Additionally, it creates a copy of the database. Its call is:
./doPatch.bash <database name> <patch file name>,
where:
<database name> - database name, e.g. SC3DB,
<script name> - the name of the script with the patch. There are currently three patched scripts. Their name includes the patch date. You must not invoke the patch twice.

List of patches:

SC3DBPatch20210315.txt - sorting data generated by LocSat after program changes 20210315
SC3DBPatch20210316.txt - correction of origin values: confidence ellipsoid and uncertainty ellipse - conversion from km to m (applied only to LocSta or NonLinLoc localized data) after program changes 20210315
SC3DBPatch20210317.txt - adding optional scalarMoment parameter to the SpectralParameter class. Currently not used yet (2021-03-17)