
#   -------------------------------
#   12.a nuS__V____C
#   -------------------------------

	#Configuration
	#export SVC_PROJECT='/c/Developer/SVC'
	#export SVC_CONFIG_FOLDER=$SVC_PROJECT'/dev/config'
	#export SVC_CONFIG=$SVC_CONFIG_FOLDER'/montreal-lab'
	

	#alias gotoSvcRepo='cd $SVC_PROJECT/dev'
	#alias checkstyle='checkstyleMain checkstyleTest'
	#alias svcPrepare='clean assemble'
	
	#alias runSvc="SVC_CONFIG=$SVC_CONFIG_FOLDER'/montreal-lab' gotoSvcRepo && ./gradlew jRun && cd -"
	#alias debugSvc='gotoSvcRepo && ./gradlew jRunDebug && cd -'
	#alias runSvcMockAll='unset SVC_CONFIG && MOCK_ALL=true && gradlew jRun'
	#alias runSvcMockAllDebug='unset SVC_CONFIG && MOCK_ALL=true && gradlew jRunDebug'
	
	#Building a war without Gui/Swagger
	#alias buildSvcNoSwagger='./gradlew war -Dswagger-ui=false'
	#alias buildSvcNoGuiNoSwagger='./gradlew warNoGui -Dswagger-ui=false'
	
	#Tester tools
	#alias runCtiTester='./gradlew cti-tester:run'
	#Commands 
	##write_kvp extension connectionId KvpName KvpValue
	##example: write_kvp 6640 000102e976723313 SpeakerId1 gabTest
	##writeCtiKvp=""

	
	###Logfile axes (grep references for searching)
	#grep -F "com.nuance.freespeech.exception.FreeSpeechException: javax.xml.ws.soap.SOAPFaultException: System.InvalidProgramException: Waiting for audio buffer on AudioSegment" SpeakerVerificationController.log > 1.log
	#grep -F "DEBUG c.nuance.freespeech.FreeSpeechImpl10  startRecordVasStreamer - result: RecordingDetails{AudioSegmentId{" SpeakerVerificationController.log > 1.log
	##get a range of dates
	#grep -E ^2016-07-1[3-9] filename
	##Great Axe of Rolon 
	#grep "Process audio failed" Desktop/SpeakerVerificationController.2019-09-19.3.log | awk ''{print $5}'' | xargs -I{} grep {} Desktop/SpeakerVerificationController.2019-09-19.3.log | grep "startRecordVasStreamer - result:" | grep -oP ''callerIpAddress=.*?(?=,)''
	#grep "Process audio failed" Desktop/SpeakerVerificationController.2019-09-19.3.log | awk ''{print $5}'' | grep -f - Desktop/SpeakerVerificationController.2019-09-19.3.log | grep "startRecordVasStreamer - result:" | grep -oP ''callerIpAddress=.*?(?=,)''

	
	##did not work
	#$ for line in CallIdTimedOut.log; do grep -F "startRecordVasStreamer - result: RecordingDetails{AudioSegmentId{"; done
	#$ grep -F -B18 "c.nuance.freespeech.station.OnosImpl  Stored device of:0000ce197065014e for extension" > 0000ce197065014e.log

	#Project specific 
	function runSVCs() {
		if ($# -eq 0) then
			echo "No argument suplied, so running default config configured in frontend.gradle "
			$SVC_PROJECT/dev/gradlew jRun
		else  
			case $1 in 
				charter)
				SVC_CONFIG=$SVC_CONFIG_FOLDER'/montreal-charter'
				;;
				
			esac
		fi
	}
	
	#   -------------------------------
#   12.b nu****_N_D_F
#   -------------------------------

	#Configuration
	export NDF_PROJECT='/c/Developer/NDF'
	alias NdfRepo='cd $NDF_PROJECT'
	
	
#   -------------------------------
#   12.c Nex**** integration team shortCuts
#   -------------------------------

    #alias rabbitrun='rabbitmq-server -detached'
    #alias rabbitstatus='rabbitmqctl status'
    #alias postgresqlrun='pg_ctl -D /Library/PostgreSQL/9.3/bin/pg_ctl start -D /Library/PostgreSQL/9.3/data -l postgres.log'
	#   Scripts
    #alias deployassistant='cd ~/git/assistant/deployment/scripts/dev/ && ./init_deploy_dev.sh && cd -'
    #alias deploymaster='cd ~/git/nexoniamaster/scripts/ && ./deploy_master.sh && cd -'
	#   config
    #export PGDATABASE=nexonia
    #export PGUSER=nexonia 
    #export PATH_WORKSPACE=/Users/gabrielamyot/git/assistant
    #export PATH="$PATH:/usr/local/Cellar/postgresql/9.6.3/bin"
    #export PATH="$PATH:/usr/local/bin/psql"
    #export PATH="$PATH:/usr/local/Cellar/ant/1.10.1/bin"
    #export PATH="$PATH:/usr/local/Cellar/gradle/4.0/bin"
    #export PATH="$PATH:/usr/local/Cellar/rabbitmq/3.6.9_1/sbin"
    #export PATH_JBOSS=/Users/gabrielamyot/wildfly/wildfly-10.1.0.Final
    #export JAVA_HOME="$(/usr/libexec/java_home)"
    #export PATH="$PATH:/$JAVA_HOME"
	