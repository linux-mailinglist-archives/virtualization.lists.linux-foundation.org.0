Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43F7CD762
	for <lists.virtualization@lfdr.de>; Wed, 18 Oct 2023 11:02:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB34C610A2;
	Wed, 18 Oct 2023 09:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB34C610A2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EAkocob9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCWjGpKKxtJF; Wed, 18 Oct 2023 09:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 67C1061068;
	Wed, 18 Oct 2023 09:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C1061068
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AF6CC008C;
	Wed, 18 Oct 2023 09:02:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 114F3C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 09:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A97FE61068
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 09:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97FE61068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POIVZnnbeZqT
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 09:02:19 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1EC460B36
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 09:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1EC460B36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=canb0W2AlFGi6YmKbeO9eV1UvUCRNyzQPTg0ccNMqDq727n1ZZLjul+lqKB95hRgGLpY5oy0BZG7z6oKiACayUFW8Rhn0YPaDITdz7Hgty2kL84WobFF9pkK5bfObV4186YbT95V81+VFk4hejOpDNEWUD9f92EyAk8qzM327PwNTwmHjDS0n+pAc9XGFGs5JshwAycpozhrJGBbxVUIVdBgtWcXSrnHcXU7S8Ai4vOPXpOCn6TGm7lha47yDULy0bPa5NoEMsD9biBVGBQhPOy2db8OjsRQ4UQUIvd9EeR8WXrBTYQ0ecT739EKQJZaCNHCXjV/ICb6qW6FZE4Kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfBt23eFHdT6U0M3XTx0EeQzDqRtZT+eRXqdtRHerfw=;
 b=M+VgeGDo+tFsicY726cVoD70IiRefoWL15Hi9yBKeblZ6CoOqhDgzUEiB5/1a40Qpg60RKCmVx+FL9Z/qq5juDXZZ1mLFfoRFyz/q46ab4eeuruAsnJMLsb4wtvh8jHdkyRpak/xTNzqZH7ShUOOtNPn+WNkOyyRApxm+w5pu1msKvWRXYp5wGtYBaBo1KUGuky//Vx7vR2s3A19qWFOhSVCHghN+szWOGbDtVSLgUc7/QNMgSypu/ZvIBobbeyJvS45eY2AVrE6Gl190Ked++KkUKTNj+ED8hS6erBHIoNLcxlf1j20bGuTm+wMHL6LPMlSxN1/cmb4/Fl3YbSyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfBt23eFHdT6U0M3XTx0EeQzDqRtZT+eRXqdtRHerfw=;
 b=EAkocob9dXpAEk29K1KdSJngDa23aKGVIidLhjCz/73U44OcrK//jXBXqEQ1a17LsVsxQ7fAlukr9RD58Lbmor5XPdXA2KcMX9uW7XpCnSYT4JqWQgBSIEpuTxHTEFH/XpMs+1nTd+TGExeGQG+14pngGK11FBBk1p83z45SHRlD3oaSREo7jJu29VXTsVOQsZW9d/gmH/0Kx6ul2dxbxRjDvjclqvGdW7/uNJNE9RQClBQQdYRyBYc7jOGVRPnkxok/ViNOXuPc7N78MxtOUh2Up60iftdLVx7+gWa+8yNgm1eXwvCInSC5Eo9Owero54S4pJDDYNqp3fxai5CuUg==
Received: from CH5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:1f4::18)
 by MW4PR12MB7144.namprd12.prod.outlook.com (2603:10b6:303:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 09:02:16 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::74) by CH5PR04CA0010.outlook.office365.com
 (2603:10b6:610:1f4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Wed, 18 Oct 2023 09:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 09:02:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 18 Oct
 2023 02:02:04 -0700
Received: from [172.27.13.185] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 18 Oct
 2023 02:01:59 -0700
Message-ID: <f6168335-d5e1-00ec-13ba-8c9a174b7eb0@nvidia.com>
Date: Wed, 18 Oct 2023 12:01:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V1 vfio 9/9] vfio/virtio: Introduce a vfio driver over
 virtio devices
To: Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>
References: <20231017134217.82497-1-yishaih@nvidia.com>
 <20231017134217.82497-10-yishaih@nvidia.com>
 <20231017142448.08673cdc.alex.williamson@redhat.com>
