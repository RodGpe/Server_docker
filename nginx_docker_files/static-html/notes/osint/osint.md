# OSINT
## course overview 
Notas sobre el curso de osint 

There is a publication named  "NATO OSINT handbook v1.2"

NATO descirbe three categories:
- Open Source Data
- Oper source information - processed data
- osint - added analysis, recommendations made, publishing results

Existe un discor de blueTeam SANS https://sec487.info/joinslack
Un grupo de osint https://osint.team/home 

Social media intellience it's called [[SOCMINT]]

OSINT is the proccess of searching for, gathering and *analyzing* data found in **public** sources.

### The OSINT cycle
#### Requirements Gathering
Make a document with standar questions about need to be answered, the costumer may spect some hacking to be done

![[osint-Cycle.png]](./Images/osint-Cycle.png)

#### Retriving Data
There are some tools to record "all of the things"

#### Analyzing Data
After gathering "enough" data
- Is it relevant?
- Is it accurate?
- Is it objective?
Your OSINT Graphic Analyzer [[YOGA]] helps by showing connections https://yoga.osint.ninja

#### Pivoting to a New Perspective and Reporting
If there is enough information, this is reported accompanied with the analysis, saying why is importanta, the posible effects on the costumer. If there is **not** enough data then we pivot and start searching once again.

## Uses for OSINT
### For good
- find criminal networks
- find self-incriminate posts
- video surveillance
- dark web monitoring
- there exists CTF's for OSINT
- business competition
- media entities use OSINT
- Bellingcat's online investigations

### For bad
- cyber attacks - pishing, vishing, etc. For objectice details, like computer systems, IP, software, etc

## Note taking
**Record everything** should be the defaul
### What to record
- Posted images, tools screenshots, pictures of web pages
- URLs
- Times and Dates

### Documentation tools
#### visualizers 
Display the data in a very visual form, it helps to see and identify relationships betwen elements of the data.
Some visualizers are:
- i2 Analyst Notebook (paid)
- Tableau (paid)
- Maltego (FREE and paid)
- Maltego casefile (FREE)
- gephi (FREE)

##### Maltego
It uses *transforms* to make some changes to the data in the graph (where data is stored)
We can develop our own transforms with the help of the documentation https://docs.maltego.com/support/solutions/articles/15000034012-about-this-guide 

#### Note-taking app
- MS One Note
- Evernote
- Google keep
- Obsidian **Very recomended**
- MindMaps
	- XMind
	- FreeMind
	- MindDomo

#### Documenting application
- Hunchly (browser extention that takes orginized pictures of websites)
- Paliscope
- Microsoft Steps Recorder

#### Word Processors and Text Editors
- MS word
- OpenOffice writer
- Notepad++
- sublime
- Leafpad
- vi/vim
- VScode **recommended**

### Screen capture Tools
- FastStone Image Viewer *windows only*
- Snagit
- Shutter

### Timeline Generation
- Aeon Timeline
- Timeline by knight lab

## Determining your threat  profile
Intelligence and military commuties uses three words to discribe the openness of their actions

### Level of openness
- Overt: public or non-anonymous
- Covert: We take some actions to make it hard for others to know that we are doing OSINT
- Clandestine: assure secrecy or concealment

A site to check if your browser is "safe" against tracking
- https://coveryourtracks.eff.org/ 
- https://browserleaks.com/
- https://whoer.net/
- https://www.deviceinfo.me/

Nodes in the Tor network are runned by criminals, OSINT people and other intelligence agencies. This nodes may be recording, blocking o altering traffic.

#### Increse your privacy
A google Sheet with a HowTo remove your information from search people engines.
http://the.osint.ninja/optoutdoc
There is also a printed book on how to increse privacy online
https://amzn.to/3eCjp7J
https://inteltechniques.com/links.html

## Platforms for doing OSINT
- Dedicated physical system 
	- laptop
	- desktop 
	- phones
