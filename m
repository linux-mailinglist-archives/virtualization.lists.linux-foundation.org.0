Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005230525A
	for <lists.virtualization@lfdr.de>; Wed, 27 Jan 2021 06:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C8D38554A;
	Wed, 27 Jan 2021 05:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FLwHo7qLuZ-3; Wed, 27 Jan 2021 05:47:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDA6585683;
	Wed, 27 Jan 2021 05:47:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3823C013A;
	Wed, 27 Jan 2021 05:47:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C2B0C013A;
 Wed, 27 Jan 2021 05:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8ABCA85683;
 Wed, 27 Jan 2021 05:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPYKKKLwWKej; Wed, 27 Jan 2021 05:47:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2113.outbound.protection.outlook.com [40.107.94.113])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DE8D28554A;
 Wed, 27 Jan 2021 05:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWCdnlD663lgkZpeOo0agjmrilm03m/+qG29F66P48Mjo/zrkiIiqd/QWBPzypCUXWWWpi73mOpAmAvGbL4yfAwrj+YjDMkux7tIJNXdjRszak9OQQcTp8n88DVDcm5mrHeUONMmbWpqMB3kfgfq9XnwDoX8Im2P0BtXqH99hCaM2cCfQM1hg9Bx7np05fw4n2pOILj4SoC82fRtJedZMcP9dGXE1n+Q8EEP1794q2FhkxUeObmVxSuHe5k5AoFVsXR8eFE75iDFdS4Ezk0rAjesxW3Y+Mxvj6Nrk0510mFs3CsiiWASCdSgOtpI90yLeRNI1zOFscLc21PMhunt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhm60HSubGtCpzNeOFHz36wwAA8Nc2/oOCScsQH7yTA=;
 b=k9URkMRyaR3JUj1dcEJRLOTgK+hBxHTgFNCECc9FJC85E2XBan3crwdXf922htef0jfGLGrVv6oPYZ4M6bb/RoFI1x/wIkrXDHl8HpmJfTHoUa6DgSefTmysTmtGOtSg9IVC27lqRIASkNm4RqGWxkGnHYqcresZN+zRgBFe6gfkOarYZalYJYbuf7Y5kXw2Xzu141Sk8D7BQ8kMwW9JXaEyuw9alwhYfrqAs/D9kGVjFH95mfVX2z4w19ycYcQWefbcjPeDhjhHN7jiWAl5tarErjjee5nNFwTNkcviBB4awLC23hSPZaGCSk3NZVdjRJ9MeFqHM2xLJvrnzfn0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhm60HSubGtCpzNeOFHz36wwAA8Nc2/oOCScsQH7yTA=;
 b=JvIn+3xtJ8ZhzmtV4csxwGljCIucSdL+bwdIDR2his8akWSLbNMlbZ5KQU6NBJVrzOPBq+u3ojJNGgWIFScN/sJQL/b59XaKUL19vwzS/90Gyx4tpp5fj0VF8gU/rfgmJJaHvptQj7/xwc+Teu5pMBvoyFUZb1AfiAaIT9GQnkE=
Received: from (2603:10b6:301:7c::11) by
 MW4PR21MB1987.namprd21.prod.outlook.com (2603:10b6:303:78::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.2; Wed, 27 Jan 2021 05:47:08 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::9c8:94c9:faf1:17c2]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::9c8:94c9:faf1:17c2%9]) with mapi id 15.20.3825.003; Wed, 27 Jan 2021
 05:47:08 +0000
To: Wei Liu <wei.liu@kernel.org>, Linux on Hyper-V List
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v5 16/16] iommu/hyperv: setup an IO-APIC IRQ remapping
 domain for root partition
Thread-Topic: [PATCH v5 16/16] iommu/hyperv: setup an IO-APIC IRQ remapping
 domain for root partition
