# Notes, not to be graded
Equifax discovered the hackers while updating their Secure Sockets Layer servers to TLS. 
Apache Struts Exploit
    Error could be triggered making server run embedded commands while trying to process error
    Data entry form could be used to send malicious code to the servers with data on them
    When vurnerability came to light a patch was made
        patching wasn't simple - required all applications to be restred and reconfigured but could be done
        but hack happed two months after exploit and patch was announced


Hackers scan networks and find target IDENTIFICATION
    Scanner identify active networked computers and make a picture of what OS is running, software version, and types of open system services
    Equifax knew dispute portal had vulnerability in March 2017 - attack happened in May
        emailed admins letting them know they have to update but dispute porton not on email ist
        Individuals scanned network looking for USCERT warning, found dispute portal had vunerability
        They confirmed that they could get in and run commands - no data taken
    Discovered in July that hackers were in
        discovered because SSL server was being updated

Hackers hide identity DETECTION
    use encryption to hide movement and transfer of data around and out of network
    sent queries and commands using encryption to retrieve PII from other systems
    Encryption allowed them to blend in with regular activity on network
    Expired certificates
        encrypted tokens used to authentitcate servers and systems 
        Equifax discovered leak "misconfigured piece of equipment"
        encrypted traffic not being inspected
        tool for inspecting traffic couldn't because of expired cert
    

Access rights gained leveraged for more rights in other places SEGMENTATION
    gained ability to run system level commands on dispute portal quiered other databases for sensitive data
    stole unencrypted usernames and passwords from database for more database access
    probe more repositories for info and steal copies

Big take aways
    Equifax officals found thtat key factors were "identification, detection, segmentation and data governance"
    lack of restrictions on queries - over 9000 queries, way more than normal operation