#!/bin/bash
shopt -s expand_aliases

function run {
	token=$(docker-compose up | grep -o -m 1 'token=[^EOL]*')
	file="scripts/jupyter.sh"
	printf "sensible-browser 172.27.1.19:8888/?" > "$file"
	printf "$token" >> "$file"
}


while test $# -gt 0
do
	case "$1" in

		-f)
			echo -e "\nRun this script with flag '--help' for help.\n \n"
			run
			source scripts/jupyter.sh &
			sensible-browser 172.27.1.5:50070 &
			sensible-browser 172.27.1.17:18630 &
			sensible-browser 172.27.1.10:8080 &
			sensible-browser 172.27.1.13:8888 &
			sensible-browser 172.27.1.20:8080 &
		;;

		-a)
			echo -e "\nRun this script with flag '--help' for help.\n \n"
			run
			source scripts/aliases.sh
		;;

		-r)
			source scripts/aliases.sh
		;;

		--help)
			echo -e "\nData Analytics Development Pipeline - Manual"
			echo -e "\nThe following flags are available:\n"
			echo -e "   --help\t Shows help screen.\n"
			echo -e "    -f \t\t After starting open all GUI's.\n"
			echo -e "    -r \t\t Only refresh shortcuts without opening the environment.\n"
			echo -e "    -a \t\t After starting add the following temporary"
			echo -e "       \t\t shell shortcuts:\n"
			echo -e "\t - jupyter ... \t\t Opens Jupyter Notebook."
			echo -e "\t - streamsets ... \t Opens Streamsets UI."
			echo -e "\t - sparkmaster ... \t Opens SparkMaster UI."
			echo -e "\t - hue ... \t\t Opens Hue UI."
			echo -e "\t - namenode ... \t Opens NameNode UI."
			echo -e "\t - kafkahq ...\t\t Opens Kafka HQ."
 			echo -e "\t - close ... \t\t Closes the platform."
		;;

		*)
			run
		;;
	esac
	shift
done