Thread-Index: AQHW7yP8YtCnZy7E10m8VGWiVVtuDao6/Hmg
Date: Wed, 27 Jan 2021 05:47:08 +0000
Message-ID: <MWHPR21MB15936ED25B56AF897B655B76D7BB9@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210120120058.29138-1-wei.liu@kernel.org>
 <20210120120058.29138-17-wei.liu@kernel.org>
In-Reply-To: <20210120120058.29138-17-wei.liu@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-01-27T05:47:06Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=65c0181f-1d15-4327-8596-032df4eec16b;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [66.75.126.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46aee165-deef-40c6-03eb-08d8c286fc61
x-ms-traffictypediagnostic: MW4PR21MB1987:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR21MB19871738F9A47DCD6D87DF09D7BB9@MW4PR21MB1987.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rbJAzdA9/1YKdHT3iYEelTpAj6S5FXsVs+2vCU3yOrtc8sgvjFpYSNGhCUSD103aSz6c07y6sG1uKV4nBAketTEao97Wf6xiHdZ6i9f6x6FRCVQOAKE9y/YuZ89F9tK5dDcDER4cJY5M8R0VteC3Vi+5NX+fywGR18CpSy5yHzpRTUxtRbZx8KHOnIsvgKVQwYV4f8jmjvgUL97KZoqNTNAJrzJWZ/ZK7RZ2TTsJNYKveKwfRWlqvJPb4UdsQQ3KkL4ZAR0DXeySsJxIo0TEv43Y9j2+zvbKfAulTyzdUhcPjDTO0KuauTtYmC43vuk1uIl2/2RgrQu4DoIcDxilkq538gP8U/4b6KeDzon/Cx5J9rVadVMzLY9u0Dnmat7A6syZ75CYoxJwiwi3t1Zi7RAZR/sM1W+zTmtAKz5akYH/gFQYswkX/FEvQ3WmQbdUzGPk1yoPGSvU6wpal3wFPCvA47wrt864/FYuAGGEF/fZ1OnJPaYAX8Qm3GtUPXzaoQ0nJ2716kAcOc8JMRWz5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(186003)(26005)(7696005)(2906002)(30864003)(8936002)(83380400001)(64756008)(55016002)(5660300002)(8676002)(6506007)(9686003)(10290500003)(478600001)(66946007)(33656002)(110136005)(52536014)(76116006)(86362001)(54906003)(71200400001)(8990500004)(4326008)(316002)(66476007)(66446008)(82950400001)(7416002)(66556008)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ILVhpiJgW3BokwwAwobXEXDlcZy3tm1muI+AAvx95kkwHuei5GDaggedBy9w?=
 =?us-ascii?Q?EdOKsAPLzfeD723SUW+48UE6myre2Vhf4RX0CWTnS2yYANBoSe44oA6OB7Wi?=
 =?us-ascii?Q?ixMMYt6sM+WMAVlrVHv7uZWKU64ejOy4QwMpxg8BZZMQn2bkpblJydaSBmXX?=
 =?us-ascii?Q?vaj2QYjzFKN0HobIZ715iB1dp+RmUs+83GSiOTrRArz8mbq3irO+pMwtE026?=
 =?us-ascii?Q?uv49As/1h4oI+BRC4WFaBMF+q70w3Q82XNFHHVjpp+VCX+mHpisPQz9N/8DT?=
 =?us-ascii?Q?4fg/6/rGu5Zw042ctjYy9qoepKsFS66u4l/v96W5fh1wyNG2aYoC/4ZBlAwr?=
 =?us-ascii?Q?FDTBYSOfdeJfaGQycj5Hd6llgdGMbDYLiDd9U9mPwZPYrrUP3mA/cpeCnDJ7?=
 =?us-ascii?Q?A6Oy3fK5CQ4bxJctUXu5gLPzDsvDHqh+r4PPrMm99O4SHcsWW6j9R4r2EZsj?=
 =?us-ascii?Q?R4+JPe1QUG2KPnBRqKkPjDUnNz3T+ITJ/GN/c59Avts1gcPvj08cFvb91XQT?=
 =?us-ascii?Q?zMrkt7LzF3OJ/W/XihebVQjk4mShlpsyAHB3BvAcxZU/wiXrIiMGESJPAiHM?=
 =?us-ascii?Q?uq2TaQr9ihyCV2Xi3qvL2MqkEtTvApJwimdSKI925B+wJ8mvZLHAidwsCOEX?=
 =?us-ascii?Q?7otPw5kVxBD429ABqrnbX8xbuy207qMadfhD+f+3/ESMXA8hj5uUCHFGAYqB?=
 =?us-ascii?Q?XhvpE6T6M89Uh5G4S7oz383BIwyWEGBQ8zADaEaOnJlODttFSrWJ7/IbPIqu?=
 =?us-ascii?Q?WyffNnA167AwfKj4qBMpOWwjwOjFIgm1dABxPaSvrc8rps46zM5PiewQxqUi?=
 =?us-ascii?Q?lIUKtR+Xwha8B7XjY+U7ducvkWt/pEuaf3XfyB2/sndkphllqT8l34AkXi4L?=
 =?us-ascii?Q?TIBDdCgxsVBNuRC+UMfGpmr3iiePrVvcSK2vfya4KFAWMc+k0GCW1Ukes3Kx?=
 =?us-ascii?Q?wSBL2Zumjm0MLis0vunU/5/0BXZbz279hBhitiXs2oGv2Va4tllpwCpE7+2y?=
 =?us-ascii?Q?s9qtFsbG1ZKpe8bPGugZ5AtQkDIPpJScMg/isabCdkQPHAkwG6shbuPZnz99?=
 =?us-ascii?Q?dFsACQBo?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46aee165-deef-40c6-03eb-08d8c286fc61
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 05:47:08.7208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzbu5X/5dJ02NyOarg4pzTzr3RkyzXkErJ+w9CD8j1ohoc1zzVBNUVZzhnKTIVJWbQTd6i6U/Xor/I350MUiH4un3GEaaXJp5omosO9umow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1987
Cc: Stephen Hemminger <sthemmin@microsoft.com>,
 "pasha.tatashin@soleen.com" <pasha.tatashin@soleen.com>,
 Will Deacon <will@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter
 Anvin" <hpa@zytor.com>, Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Vineeth Pillai <viremana@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>
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
From: Michael Kelley via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Wei Liu <wei.liu@kernel.org> Sent: Wednesday, January 20, 2021 4:01 AM
> 
> Just like MSI/MSI-X, IO-APIC interrupts are remapped by Microsoft
> Hypervisor when Linux runs as the root partition. Implement an IRQ
> domain to handle mapping and unmapping of IO-APIC interrupts.
> 
> Signed-off-by: Wei Liu <wei.liu@kernel.org>
> ---
>  arch/x86/hyperv/irqdomain.c     |  54 ++++++++++
>  arch/x86/include/asm/mshyperv.h |   4 +
>  drivers/iommu/hyperv-iommu.c    | 179 +++++++++++++++++++++++++++++++-
>  3 files changed, 233 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
> index 19637cd60231..8e2b4e478b70 100644
> --- a/arch/x86/hyperv/irqdomain.c
> +++ b/arch/x86/hyperv/irqdomain.c
> @@ -330,3 +330,57 @@ struct irq_domain * __init hv_create_pci_msi_domain(void)
>  }
> 
>  #endif /* CONFIG_PCI_MSI */
> +
> +int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry)
> +{
> +	union hv_device_id device_id;
> +
> +	device_id.as_uint64 = 0;
> +	device_id.device_type = HV_DEVICE_TYPE_IOAPIC;
> +	device_id.ioapic.ioapic_id = (u8)ioapic_id;
> +
> +	return hv_unmap_interrupt(device_id.as_uint64, entry) & HV_HYPERCALL_RESULT_MASK;

The masking is already done in hv_unmap_interrupt.

> +}
> +EXPORT_SYMBOL_GPL(hv_unmap_ioapic_interrupt);
> +
> +int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
> +		struct hv_interrupt_entry *entry)
> +{
> +	unsigned long flags;
> +	struct hv_input_map_device_interrupt *input;
> +	struct hv_output_map_device_interrupt *output;
> +	union hv_device_id device_id;
> +	struct hv_device_interrupt_descriptor *intr_desc;
> +	u16 status;
> +
> +	device_id.as_uint64 = 0;
> +	device_id.device_type = HV_DEVICE_TYPE_IOAPIC;
> +	device_id.ioapic.ioapic_id = (u8)ioapic_id;
> +
> +	local_irq_save(flags);
> +	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
> +	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
> +	memset(input, 0, sizeof(*input));
> +	intr_desc = &input->interrupt_descriptor;
> +	input->partition_id = hv_current_partition_id;
> +	input->device_id = device_id.as_uint64;
> +	intr_desc->interrupt_type = HV_X64_INTERRUPT_TYPE_FIXED;
> +	intr_desc->target.vector = vector;
> +	intr_desc->vector_count = 1;
> +
> +	if (level)
> +		intr_desc->trigger_mode = HV_INTERRUPT_TRIGGER_MODE_LEVEL;
> +	else
> +		intr_desc->trigger_mode = HV_INTERRUPT_TRIGGER_MODE_EDGE;
> +
> +	__set_bit(vcpu, (unsigned long *)&intr_desc->target.vp_mask);
> +
> +	status = hv_do_rep_hypercall(HVCALL_MAP_DEVICE_INTERRUPT, 0, 0, input, output) &
> +			 HV_HYPERCALL_RESULT_MASK;
> +	local_irq_restore(flags);
> +
> +	*entry = output->interrupt_entry;
> +
> +	return status;

As a cross-check, I was comparing this code against hv_map_msi_interrupt().  They are
mostly parallel, though some of the assignments are done in a different order.  It's a nit,
but making them as parallel as possible would be nice. :-)