- virtual machines
	- virtual box
	- vmware
- Cloud platforms with VDI (virtual desktop interfaces)
	- Amazon ecc - WorkSpaces
	- microsoft azure - virtual desktop
	- digital ocean
- Virtual browsers
	- Authentic8
	- Web Gap
	- Cigglo 

### Networking and VPN
Advantages of using a VPN
- Encripted traffic
- Differen IP address
- Different regions

Here is a list with VPN service providers. https://www.safetydetectives.com/best-vpns/#comparison 

You can setup your own vpn using services like Digital Ocean.
#### Streisand  gitHub Project
Its a software in https://github.com/StreisandEffect/streisand  thar easily installs
- VPN server
- Proxy 
- firewall
- Tor
- others

#### Browsers
##### Browser extentions that protect
- Pravacy badger - ad and tracker blocker
- uBlock origin - same 
- Firefox multi-account Containers - isolate cookies in containers 
- Location Guard

##### Browser extentions that Augment
- Hunchly
- Instant Data Scaper
- User Agent Switcher
- Download everything
- Search by image

### Files
We have to use a naming convention when work with huge amount of data.
Also we have to encrypt the data preferible with File System Encryption
- Windows - BitLocker
- macOS - FileVault2
- Linux - LUKS (linux unified key setup)
- Containes VeraCrypt

### Phones
- Use physical phones 
- Emulators
	- NoxPlayer
	- GenyMotion
	- BlueStacks
	- Android SDK
- No divice (to avoid extra complexity)
For IOS it's better to use a phisycal device (ipod, iphon, ipad, etc)

When browsing the web you can change the user-agent so that the server returns the mobile version of the site. Or to use the Developer tools to change the resolution to avoid been flaged

### Passwords
#### Locals
- KeePassXC
- PWSafe

#### Cloud-based
- 1Password
- LastPass
- Dashlane

## Effecive habits and process
Connect to your target on social media or in real life.

#### To maximize our work
- **Manage your time**
- Start with trustworthy sites and work  toward less trustworthy
- Start with sites that give you the most "good" results
- Start with sites that give highly relevant data
- Consider increasing scope of investigation as time allows

### The OSINT process must
- be reliable
- be flexible yet constant
- be repeatable
- maintain the privacy of your costomers
- be explainable to others
- yield meaningul results

## Example proccess
- Ensure a Clean OSINT Platform
	- VM snapshot
	- OS imagin
	- Scripts that remove previos files 
- Acquiere costumer requirements
	- motive
	- compliance
	- risk
	- support legal action 
	- When do they need results
	- Whata data do they already have
- Decide on [[TTP's]] (Tactics, Techniques and Procedures)
	- Create an Standar Operation Procedure (SOP) manual.

![[data-information-intelligence.png]](./Images/data-information-intelligence.png)

![[mini-cycle.png]](./Images/mini-cycle.png)
## Search engines
A site can ask not to index some of its contente via the robots.txt file in the root of the domain

### Search engines operators
- negation    -   (dash)
- conditional  OR
- search in the title    intitle:
- search in the text      intext:
- file extention    ext:         filetype:
- domain      site:

### Some search engines
- Duck Duck go
- Google     Results are mostly customized, it has many opeartors
	- Google dorks and Google hacking database https://www.exploit-db.com/google-hacking-database
	- There is a book called **google hacking for penetration testers**
	- Google dont allow the use of automated searchs in its terms of service, and can block our IP from using its service
	- google trends allows to know what the people are googling the most https://trends.google.com/
- yandex.com    focuses content on Asia and Europe
- Carrot search engine searches other web search engines https://search.carrot2.org/
- 

## Documents for osint 
- Operations Security Intelligence Threat Handbook
- Handbook of Electronic Security and Digital Forensics
- ITACG Intellingence Guide for First Responders




```python
#! python3
#this is a python script
import os, shutil
Hola = 'hola'
```


#concepts #oscint 
