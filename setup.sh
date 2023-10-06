#!/bin/bash

#Default Username for DB
MYDNS_DB="mydns"

MYDNS_USER="mydns"
MYDNS_PASSWD="GHTKevUK7Nf75Qp"

WWW_USER="mydns_admin"
WWW_PASSWD="GHTKevUK7NSSSf75Qp"

MYSQL_ROOT_PASS=""
HOST="127.0.0.1"
MYDNS_DEB="mydns.deb"

DB_ENGINE="InnoDb"
# DB_ENGINE="MyISAM"

#Constant Variables
BASEDIR="$(pwd)"
SRCDIR="/usr/local/src"
WWWROOT="/var/www"
WEB_DIR="/opt/urlbl"
DB_CONNECT_PHP="html/assets/PHP/connectdatabase.php"
SRCTARFILR="mydns-1.1.0.tar.gz"
MYDNS_TAR_GZ="http://mydns.bboy.net/download/mydns-1.1.0.tar.gz"
MYDNSDIR="${SRCDIR}/mydns-1.1.0"
#Update source file extraction location using -l
declare -Ag CAT

SET_CATEGORY_INFO()
{
	CAT['Unknown']='Unknown'
	CAT['Online Proxy']='Online Anonymozier Proxies'
	CAT['Advertisements & Pop-Ups']='Sites that provide advertising graphics or other ad content files such as banners and pop-ups.'
	CAT['Alcohol & Tobacco']='Sites that promote or sell alcohol- or tobacco-related products or services.'
	CAT['Anonymizers']='Sites and proxies that act as an intermediary for surfing to other websites in an anonymous fashion, whether to circumvent web filtering or for other reasons.'
	CAT['Arts']='Sites with artistic content or relating to artistic institutions such as theaters, museums, galleries, dance companies, photography, and digital graphic resources.'
	CAT['Banking']='Sites enabling net banking.'
	CAT['Botnets']='Sites that use bots (zombies) including command-and-control sites.'
	CAT['Business']='Sites that provide business related information such as corporate web sites. Information, services, or products that help businesses of all sizes to do their day-to-day commercial activities.'
	CAT['Child Abuse Images']='Sites that portray or discuss children in sexual or other abusive acts.'
	CAT['Compromised']="Sites that have been compromised by someone other than the site owner in order to install malicious programs without the user's knowledge. Includes sites that may be vulnerable to a particular high-risk attack."
	CAT['Consumer Electronics']='Sites that contain information about electronic devices, software, hardware, IT, peripheral and computer services, such as product reviews, discussions, and IT news. Electronic devices can range from tablet, mobiles, computers, washing machines etc.'
	CAT['Criminal Activity']='Sites that offer advice on how to commit illegal or criminal activities, or to avoid detection. These can include how to commit murder, build bombs, pick locks, etc. Also includes sites with information about illegal manipulation of electronic devices, hacking, fraud and illegal distribution of software.'
	CAT['Cults']='Sites relating to non-traditional religious practice typically known as "cults," that is, considered to be false, unorthodox, extremist, or coercive, with members often living under the direction of a charismatic leader.'
	CAT['Dating & Matrimonial']='Sites that promote networking for interpersonal relationships such as dating and marriage. Includes sites for match-making, online dating, spousal introduction.'
	CAT['Download Sites']='Sites that contain downloadable software, whether shareware, freeware, or for a charge. Includes peer-to-peer sites.'
	CAT['Education']='Sites sponsored by educational institutions and schools of all types including distance education. Includes general educational and reference materials such as dictionaries, encyclopedias, online courses, teaching aids and discussion guides.'
	CAT['Entertainment']='Sites related to television, movies, music and video (including video on demand), such as program guides, celebrity sites, and entertainment news.'
	CAT['Fashion & Beauty']='Sites concerning fashion, jewelry, glamour, beauty, modeling, cosmetics or related products or services. Includes product reviews, comparisons, and general consumer information.'
	CAT['Finance']='Sites related to banking, finance, payment or investment, including banks, brokerages, online stock trading, stock quotes, fund management, insurance companies, credit unions, credit card companies, and so on.'
	CAT['Forums & Newsgroups']='Sites for sharing information in the form of newsgroups, forums, blogs, bulletin boards.'
	CAT['Gambling']='Sites that offer or are related to online gambling, lottery, casinos and betting agencies involving chance.'
	CAT['Games']='Sites relating to computer or other games, information about game producers, or how to obtain cheat codes. Game-related publication sites.'
	CAT['General']='Sites that do not clearly fall into other categories, for example, blank web pages.'
	CAT['Government']='Sites run by governmental organizations, departments, or agencies, including police departments, fire departments, customs bureaus, emergency services, civil defense, counterterrorism organizations, military and hospitals.'
	CAT['Greeting cards']='Sites that allow people to send and receive greeting cards and postcards.'
	CAT['Hacking']='Sites that promote or give advice about how to gain unauthorized access to proprietary computer systems, for the purpose of stealing information, perpetrating fraud, creating viruses, or committing other illegal activity related to theft of digital information.'
	CAT['Hate & Intolerance']='Sites that promote a supremacist political agenda, encouraging oppression of people or groups of people based on their race, religion, gender, age, disability, sexual orientation or nationality.'
	CAT['Health & Medicine']='Sites containing information pertaining to health, healthcare services, fitness and well-being, including information about medical equipment, hospitals, drugstores, nursing, medicine, procedures, prescription medications, etc.'
	CAT['Illegal Drug']='Sites with information on the purchase, manufacture, and use of illegal or recreational drugs and their paraphernalia, and misuse of prescription drugs and other compounds'
	CAT['Illegal Software']='Sites that illegally distribute software or copyrighted materials such as movies or music, software cracks, illicit serial numbers, illegal license key generators.'
	CAT['Image Sharing']='Sites that host digital photographs and images, online photo albums and digital photo exchanges.'
	CAT['Information Security']='Sites that provide legitimate information about data protection, including newly discovered vulnerabilities and how to block them.'
	CAT['Instant Messaging']='Sites that enable logging in to instant messaging services such as ICQ, AOL Instant Messenger, IRC, MSN, Jabber, Yahoo Messenger, and the like.'
	CAT['Job Search']='Sites containing job listings, career information, assistance with job searches (such as resume writing, interviewing tips, etc.), employment agencies or head hunters.'
	CAT['Leisure & Recreation']='Sites containing job listings, career information, assistance with job searches (such as resume writing, interviewing tips, etc.), employment agencies or head hunters.'
	CAT['Malware']="Sites that install unwanted software on a user's computer with the intent to enable third-party monitoring or make system changes without the user's consent."
	CAT['ML General']='Marking General to avoid HCQ.'
	CAT['Network Errors']='Sites that do not resolve to any IP address.'
	CAT['News']='Sites covering news and current events such as newspapers, newswire services, personalized news services, broadcasting sites, and magazines.'
	CAT['Non-profits & NGOs']='Sites devoted to non-profit organizations. Many of these groups exist for educational or charitable purposes.'
	CAT['Nudity']='Sites that contain full or partial nudity that are not necessarily overtly sexual in intent. Includes sites that advertise or sell lingerie, intimate apparel, or swimwear.'
	CAT['Parked Domains']='Sites that are inactive, typically reserved for later use. They most often do not contain their own content, may simply say "under construction," "purchase this domain," or display advertisements.'
	CAT['Peer-to-Peer']='Sites that enable direct exchange of files between users without dependence on a central server.'
	CAT['Personal Sites']='Sites about or hosted by personal individuals, including those hosted on commercial sites.'
	CAT['Phishing & Fraud']='Sites that are used for deceptive or fraudulent purposes (e.g. phishing), such as stealing financial or other user account information. These sites are most often designed to appear as legitimate sites in order to mislead users into entering their credentials.'
	CAT['Politics']='Sites that promote political parties or political advocacy, or provide information about political parties, interest groups, elections, legislation or lobbying. Also includes sites that offer legal information and advice.'
	CAT['Pornography/Sexually Explicit']='Sites that contain explicit sexual content. Includes adult products such as sex toys, CD-ROMs, and videos, adult services such as videoconferencing, escort services, and strip clubs, erotic stories and textual descriptions of sexual acts.'
	CAT['Private IP Addresses']='Sites that are private IP addresses as defined in RFC 1918, that is, hosts that do not require access to hosts in other enterprises (or require just limited access) and whose IP address may be ambiguous between enterprises but are well defined within a certain enterprise.'
	CAT['Real Estate']='Sites relating to commercial or residential real estate services, including renting, purchasing, selling or financing homes, offices, etc.'
	CAT['Religion']='Sites that deal with faith, human spirituality or religious beliefs, including sites of churches, synagogues, mosques and other houses of worship.'
	CAT['Restaurants & Dining']='Sites that list, review, promote or advertise food, dining or catering services. Includes sites for recipes, cooking instruction and tips, food products, and wine advisors.'
	CAT['School Cheating']='Sites that promote unethical practices such as cheating or plagiarism by providing test answers, written essays, research papers, or term papers.'
	CAT['Search Engines & Portals']='Sites enabling the searching of the Web, newsgroups, images, directories, and other online content. Includes portal and directory sites such as white/yellow pages.'
	CAT['Sex Education']='Sites relating to sex education, including subjects such as respect for partner, abortion, gay and lesbian lifestyle, contraceptives, sexually transmitted diseases, and pregnancy.'
	CAT['Shopping']='Sites for online shopping, catalogs, online ordering, auctions, classified ads. Excludes shopping for products and services exclusively covered by another category such as health & medicine.'
	CAT['Social Networking']='Sites that enable social networking for online communities of various topics, for friendship, dating, or professional reasons.'
	CAT['Spam Sites']='Sites that have been promoted through spam techniques.'
	CAT['Sports']='Sites relating to sports teams, fan clubs, scores and sports news. Relates to all sports, whether professional or recreational.'
	CAT['Storage']='Sites that provide cloud services.'
	CAT['Streaming Media & Downloads']='Sites that deliver streaming content, such as Internet radio, Internet TV or MP3 and live or archived media download sites. Includes fan sites, or official sites run by musicians, bands, or record labels'
	CAT['Tasteless']='Sites with offensive or tasteless content such as bathroom humor or profanity.'
	CAT['Translators']='Sites that translate Web pages or phrases from one language to another. These sites may be used to attempt to bypass a filtering system.'
	CAT['Transportation']='Sites that provide information about motor vehicles such as cars, motorcycles, boats, trucks, RVs and the like. Includes manufacturer sites, dealerships, review sites, pricing, , online purchase sites, enthusiasts clubs, etc.'
	CAT['Travel']='Sites that provide travel and tourism information or online booking of travel services such as airlines, accommodations, car rentals. Includes regional or city information sites.'
	CAT['Violence']='Sites that contain images or text depicting or advocating physical assault against humans, animals, or institutions. Sites of a particularly gruesome nature such as shocking depictions of blood or wounds, or cruel animal treatment.'
	CAT['Weapons']='Sites that depict, sell, review or describe guns and weapons, including for sport.'
	CAT['Web-based Email']='Sites that promote a supremacist political agenda, encouraging oppression of people or groups of people based on their race, religion, gender, age, disability, sexual orientation or nationality.'
}