Same 64 vCPU comment applies here as well.


> +}
> +EXPORT_SYMBOL_GPL(hv_map_ioapic_interrupt);
> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> index ccc849e25d5e..345d7c6f8c37 100644
> --- a/arch/x86/include/asm/mshyperv.h
> +++ b/arch/x86/include/asm/mshyperv.h
> @@ -263,6 +263,10 @@ static inline void hv_set_msi_entry_from_desc(union
> hv_msi_entry *msi_entry,
> 
>  struct irq_domain *hv_create_pci_msi_domain(void);
> 
> +int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
> +		struct hv_interrupt_entry *entry);
> +int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
> +
>  #else /* CONFIG_HYPERV */
>  static inline void hyperv_init(void) {}
>  static inline void hyperv_setup_mmu_ops(void) {}
> diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
> index b7db6024e65c..6d35e4c303c6 100644
> --- a/drivers/iommu/hyperv-iommu.c
> +++ b/drivers/iommu/hyperv-iommu.c
> @@ -116,30 +116,43 @@ static const struct irq_domain_ops hyperv_ir_domain_ops = {
>  	.free = hyperv_irq_remapping_free,
>  };
> 
> +static const struct irq_domain_ops hyperv_root_ir_domain_ops;
>  static int __init hyperv_prepare_irq_remapping(void)
>  {
>  	struct fwnode_handle *fn;
>  	int i;
> +	const char *name;
> +	const struct irq_domain_ops *ops;
> 
>  	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV) ||
>  	    x86_init.hyper.msi_ext_dest_id() ||
> -	    !x2apic_supported() || hv_root_partition)
> +	    !x2apic_supported())