Content-Language: en-US
In-Reply-To: <20231017142448.08673cdc.alex.williamson@redhat.com>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MW4PR12MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f3edd5-c3de-42aa-8da6-08dbcfb8ed23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSyLEXR32RKfihWNv93OR/pG6klVfKR6/nC2bLf2M0eMDxtO64ypY1phy5AGES+JCleRva41QTVCdgD5NjZr324ReeXDl9j6x3S2pmt0D95Yoh+3Rm3Ks/jnX5F8NjbxpgKW/4Nq7CswXCLWUSGkgms38l7DqIdJWXNGTR3kZX96NpLKirhXFF/PpygQtezXdjKsTs0TcmdEeUdQC3GgP5FnMtN8x9TbiYkkluEYppMdvtYIOFGF9y1eJ8u+HceiGJkkF3RtHLLHBzMZEU06WgEIQ86RL7GRzondzcIGqG1JAxBNpxub7R4Vcpn6ufwv9YejIKrPbiqltGk4/jsUsCWU3P8s+WWWrRDNQKIBtlfBFGhlqTs2bi8BaKZ370E6Ua5uue/NvJbV1V8taM/kG4IoJi2xizIpqhl//mZkGFOYy7IOc9PR94Mnnw9Y3zfxdCzuQJcx0y6P58pxdiIJr8yOf9xAw3tFo2Q7MYad9chdc1fgWQZbup2+XRyJfGKESZ3FqEMig9+U+K4VSCQCxecDg2hqHsng2mfR3Sk2wZCRbfX4QWgIE3Kw6YZvI/2dUMDSsX1Iq6h7aN5f7ACypi4o/g4Hr96/g30zSC3q7WrcCZBLQ3NKeXIpVlwO3jsI3DUaKTGO1ebl3SSbskLzWi29NBhJO7qk2T7uAsEUx4LqSaEVJosN7PUdyAfDfKoAswYk6nrmdVswHYdItGPef4xV/3yUkiNN60Ufc0EaBAM0pGjS/8iSWraxhsNUfudUI1y4WnU9H/TOJVMoJe5asLjAtYpknn8T7nRBeO9c0lwSCWJff78VyrnExdRMkiSx
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(47076005)(53546011)(70206006)(31696002)(107886003)(2616005)(54906003)(70586007)(316002)(478600001)(41300700001)(6636002)(966005)(16576012)(86362001)(110136005)(26005)(83380400001)(36860700001)(356005)(7636003)(426003)(82740400003)(16526019)(336012)(40480700001)(8936002)(36756003)(8676002)(4326008)(5660300002)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 09:02:16.0956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f3edd5-c3de-42aa-8da6-08dbcfb8ed23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7144
Cc: kvm@vger.kernel.org, mst@redhat.com, maorg@nvidia.com,
 virtualization@lists.linux-foundation.org, jiri@nvidia.com, leonro@nvidia.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Yishai Hadas via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Yishai Hadas <yishaih@nvidia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 17/10/2023 23:24, Alex Williamson wrote:
> On Tue, 17 Oct 2023 16:42:17 +0300
> Yishai Hadas <yishaih@nvidia.com> wrote:
>> +static int virtiovf_pci_probe(struct pci_dev *pdev,
>> +			      const struct pci_device_id *id)
>> +{
>> +	const struct vfio_device_ops *ops = &virtiovf_acc_vfio_pci_ops;
>> +	struct virtiovf_pci_core_device *virtvdev;
>> +	int ret;
>> +
>> +	if (pdev->is_virtfn && virtiovf_support_legacy_access(pdev) &&
>> +	    !virtiovf_bar0_exists(pdev) && pdev->msix_cap)
>> +		ops = &virtiovf_acc_vfio_pci_tran_ops;
>
> This is still an issue for me, it's a very narrow use case where we
> have a modern device and want to enable legacy support.  Implementing an
> IO BAR and mangling the device ID seems like it should be an opt-in,
> not standard behavior for any compatible device.  Users should
> generally expect that the device they see in the host is the device
> they see in the guest.  They might even rely on that principle.

Users here mainly refer to cloud operators.

We may assume, I believe, that they will be fine with seeing a 
transitional device in the guest as they would like to get the legacy IO 
support for their system.

However, we can still consider supplying a configuration knob in the 
device layer (e.g. in the DPU side) to let a cloud operator turning off 
the legacy capability.

In that case upon probe() of the vfio-virtio driver, we'll just pick-up 
the default vfio-pci 'ops' and in the guest we may have the same device 
ID as of in the host.

With that approach we may not require a HOST side control (i.e. sysfs, 
etc.), but stay with a s device control based on its user manual.

At the end, we don't expect any functional issue nor any compatible 
problem with the new driver, both modern and legacy drivers can work in 
the guest.

Can that work for you ?

>
> We can't use the argument that users wanting the default device should
> use vfio-pci rather than virtio-vfio-pci because we've already defined
> the algorithm by which libvirt should choose a variant driver for a
> device.  libvirt will choose this driver for all virtio-net devices.
>
> This driver effectively has the option to expose two different profiles
> for the device, native or transitional.  We've discussed profile
> support for variant drivers previously as an equivalent functionality
> to mdev types, but the only use case for this currently is out-of-tree.
> I think this might be the opportunity to define how device profiles are
> exposed and selected in a variant driver.
>
> Jason had previously suggested a devlink interface for this, but I
> understand that path had been shot down by devlink developers.  Another
> obvious option is sysfs, where we might imagine an optional "profiles"
> directory, perhaps under vfio-dev.  Attributes of "available" and
> "current" could allow discovery and selection of a profile similar to
> mdev types.

Referring to the sysfs option,

Do you expect the sysfs data to effect the libvirt decision ? may that 
require changes in libvirt ?

In addition,
May that be too late as the sysfs entry will be created upon driver 
binding by libvirt or that we have in mind some other option to control 
with that ?

Jason,
Can you please comment here as well ?

> Is this where we should head with this or are there other options to
> confine this transitional behavior?
>
> BTW, what is "acc" in virtiovf_acc_vfio_pci_ops?

"acc" is just a short-cut to "access", see also here[1] a similar usage.

[1] 
https://elixir.bootlin.com/linux/v6.6-rc6/source/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c#L1380

>
>> +
>> +	virtvdev = vfio_alloc_device(virtiovf_pci_core_device, core_device.vdev,
>> +				     &pdev->dev, ops);
>> +	if (IS_ERR(virtvdev))
>> +		return PTR_ERR(virtvdev);
>> +
>> +	dev_set_drvdata(&pdev->dev, &virtvdev->core_device);
>> +	ret = vfio_pci_core_register_device(&virtvdev->core_device);
>> +	if (ret)
>> +		goto out;
>> +	return 0;
>> +out:
>> +	vfio_put_device(&virtvdev->core_device.vdev);
>> +	return ret;
>> +}
>> +
>> +static void virtiovf_pci_remove(struct pci_dev *pdev)
>> +{
>> +	struct virtiovf_pci_core_device *virtvdev = dev_get_drvdata(&pdev->dev);
>> +
>> +	vfio_pci_core_unregister_device(&virtvdev->core_device);
>> +	vfio_put_device(&virtvdev->core_device.vdev);
>> +}
>> +
>> +static const struct pci_device_id virtiovf_pci_table[] = {
>> +	/* Only virtio-net is supported/tested so far */
>> +	{ PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_REDHAT_QUMRANET, 0x1041) },
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(pci, virtiovf_pci_table);
>> +
>> +static struct pci_driver virtiovf_pci_driver = {
>> +	.name = KBUILD_MODNAME,
>> +	.id_table = virtiovf_pci_table,
>> +	.probe = virtiovf_pci_probe,
>> +	.remove = virtiovf_pci_remove,
>> +	.err_handler = &vfio_pci_core_err_handlers,
>> +	.driver_managed_dma = true,
>> +};
>> +
>> +module_pci_driver(virtiovf_pci_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Yishai Hadas <yishaih@nvidia.com>");
>> +MODULE_DESCRIPTION(
>> +	"VIRTIO VFIO PCI - User Level meta-driver for VIRTIO device family");
> Not yet "family" per the device table.  Thanks,

Right

How about dropping the word "family" and say instead ".. for VIRTIO 
devices" as we have in the Kconfig in that patch [1] ?

[1] "This provides support for exposing VIRTIO VF devices .."

Yishai

> Alex
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