APT_PACKAGES()
{
	#Installing Required Apps
	apt update && apt upgrade -y
	apt install checkinstall zlib1g-dev build-essential libmysqlclient-dev mysql-server mysql-common apache2 php php-mysql php-xml xml-core javascript-common libjs-jquery -y
}

CHECK_VARS()
{
	[ "x${MYDNS_PASSWD}" == "x" ] && echo "not defined: MYDNS_PASSWD" && exit;
	[ "x${MYDNS_USER}" == "x" ] && echo "not defined: MYDNS_USER" && exit;
	[ "x${SRCTARFILR}" == "x" ] && echo "not defined: SRCTARFILR" && exit;
	[ "x${SRCDIR}" == "x" ] && echo "not defined: SRCDIR" && exit;
}

CLEANUP()
{
	#Clean
	rm -rf "${SRCDIR}/${SRCTARFILR}"    
	rm -rf "${MYDNSDIR}"
	rm -rf "${SRCDIR}/sqlInsert"
}

GET_MYDNS()
{
	#Setup Mydns server
	[ -f "${SRCDIR}/${SRCTARFILR}" ] && echo "already exists: ${SRCDIR}/${SRCTARFILR}" && return;
	echo "wget ${MYDNS_TAR_GZ}" -P "${SRCDIR}"
	wget "${MYDNS_TAR_GZ}" -P "${SRCDIR}"
	[ -f "${SRCDIR}/${SRCTARFILR}" ] && echo "success: downloaded: ${SRCDIR}/${SRCTARFILR}" && return;
	echo "error: failed ${MYDNS_TAR_GZ} ->  ${SRCDIR}/${SRCTARFILR}"
	exit;
}