Any reason that the check for hv_root_partition was added
in patch #4  of this series, and then removed here?  Could
patch #4 just be dropped?

>  		return -ENODEV;
> 
> -	fn = irq_domain_alloc_named_id_fwnode("HYPERV-IR", 0);
> +	if (hv_root_partition) {
> +		name = "HYPERV-ROOT-IR";
> +		ops = &hyperv_root_ir_domain_ops;
> +	} else {
> +		name = "HYPERV-IR";
> +		ops = &hyperv_ir_domain_ops;
> +	}
> +
> +	fn = irq_domain_alloc_named_id_fwnode(name, 0);
>  	if (!fn)
>  		return -ENOMEM;
> 
>  	ioapic_ir_domain =
>  		irq_domain_create_hierarchy(arch_get_ir_parent_domain(),
> -				0, IOAPIC_REMAPPING_ENTRY, fn,
> -				&hyperv_ir_domain_ops, NULL);
> +				0, IOAPIC_REMAPPING_ENTRY, fn, ops, NULL);
> 
>  	if (!ioapic_ir_domain) {
>  		irq_domain_free_fwnode(fn);
>  		return -ENOMEM;
>  	}
> 
> +	if (hv_root_partition)
> +		return 0; /* The rest is only relevant to guests */
> +
>  	/*
>  	 * Hyper-V doesn't provide irq remapping function for
>  	 * IO-APIC and so IO-APIC only accepts 8-bit APIC ID.
> @@ -167,4 +180,162 @@ struct irq_remap_ops hyperv_irq_remap_ops = {
>  	.enable			= hyperv_enable_irq_remapping,
>  };
> 
> +/* IRQ remapping domain when Linux runs as the root partition */
> +struct hyperv_root_ir_data {
> +	u8 ioapic_id;
> +	bool is_level;
> +	struct hv_interrupt_entry entry;
> +};
> +
> +static void
> +hyperv_root_ir_compose_msi_msg(struct irq_data *irq_data, struct msi_msg *msg)
> +{
> +	u16 status;
> +	u32 vector;
> +	struct irq_cfg *cfg;
> +	int ioapic_id;
> +	struct cpumask *affinity;
> +	int cpu, vcpu;
> +	struct hv_interrupt_entry entry;
> +	struct hyperv_root_ir_data *data = irq_data->chip_data;
> +	struct IO_APIC_route_entry e;
> +
> +	cfg = irqd_cfg(irq_data);
> +	affinity = irq_data_get_effective_affinity_mask(irq_data);
> +	cpu = cpumask_first_and(affinity, cpu_online_mask);
> +	vcpu = hv_cpu_number_to_vp_number(cpu);
> +
> +	vector = cfg->vector;
> +	ioapic_id = data->ioapic_id;
> +
> +	if (data->entry.source == HV_DEVICE_TYPE_IOAPIC

Does 'data' need to be checked to be non-NULL?  The parallel code in
hv_irq_compose_msi_msg() makes such a check.

> +	    && data->entry.ioapic_rte.as_uint64) {
> +		entry = data->entry;
> +
> +		status = hv_unmap_ioapic_interrupt(ioapic_id, &entry);
> +
> +		if (status != HV_STATUS_SUCCESS)
> +			pr_debug("%s: unexpected unmap status %d\n", __func__, status);
> +
> +		data->entry.ioapic_rte.as_uint64 = 0;
> +		data->entry.source = 0; /* Invalid source */

Again comparing, hv_irq_compose_msi_msg() frees the old
entry, and then allocates a new one.   This code reuses the old entry. 
Any reason for the difference?

> +	}
> +
> +
> +	status = hv_map_ioapic_interrupt(ioapic_id, data->is_level, vcpu,
> +					vector, &entry);
> +
> +	if (status != HV_STATUS_SUCCESS) {
> +		pr_err("%s: map hypercall failed, status %d\n", __func__, status);
> +		return;
> +	}
> +
> +	data->entry = entry;
> +
> +	/* Turn it into an IO_APIC_route_entry, and generate MSI MSG. */
> +	e.w1 = entry.ioapic_rte.low_uint32;
> +	e.w2 = entry.ioapic_rte.high_uint32;
> +
> +	memset(msg, 0, sizeof(*msg));
> +	msg->arch_data.vector = e.vector;
> +	msg->arch_data.delivery_mode = e.delivery_mode;
> +	msg->arch_addr_lo.dest_mode_logical = e.dest_mode_logical;
> +	msg->arch_addr_lo.dmar_format = e.ir_format;
> +	msg->arch_addr_lo.dmar_index_0_14 = e.ir_index_0_14;
> +}

