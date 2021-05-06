#!/bin/bash

#mysqlsh ${admin_username}:'${admin_password}'@${mds_ip} --sql -e "CREATE DATABASE ${joomla_schema};"
#mysqlsh ${admin_username}:'${admin_password}'@${mds_ip} --sql -e "CREATE USER ${joomla_name} identified by '${joomla_password}';"
#mysqlsh ${admin_username}:'${admin_password}'@${mds_ip} --sql -e "GRANT ALL PRIVILEGES ON ${joomla_schema}.* TO ${joomla_name};"

DEDICATED=${dedicated}
INSTANCE=${instancenb}

if [ "$DEDICATED" == "true" ]
then
   joomlaschema="${joomla_schema}$INSTANCE"
   joomlaname="${joomla_name}$INSTANCE"
else
   joomlaschema="${joomla_schema}"
   joomlaname="${joomla_name}"
fi


mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE DATABASE $joomlaschema;"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE USER $joomlaname identified by '${joomla_password}';"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "GRANT ALL PRIVILEGES ON $joomlaschema.* TO $joomlaname;"

echo "Joomla Database and User created !"
echo "JOOMLA USER = $joomlaname"
echo "JOOMLA SCHEMA = $joomlaschema"