BUILD_MYDNS()
{
	[ "x${MYDNS_DEB}" != "x" ] && [ -f "${SRCDIR}/${MYDNS_DEB}" ] && echo "found MYDNS_DEB: ${SRCDIR}/${MYDNS_DEB}" && return;
	GET_MYDNS
	tar -xzvf "${SRCDIR}/${SRCTARFILR}" -C "${SRCDIR}"
	[ "x$?" != "x0" ] && echo "failed: tar -xzvf ${SRCDIR}/${SRCTARFILR} -C ${SRCDIR}" && exit;    

	cd "${MYDNSDIR}"
	./configure --enable-static --without-pgsql --with-mysql-lib=/usr/lib/x86_64-linux-gnu --with-zlib=/usr/lib/x86_64-linux-gnu
	
	[ "x$?" != "x0" ] && echo "mydns: configure: failed" && exit;    
	make
	[ "x$?" != "x0" ] && echo "mydns: make: failed" && exit;
	# -y to continue without prompt
	checkinstall -D --nodoc --install=no -y
	[ "x$?" != "x0" ] && echo "mydns: checkinstall: failed" && exit;

	#     find /usr/local/src/ -type f -name *.deb -exec dpkg -i {} \;

	find /usr/local/src/ -type f -name *.deb | while read FF
	do
		cp "${FF}" "${MYDNS_DEB}"
	done    
}