Having this whole function be more parallel to hv_irq_compose_msi_msg()
would be nice. :-)

> +
> +static int hyperv_root_ir_set_affinity(struct irq_data *data,
> +		const struct cpumask *mask, bool force)
> +{
> +	struct irq_data *parent = data->parent_data;
> +	struct irq_cfg *cfg = irqd_cfg(data);
> +	int ret;
> +
> +	ret = parent->chip->irq_set_affinity(parent, mask, force);
> +	if (ret < 0 || ret == IRQ_SET_MASK_OK_DONE)
> +		return ret;
> +
> +	send_cleanup_vector(cfg);
> +
> +	return 0;
> +}
> +
> +static struct irq_chip hyperv_root_ir_chip = {
> +	.name			= "HYPERV-ROOT-IR",
> +	.irq_ack		= apic_ack_irq,
> +	.irq_set_affinity	= hyperv_root_ir_set_affinity,
> +	.irq_compose_msi_msg	= hyperv_root_ir_compose_msi_msg,
> +};
> +
> +static int hyperv_root_irq_remapping_alloc(struct irq_domain *domain,
> +				     unsigned int virq, unsigned int nr_irqs,
> +				     void *arg)
> +{
> +	struct irq_alloc_info *info = arg;
> +	struct irq_data *irq_data;
> +	struct hyperv_root_ir_data *data;
> +	int ret = 0;
> +
> +	if (!info || info->type != X86_IRQ_ALLOC_TYPE_IOAPIC || nr_irqs > 1)
> +		return -EINVAL;
> +
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
> +	if (ret < 0)
> +		return ret;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +		return -ENOMEM;
> +	}
> +
> +	irq_data = irq_domain_get_irq_data(domain, virq);
> +	if (!irq_data) {
> +		kfree(data);
> +		irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +		return -EINVAL;
> +	}
> +
> +	data->ioapic_id = info->devid;
> +	data->is_level = info->ioapic.is_level;
> +
> +	irq_data->chip = &hyperv_root_ir_chip;
> +	irq_data->chip_data = data;
> +
> +	return 0;
> +}
> +
> +static void hyperv_root_irq_remapping_free(struct irq_domain *domain,
> +				 unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct irq_data *irq_data;
> +	struct hyperv_root_ir_data *data;
> +	struct hv_interrupt_entry *e;
> +	int i;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irq_data = irq_domain_get_irq_data(domain, virq + i);
> +
> +		if (irq_data && irq_data->chip_data) {
> +			data = irq_data->chip_data;

Set irq_data->chip_data to NULL?  That seems to be done in other
similar places in your code.

> +			e = &data->entry;
> +
> +			if (e->source == HV_DEVICE_TYPE_IOAPIC
> +			      && e->ioapic_rte.as_uint64)
> +				hv_unmap_ioapic_interrupt(data->ioapic_id,
> +							&data->entry);
> +
> +			kfree(data);
> +		}
> +	}
> +
> +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +}
> +
> +static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
> +	.select = hyperv_irq_remapping_select,
> +	.alloc = hyperv_root_irq_remapping_alloc,
> +	.free = hyperv_root_irq_remapping_free,
> +};
> +
>  #endif
> --
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
