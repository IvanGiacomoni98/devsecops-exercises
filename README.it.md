# devsecops-exercises

🇬🇧 [Read in english](README.md)

Questa repository nasce per raccogliere gli esercizi e per fornire le istruzioni operative utili ad arrivare preparati al corso *Integrare il vulnerability management nel ciclo DevSecOps*

## Prerequisiti Base
Per poter effettuare le operazioni richieste negli esercizi è necessario avere un [account GitHub](https://github.com/signup).

**Nel caso di erogazione del corso in presenza, ricordatevi di portare con voi il PC ed il caricabatterie!**

Per poter fruire al meglio degli strumenti che andremo ad utilizzare assieme nel corso, è altamente consigliato di avere un pc con una distrubuzione Linux, o alternativamente una VM (anche WSL di linux va bene!).

## Prerequisiti Funzionali
### Effettuare la fork del repository

Per poter agire in autonomia durante gli esercizi, abbiamo identificato come pratica operativa quella di farvi eseguire la fork del nostro repository di partenza sul vostro profilo GitHub.  

Gli step necessari per effettuare questa operazione sono disponibili in [questa guida](https://docs.github.com/en/get-started/quickstart/fork-a-repo).

### Docker Hub

Per eseguire l'esercizio su Docker è necessario avere un account su Docker hub, creare una chiave API di accesso ed infine inserirla nella parte secrets sulla repository che andrete a creare.  

Potete create un account direttamente da [Docker Hub](https://hub.docker.com/signup).  

Una volta creato l'account, vi sarà possibile [generare un access token](https://docs.docker.com/security/for-developers/access-tokens/).

#### Forked Repo docker hub permissions

Una volta eseguito lo step *Docker Hub* dovete effettuare l'inserimento delle credenziali docker appena generate (**username** + **access token**) sulla repository di cui avete effettuato il fork.

Per effettuarlo, dovrete effettuare i seguenti passi:
1. Accedere al link della repository di cui avete effettuato la fork (e.g. https://github.com/your_name/devsecops-exercises)
2. Cliccate su **Settings** nella navbar superiore a destra.
3. Nella nuova pagina, nella sidebar a sinistra, cliccate **Secrets and variables** e successivamente **Actions** nel menu a tendina appena aperto.
4. Nella nuova pagina, cliccate su **New repository secret**, e compilate la form inserendo i seguenti campi


    | Name | Secret |
    | :---|---:|
    | **DOCKERHUB_USERNAME** | il vostro utente docker |
    | **DOCKERHUB_PASSWORD**   | la chiave api che avete generato |

<br/>

Come riferimento, ecco la documentazione per la [gestione dei secrets di GitHub](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions).

### Dependency Track
Per velocizzare il download e alleggerire gli esercizi dagli step di configurazione, é necessario effettuare le seguenti operazioni una volta installato docker sul computer/vm che userete durante il corso:
#### Esecuzione di dependency track
Eseguite il seguente comando dalla root di questo repository:
``` bash
cd dtrack
docker compose up -d
```
In questo modo scaricherete le immagini docker necessarie all'applicativo, che verrá successivamente eseguito.  
Una volta in esecuzione scaricherá i dati aggiuntivi necessari a fruire delle sue funzionalitá.

#### Creazione API key per dependency track
Per evitare il rate limiting delle API pubbliche imposti dai distributori dei dati sulle CVE, é necessario impostare dei token di accesso personali per i DB di GitHub Advisories e del NIST.  
Assicuratevi di salvare entrambi token in modo che siano facilmente accessibili in un secondo momento.

##### GitHub
Create un token (classic) dalla [pagina dei settings] (https://github.com/settings/tokens) del vostro account GitHub. Il token non necessita di scope, ne di accesso alle repository.

##### NIST
Compilate [questa form](https://nvd.nist.gov/developers/request-an-api-key) con i vostri dati.  
Una volta inviata, seguite le istruzioni della mail per ottenere l'API key che utilizzeremo durante il corso.

## Extra

Nel caso abbiate un IDE preferito, potete effettuare il clone della repository di cui avete effettuato il fork, effettuando il setup delle configurazioni del client git come di consueto.

### Generazione chiave SSH su GitHub
Seguite [queste istruzioni](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

### Installazione Docker e pull immagini

Alcuni degli esercizi che svolgeremo durante il corso prevedono l'utilizzo di un software di containerizzazione. Per la sua popolarità e documentazione consigliamo l'utilizzo di **docker**, ma si adattano allo scopo le alternative equivalenti **podman** e **containerd**.  

Per utilizzare **docker**,seguite le [istruzioni di installazione](https://docs.docker.com/engine/install/) specifiche per il sistema operativo Linux che utilizzerete durante il corso.  


Per velocizzare la fruzione dei contenuti, una volta installato **docker**, scaricate le seguenti immagini sulla vostra workstation nei giorni precedenti all'inizio del corso:
- `docker pull aquasec/trivy@sha256:2416d1f74045b57274df1a340eee6b510cacd73c66a6ccb8da092b117eb7d222` (0.76.0)
- `docker pull zaproxy/zap-stable@sha256:7aaa659b0d43078febd82e29bad112285c370727e86ab8340444220e17d9f0d2` (2.17.0, build 20261008)

# Risorse esterne
In questa sezione, i link agli strumenti e alle risorse esterne condivise durante la formazione.

## Threat Modeling with OWASP threat dragon
[OWASP threat dragon github page.](https://github.com/OWASP/threat-dragon)

## CVSS scoring
- [CVSS 3.1](https://www.first.org/cvss/calculator/3.1)
- [CVSS 4.0](https://www.first.org/cvss/calculator/4.0)

## SBOM generation
- [cdxgen](https://cdxgen.github.io/cdxgen/#/)

## VEX generation
- [osv scanner](https://github.com/google/osv-scanner)
- [trivy](https://github.com/aquasecurity/trivy)

## K8s (kubernetes) cluster KBOM and scan
- [Kubernetes](https://kubernetes.io/)
- [trivy](https://trivy.dev/docs/latest/guide/target/kubernetes/)

## Continuous Security Monitoring
- [Dependency Track](https://dependencytrack.org/)

## SAST
- [OWASP suggested SAST tools](https://owasp.org/www-community/Source_Code_Analysis_Tools)
- [CodeQL supported languages](https://codeql.github.com/docs/codeql-overview/supported-languages-and-frameworks/)
- [SonarQube supported languages](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/languages/overview/)

## DAST
- [ZAP GitHub Action](https://github.com/marketplace/actions/zap-full-scan)
- [ZAP Custom Auth Scripts](https://www.zaproxy.org/docs/authentication/handling-auth-yourself/)
- [ZAProxy (CheckMarx)](https://www.zaproxy.org/download)
- [BurpSuite (PortSwigger)](https://portswigger.net/burp/communitydownload)
- [Nuclei (ProjectDiscovery)](https://projectdiscovery.io/nuclei)

## Image Scan
- [Docker](https://www.docker.com/)
- [Docker Scout](https://docs.docker.com/scout/quickstart/)

## Security frameworks
- [5D framework](https://owasp.org/www-project-software-security-5d-framework/)
- [SCVS](https://owasp.org/www-project-software-component-verification-standard/)
- [SCVS JSON](https://github.com/OWASP/Software-Component-Verification-Standard/releases/download/1.0/OWASP_SCVS-1.0.json)
- [ASVS](https://owasp.org/www-project-application-security-verification-standard/)

## OWASP Vulnerable Apps
Le applicazioni vulnerabili che abbiamo esposto in questa repository sono prese da una lista fornita da OWASP, che raccoglie e raggruppa i progetti nati per questo scopo [a questo link](https://owasp.org/www-project-vulnerable-web-applications-directory/).

# Supply chain attacks
Below is a collection of articles on supply chain attacks that are unfortunately notorious for their operational and media impact

## Trivy (02/2026 - 03/2026)
- https://www.cve.org/CVERecord?id=CVE-2026-33634
- https://www.aquasec.com/blog/trivy-supply-chain-attack-what-you-need-to-know/
- https://snyk.io/articles/trivy-github-actions-supply-chain-compromise/

## Shai-Hulud (09/2025)
- https://attack.mitre.org/software/S9008/
- https://securitylabs.datadoghq.com/articles/shai-hulud-2.0-npm-worm/

## 3CX (11/2022)
- https://attack.mitre.org/campaigns/C0057/
- https://www.zscaler.com/blogs/security-research/3cx-supply-chain-attack-campaign

## Log4J (10/2021 - 12/2021)
- https://nvd.nist.gov/vuln/detail/CVE-2021-44228
- https://www.contrastsecurity.com/security-influencers/log4j-vulnerability-guide-detection-and-remediation-contrast

## SolarWind (09/2019 - 03/2020)
- https://attack.mitre.org/campaigns/C0024/
- https://www.fortinet.com/resources/cyberglossary/solarwinds-cyber-attack

# Follow Us on Security News
Restate aggiornati con le ultime news su temi di cybersecurity, effettuando la [sottoscrizione qui](https://davideariu.substack.com/).