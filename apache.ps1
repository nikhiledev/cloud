if [ "$apache" = 'yes'  ]; then
    wget $edev/apache2/apache2.conf -O /etc/apache2/apache2.conf
    wget $edev/apache2/status.conf -O /etc/apache2/mods-enabled/status.conf
    wget $edev/logrotate/apache2 -O /etc/logrotate.d/apache2
    a2enmod rewrite
    a2enmod suexec
    a2enmod ssl
    a2enmod actions
    a2enmod ruid2
    mkdir -p /etc/apache2/conf.d
    echo > /etc/apache2/conf.d/edev.conf
    echo "# Edev Server" > /etc/apache2/sites-available/default
    echo "# Edev server" > /etc/apache2/sites-available/default-ssl
    echo "# Edev server" > /etc/apache2/ports.conf
    echo -e "/home\npublic_html/cgi-bin" > /etc/apache2/suexec/www-data
    touch /var/log/apache2/access.log /var/log/apache2/error.log
    mkdir -p /var/log/apache2/domains
    chmod a+x /var/log/apache2
    chmod 640 /var/log/apache2/access.log /var/log/apache2/error.log
    chmod 751 /var/log/apache2/domains
    update-rc.d apache2 defaults
    service apache2 start
    check_result $? "apache2 start failed"
else
    update-rc.d apache2 disable >/dev/null 2>&1
    service apache2 stop >/dev/null 2>&1
fi
