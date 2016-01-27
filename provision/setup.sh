echo 	"Provisioning virtual machine..."

echo 	"Installing Git..."
		apt-get install git -y > /dev/null

echo 	"Installing Apache2..."
		apt-get install apache2 -y > /dev/null

echo	"Installing PHP..."
		apt-get install php5 libapache2-mod-php5 php5-mcrypt php5-curl -y > /dev/null

echo 	"Installing MySql..."
		apt-get install debconf-utils -y > /dev/null

		debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
		debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

		apt-get install mysql-server php5-mysql -y > /dev/null

echo 	"Installing Composer..."
		curl -sS https://getcomposer.org/installer | php > /dev/null
		mv composer.phar /usr/local/bin/composer > /dev/null