SETUP_MYDNS()
{
	dpkg -i "${MYDNS_DEB}"
	[ "x$?" != "x0" ] && echo "mydns: install: failed" && exit;    
	mydns --dump-config --user="${MYDNS_USER}" --password="${MYDNS_PASSWD}" --host="${HOST}" --database="${MYDNS_DB}" > /etc/mydns.conf
}

SETUP_DB_PHP()
{
	cat <<- _EOF > "${WEB_DIR}/${DB_CONNECT_PHP}"
<?php
	\$servername = "${HOST}";
	\$username = "${WWW_USER}";
	\$password = "${WWW_PASSWD}";
	\$dbname = "${MYDNS_DB}";
	\$soa = "soa";
	\$rr = "rr";
	\$wc = "wc";
	// Create connection
	\$conn = new mysqli(\$servername, \$username, \$password, \$dbname);
	// Check connection
	if (\$conn->connect_error) {
		die("Connection failed: " . \$conn->connect_error);
	}
?>

	
_EOF
	
}

APACHE_CONF()
{
	cat <<- _EOF > ${WEB_DIR}/urlbl.in.conf
<VirtualHost *:80>
	ServerName urlbl.in
	ServerAlias urlbl.in
	ServerAlias urlbl.in
	DocumentRoot /var/www/urlbl.in

	CustomLog /var/log/apache2/urlbl.in/access.log combined
	ErrorLog /var/log/apache2/urlbl.in/error.log

</VirtualHost>

_EOF
	
	ln -fs "${WEB_DIR}"/urlbl.in.conf /etc/apache2/sites-available/urlbl.in.conf
	a2ensite urlbl.in.conf
	ln -fs "${WEB_DIR}/html" "${WWWROOT}/urlbl.in"
	#Check if log dir exits
	[ ! -d "/var/log/apache2/urlbl.in" ] && mkdir -p "/var/log/apache2/urlbl.in"
	systemctl restart apache2.service
}

