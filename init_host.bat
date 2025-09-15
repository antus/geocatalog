@echo off

if "%GP_HOST%"== "" (
    echo Environment GP_HOST variable not defined! Please define it according to your public ip address or hostname 
) else (
    echo Found GP_HOST=%GP_HOST%
	powershell -Command "(gc init_host_env/config.xml) -replace 'localhost', '%GP_HOST%' | Out-File -encoding ASCII geoserver-data/config.xml"
	powershell -Command "(gc init_host_env/global.xml) -replace 'localhost', '%GP_HOST%' | Out-File -encoding ASCII geoserver-data/global.xml"
	powershell -Command "(gc init_host_env/celery.env) -replace 'localhost', '%GP_HOST%' | Out-File -encoding ASCII env/celery.env"
	powershell -Command "(gc init_host_env/django.env) -replace 'localhost', '%GP_HOST%' | Out-File -encoding ASCII env/django.env"
	powershell -Command "(gc init_host_env/tomcat.env) -replace 'localhost', '%GP_HOST%' | Out-File -encoding ASCII env/tomcat.env"
	powershell -Command "(gc init_host_env/default_oauth_apps_docker.json) -replace 'localhost', '%GP_HOST%' | Out-File -encoding ASCII cartoview/fixtures/default_oauth_apps_docker.json"
    echo Environment files configured with the specified host!
)
