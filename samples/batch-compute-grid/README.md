# Batch (Compute Grid)

A simple Batch "Compute Grid" base application server that deploys two well-known IBM-provided batch samples:  the [SimpleCI](https://www.ibm.com/support/knowledgecenter/SSAW57_8.5.5/com.ibm.websphere.samples.doc/ae/sample_mb_simpleci.html), and [Mailer](https://www.ibm.com/support/knowledgecenter/SSAW57_8.5.5/com.ibm.websphere.samples.doc/ae/sample_jb_mailer.html) applications, with security enabled.  

We also add configuration for diagnostic features:  enabling the server for debug mode and configuring collection of [Health Center](https://www.ibm.com/support/knowledgecenter/en/SS3KLZ/com.ibm.java.diagnostics.healthcenter.doc/homepage/plugin-homepage-hc.html) metrics.

The intent, though, is not to provide a complete batch environment out of the box, but more to include a couple non-trivial things with the docker build.

## Building the application image

See the Dockerfile for a breakdown of what the build does.

`docker build -t batch-cg .`


## Running the application

 docker run --name batch-cg -p 9043:9043 -p 9443:9443 -p 7777:7777 -it batch-cg:latest
     OR
 winpty docker run --name batch-cg -p 9043:9043 -p 9443:9443 -p 7777:7777 -it batch-cg:latest


## Doc


1. doc how to run jobs manually, cron
 a. simple ci
    xjcl in jmc
 b. mailer 
    xjcl in jmc
    xjcl in lrcmd
 c. both
   look at HFS output
2.  Test on Win/Linux w/ Cron
3.  put image on artifactory
4.  try to pull from sku
5. stop server cleanly
6. sample copyrights on everything


