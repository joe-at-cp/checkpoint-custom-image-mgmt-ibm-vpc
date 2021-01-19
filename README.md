
# Check Point CloudGuard Management - IBM VPC Custom Image

## About
This template will provide a Check Point management server image in the "Custom images" repository for a given region. Follow the deployment guide below for instructions on how to deploy a new machine using this method.

## Check Point Resources
- Check Point knowledgebase article for IBM Cloud VPC deployments [SK170400](https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&solutionid=sk170400&partition=Basic&product=Security).
- Check Point [Custom Image Deployment Guide](https://supportcenter.checkpoint.com/supportcenter/portal?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=110938)

## Deployment Prerequisites 
- None

## Deployment Parameters
| Deploymenmt Parameter | Description |
|-----------------------|-------------|
| VPC_Region | The region where the VPC, networks, and Check Point VSI will be provisioned. To list the available regions, run  the following command: ```ibmcloud is regions```|
| Resource_Group | The resource group that will be used when provisioning the Check Point VSI. If left unspecififed, the account's default resource group will be used. command: ```ibmcloud resource groups``` |
| CP_Version | Version of Check Point CloudGuard to create custom image |

## IBM Cloud Regions and Zones
| Region | Zones |
|--------|-------|
| us-south | us-south-1, us-south-2, us-south-3 |
| us-east  | us-east-1, us-east-2, us-east-3 |
| eu-gb    | eu-gb-1, eu-gb-2, eu-gb-3 |
| eu-de    | eu-de-1, eu-de-2, eu-de-3 |
| jp-tok   | jp-tok-1, jp-tok-2, jp-tok-3 |

To list the available regions, run the following command: ```ibmcloud is regions```

## About Check Point Software Technologies Ltd.
Check Point Software Technologies Ltd. (www.checkpoint.com) is a leading provider of cyber security solutions to governments and corporate <br> 
enterprises globally. Its solutions protect customers from cyber-attacks with an industry leading catch rate of malware, ransomware and other <br>
types of attacks. Check Point offers a multilevel security architecture that defends enterprises’ cloud, network and mobile device held information, <br>
plus the most comprehensive and intuitive one point of control security management system. Check Point protects over 100,000 organizations of all sizes. <br>