SETUP_WEB()
{
	[ ! -f "${BASEDIR}/html.tar.gz" ] && echo "not found: ${BASEDIR}/html.tar.gz" && return;
	[ "x${WEB_DIR}" == "x" ] && echo "undefined: WEB_DIR" && return;
	[ ! -d "${WEB_DIR}" ] && mkdir -p "${WEB_DIR}"
	[ ! -d "${WEB_LOG_DIR}" ] && mkdir -p "${WEB_LOG_DIR}"
	tar -xzvf "${BASEDIR}/html.tar.gz" -C "${WEB_DIR}"
	SETUP_DB_PHP
	chown -R root:www-data "${WEB_DIR}"
	APACHE_CONF

}

CREATE_MYDNS_TABLES()
{    
	cat <<- _EOF | mysql -u root
	CREATE user IF NOT EXISTS '${WWW_USER}'@'${HOST}' identified by '${WWW_PASSWD}';
	CREATE DATABASE IF NOT EXISTS ${MYDNS_DB};

	GRANT ALL PRIVILEGES ON ${MYDNS_DB}.* TO '${WWW_USER}'@'${HOST}';
	GRANT SELECT ON ${MYDNS_DB}.* TO '${WWW_USER}'@'${HOST}';
	
	CREATE TABLE IF NOT EXISTS ${MYDNS_DB}.soa (
	  id         INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  origin     CHAR(255) NOT NULL,
	  ns         CHAR(255) NOT NULL,
	  mbox       CHAR(255) NOT NULL,
	  serial     INT UNSIGNED NOT NULL default '1',
	  refresh    INT UNSIGNED NOT NULL default '28800',
	  retry      INT UNSIGNED NOT NULL default '7200',
	  expire     INT UNSIGNED NOT NULL default '60480',
	  minimum    INT UNSIGNED NOT NULL default '86400',
	  ttl        INT UNSIGNED NOT NULL default '86400',
	  UNIQUE KEY (origin)
	) ENGINE=${DB_ENGINE};
"${WWW_USER}" -p"${WWW_PASSWD}"  -h "${HOST}" -D "${MYDNS_DB}"
	  aux        INT UNSIGNED NOT NULL,
	  ttl        INT UNSIGNED NOT NULL default '86400',
	  UNIQUE KEY rr (zone,name,type,data)
	) ENGINE=${DB_ENGINE};
	
	CREATE TABLE IF NOT EXISTS ${MYDNS_DB}.wc (
	  Category_id    INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  Category       CHAR(255) NOT NULL,
	  Descriptions   CHAR(255) NOT NULL
	) ENGINE=${DB_ENGINE};

_EOF

}

MAKE_CAT_SQL ()
{
	local C
	local D
	for K in "${!CAT[@]}"
	do         
		C="'"; D="'";
		C+="${K}"
		D+="${CAT[$K]}"
		C+="'"; D+="'" ;
		cat <<- _EOF |  mysql -u root
		USE ${MYDNS_DB};
		INSERT INTO wc (Category,Descriptions) VALUES (${C},${D});
		_EOF
	done  
}

ADD_CAT_DB()
{
	SET_CATEGORY_INFO
	MAKE_CAT_SQL
}

MAIN()
{
	APT_PACKAGES
	CHECK_VARS
	BUILD_MYDNS
	SETUP_MYDNS
	CREATE_MYDNS_TABLES
	ADD_CAT_DB
	SETUP_WEB
	SETUP_DB_PHP    
	systemctl restart mysql.service
}


# CLEANUP
MAIN
