---
title: "Azure Function in Docker Container ausführen"
date: 2020-02-21 19:20:00
slug: "/de/posts/2020-02-21-azure-function-in-docker-container-ausf%C3%BChren"
author: André Bering
type: article
content-type: markdown
published: true
language: de
properties:
  tags: ["docker", "Azure Function"]
toc: true
...

## Einleitung

Azure Functions können grundsätzlich auch in Docker ausgeführt werden. Während der Entwicklung kann man diese auch lokal ausführen. In diesem Kontext kommt es aber in Verbindung mit Http Triggern zu einem Problem. Obwohl im monatlich stattfindenden Azure Functions Webcast ([Ausgabe 20.02.2020](https://twitter.com/jeffhollan/status/1230705929051492352)) Verbesserungen im Bereich von Kubernetes Deployments angekündigt wurden, sind dazu bisher keine weiteren Informationen verfügbar bzw. ich habe diese nicht finden können.

Daher zeigt dieser Artikel wie man Azure Functions mit einem Http Trigger Docker betreiben kann.

<!-- more -->

## Voraussetzungen

* [Azure Functions Core Tools](https://docs.microsoft.com/de-de/azure/azure-functions/functions-run-local) >= 2.7.2184 und < 3.0
* Windows
* Docker

Dieser Artikel bezieht sich auf das Vorgehen unter Windows. Unter MacOS sollte das Vorgehen auch so funktionieren lediglich spezifische Befehle wie bspw. das Anlegen von Verzeichnissen muss angepasst werden.

## Azure Function erzeugen

Um ein neues Azure Function Projekt mit einem Http Trigger und Dockerfile zu erzeugen, können einfach die folgenden Befehle ausgeführt werden. Als Runtime bei der Erzeugung wählen wir `dotnet` aus.

    mkdir funcDemoDocker
    cd funcDemoDocker
    func init
    func new --name MyHttpTrigger --template "HttpTrigger"
    func init --docker-only

Im Anschluss kann das Projekt auch direkt gestartet werden und so die Azure Function in der CLI ausgeführt werden.

    func start --build

Danach kann man wie gewohnt die Azure Function im Browser aufrufen.

![Function local](function-local.png){.lb .lb-img-noborder width="100%" noborder="yes"}

Im Projekt befindet sich auch das passende Dockerfile zum erzeugen des notwendigen Docker-Images.

    docker build -t funcdemodocker .

Nachdem das Image erzeugt ist, können wir einen Container starten.

    docker run -p 8080:80 funcdemodocker

Ruft man nun die Verwaltungsseite der Azure Function auf, sieht man, dass diese ganz normal gestartet ist.

![Function Docker local](function-docker-local.png){.lb .lb-img-noborder width="100%" noborder="yes"}

Versucht man dann allerdings den Http Trigger anzusprechen, erhält man einen 401 (Unauthorized) Fehler.

![Function Docker local 401](function-docker-local-401.png){.lb .lb-img-noborder width="100%" noborder="yes"}

Die Ursache hierfür ist, dass beim lokalen Ausführen mittels der CLI die Authentisierung der Azure Function deaktiviert wird. Dies ist bei der Ausführung in Docker nicht der Fall.

## Lösung

Um dieses Problem zu lösen, muss man nur die Keys definieren und mittels Parametern dem Container oder genauer der Azure Function Runtime mitteilen, wo diese zu finden sind. Dazu muss zunächst die Datei mit den Keys erzeugt werden. In diesem Fall wird diese Datei im Verzeichnis `C:\dev\my-secrets` mit dem Namen `host.json` angelegt. Der Inhalt der Datei sollte wie folgt aussehen:

    {
        "masterKey": {
            "name": "master",
            "value": "<key>",
            "encrypted": false
        },
        "functionKeys": [{
            "name": "default",
            "value": "<key>",
            "encrypted": false
        }]
    }

Der `<key>` kann durch einen beliebigen Wert, für Tests bspw. `test1234`, ersetzt werden. Um den Container dann zu starten, wird der folgende Befehl ausgeführt.

    docker run -v C:\dev\my-secrets:/azure-functions-host/Secrets -e AzureWebJobsSecretStorageType=files -p 8080:80 funcdemodocker

Im Anschluss kann man wie gewohnt den Http Trigger unter Nutzung des Keys ansprechen.

![Function Docker local success](function-docker-local-success.png){.lb .lb-img-noborder width="100%" noborder="yes"}

## Fazit

Mittels des oben beschriebenen Wegs kann man auch Azure Functions mit Http Trigger in einem Docker Container betreiben. Das dabei auftretende Problem der nicht bekannten Keys wird über das explizite setzen dieser gelöst. Wie oben erwähnt soll dieser Workaround in der nächsten Version der Azure Functions Core Tools behoben sein und die Schlüssel automatisch erzeugt und beim Start angezeigt werden.
