import * as cdk from 'aws-cdk-lib/core';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as elbv2 from 'aws-cdk-lib/aws-elasticloadbalancingv2'
// import * as sqs from 'aws-cdk-lib/aws-sqs';

export class TaskCdkStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, {
      ...props,
      synthesizer: new cdk.DefaultStackSynthesizer({
        qualifier: 'h1', // 👈 force CDK to use hexq bootstrap
      }),
    });
    // The code that defines your stack goes here

    // example resource
    // const queue = new sqs.Queue(this, 'TaskCdkQueue', {
    //   visibilityTimeout: cdk.Duration.seconds(300)
    // });
    const vpc = new ec2.Vpc(this,"hayagreevan-cdk-vpc",{
      availabilityZones : ["us-east-1a","us-east-1b"],
      ipAddresses : ec2.IpAddresses.cidr("10.120.0.0/16"),
      createInternetGateway : true,
      natGateways : 1,
      vpcName : "hayagreevan-cdk-vpc",
      subnetConfiguration : [
        {
          name : "hayagreevan-public",
          subnetType : ec2.SubnetType.PUBLIC,
          mapPublicIpOnLaunch : true,
          cidrMask : 24
        },
        {
          name : "hayagreevan-private",
          subnetType : ec2.SubnetType.PRIVATE_WITH_EGRESS,
          cidrMask : 24
        },
      ] 
    });

    const lb_sg = new ec2.SecurityGroup(this,"hayagreevan-cdk-lb-sg",{
      vpc,
      allowAllOutbound : true,
      securityGroupName : "hayagreevan-cdk-lb-sg"
    })
    lb_sg.addIngressRule(ec2.Peer.anyIpv4(),ec2.Port.HTTP);

    const vm_sg = new ec2.SecurityGroup(this,"hayagreevan-cdk-vm-sg",{
      vpc,
      allowAllOutbound : true,
      securityGroupName : "hayagreevan-cdk-vm-sg"
    })
    vm_sg.addIngressRule(ec2.Peer.securityGroupId(lb_sg.uniqueId),ec2.Port.HTTP);


    const vm1 = new ec2.Instance(this,"hayagreevan-vm-1", {
      vpc,
      instanceType : ec2.InstanceType.of(ec2.InstanceClass.BURSTABLE3, ec2.InstanceSize.MICRO),
      machineImage : ec2.MachineImage.genericLinux({
        "us-east-1": "ami-0ecb62995f68bb549"
      }),
      associatePublicIpAddress : true,
      instanceName : "hayagreevan-cdk-vm-1",
      availabilityZone : "us-east-1a",
      securityGroup: vm_sg,
    })
    const vm2 = new ec2.Instance(this,"hayagreevan-vm-2", {
      vpc,
      instanceType : ec2.InstanceType.of(ec2.InstanceClass.BURSTABLE3, ec2.InstanceSize.MICRO),
      machineImage : ec2.MachineImage.genericLinux({
        "us-east-1": "ami-0ecb62995f68bb549"
      }),
      associatePublicIpAddress : true,
      instanceName : "hayagreevan-cdk-vm-2",
      availabilityZone : "us-east-1b",
      securityGroup: vm_sg
    })

    const alb = new elbv2.ApplicationLoadBalancer(this,"hayagreevan-cdk-alb",{
      vpc,
      internetFacing : true,
      loadBalancerName: "hayagreevan-cdk-alb",
      securityGroup: lb_sg
    })

    const listener = alb.addListener("hayagreevan-cdk-alb-listener",{
      port : 80,
      protocol : elbv2.ApplicationProtocol.HTTP,

    })

    listener.addTargets("tg",{
      targets : []

    })

    const tg = new elbv2.ApplicationTargetGroup(this, "hayagreevan-cdk-alb-tg",{
      targetType: elbv2.TargetType.INSTANCE,
      port : 80,
      vpc,
      protocol : elbv2.ApplicationProtocol.HTTP,
      targetGroupName: "hayagreevan-cdk-alb-tg",
      targets : []
    })
    
  }
}
