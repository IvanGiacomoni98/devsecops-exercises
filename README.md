# devsecops-exercises

🇮🇹 [Leggi in italiano](README.it.md)

This repository was created to collect exercises and provide practical instructions to help you prepare for the *Integrate Vulnerability Management in DevSecOps Cycle* course

## Base Prerequisites
To complete the tasks in the exercises, you'll need a [GitHub account](https://github.com/signup).

**If the course is held in person, please remember to bring your laptop and charger!**

To get the most out of the tools we’ll be using together in this course, we strongly recommend having a PC running a Linux distribution, or alternatively a virtual machine (WSL for Linux is fine too!).

## Functional Prerequisites
### Fork the repository

To ensure you can work independently during the exercises, we recommend that you fork our starter repository to your GitHub profile.  

The steps you need to follow to perform this operation are available [at this guide](https://docs.github.com/en/get-started/quickstart/fork-a-repo).

### Docker Hub

To run the exercise on Docker, you need to have an account on Docker Hub, create an API access key, and then add it to the **Secrets** section of the repository you are going to create.  

You can create an account directly from [Docker Hub](https://hub.docker.com/signup).  

Once you've created your account, you'll be able to [generate an access token](https://docs.docker.com/security/for-developers/access-tokens/).

#### Forked Repo docker hub permissions

Once you have completed the *Docker Hub* step, you need to enter the Docker credentials you just generated (**username** + **access token**) into the repository secrets you forked.

To do this, follow these steps:
1. Navigate to the link for the repository you forked (e.g., https://github.com/your_name/devsecops-exercises)
2. Click **Settings** in the top-right navigation bar.
3. On the new page, in the left sidebar, click **Secrets and variables** and then **Actions** in the dropdown menu that just opened.
4. On the new page, click **New repository secret**, and fill out the form by entering the following fields


    | Name | Secret |
    | :---|---:|
    | **DOCKERHUB_USERNAME** | your docker username |
    | **DOCKERHUB_PASSWORD**   | the API key you just generated |

<br/>

For your reference, here is the documentation on [managing secrets on GitHub](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions).

### Dependency Track
To speed up the download and simplify the setup process for the exercises, please follow these steps once you have installed Docker on the computer or virtual machine you will be using during the course:
#### Dependency track docker compose execution
Run the following command from the root directory of this repository:
``` bash
cd dtrack
docker compose up -d
```

This will download the Docker images required by the application, which will then be launched.  
Once running, it will download the additional data needed to use its features.

#### Public CVEs DB API key creation
To avoid the rate limits imposed by CVE data providers on public APIs, you need to set up personal access tokens for the GitHub Advisories and NIST databases.  
Be sure to save both tokens so that you can easily access them later.

##### GitHub
Create a token (classic) from your GitHub account [settings page](https://github.com/settings/tokens). The token does not require a scope or access to the repository.

##### NIST
Fill [this form](https://nvd.nist.gov/developers/request-an-api-key) with your information.  
Once you've submitted it, follow the instructions in the email to obtain the API key that we'll use during the course.

## Extra

If you have a preferred IDE, you can clone the repository you forked and set up the Git client configurations as usual.

### Generate SSH key on GitHub
[Instructions here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

### Installing Docker and pulling images

Some of the exercises we will be working on during the course require the use of containerization software. Due to its popularity and extensive documentation, we recommend using **Docker**, but the equivalent alternatives **Podman** and **Containerd** are also suitable for this purpose.  

To use **Docker**, you can follow the [installation instructions](https://docs.docker.com/engine/install/) specific to the Linux operating system you will be using during the course.  

To speed up access to the content, once you have installed **Docker**, download the following images to your workstation a few days before the course begins:
- `docker pull aquasec/trivy@sha256:2416d1f74045b57274df1a340eee6b510cacd73c66a6ccb8da092b117eb7d222` (0.76.0)
- `docker pull zaproxy/zap-stable@sha256:7aaa659b0d43078febd82e29bad112285c370727e86ab8340444220e17d9f0d2` (2.17.0, build 20261008)

# External resources
In this section, you'll find links to the tools and external resources shared during the training.

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
The vulnerable applications we have exposed in this repository are taken from a list provided by OWASP, which compiles and categorizes projects created for this purpose [at this link](https://owasp.org/www-project-vulnerable-web-applications-directory/).

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
Stay up to date with the latest news on cybersecurity by [subscribing here](https://davideariu.substack.com/).

# TEST PUSH
Just testing a push.