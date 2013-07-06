 #!/bin/bash
clear
export USER
	cd /home/$USER
	mkdir proyecto_test
	cd /home/$USER/proyecto_test
echo "Bajando proyecto del repositorio..."
	git clone git://github.com/elevazquez/sap.git
	git clone git://github.com/elevazquez/sap_script.git
echo "Fin de clonacion."
echo "Creacion de Base de Datos..."
	sudo chmod 777 -R $USER/proyecto_test
	cd /opt/PostgreSQL/9.1/bin
	./psql -U postgres -W -c "CREATE DATABASE sap  WITH ENCODING='UTF8' ;"
	cp /home/$USER/proyecto_test/sap_script/sap.sql /opt/PostgreSQL/9.1/bin/sap.sql
	./psql -U postgres -d sap -f sap.sql
echo "Fin de la Creacion de Base de Datos"
echo "Levantando Proyecto...."
	cd /home/$USER/proyecto_test/sap/src
	chmod +x  loginC.py
	python loginC.py

	


