Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA430F82F
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 17:41:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37F9D864AB;
	Thu,  4 Feb 2021 16:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpPldLfQ7pgp; Thu,  4 Feb 2021 16:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28278864C3;
	Thu,  4 Feb 2021 16:41:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C158FC013A;
	Thu,  4 Feb 2021 16:41:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAA81C013A;
 Thu,  4 Feb 2021 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D74188643D;
 Thu,  4 Feb 2021 16:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8bLnMbs5Tgu; Thu,  4 Feb 2021 16:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2110.outbound.protection.outlook.com [40.107.93.110])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9510086432;
 Thu,  4 Feb 2021 16:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQX71XvIydrbYqE11zO1ADLJ0JX0R0qsD9ChlRnzg1GecEGGtjPMo6jRYPQ+yWBKsnzKPKI0CMFTIQXTStTkbnBK/vD9miCaJKH5APmsJuhdKE42OGGLFK62wShsdMmqBinFmmnYqEVIv2OWp0VnND1LOg0hqfcral+cpAZqHMmk7pshA1g2uk4bGqrI3wSIUgo/jLOmibj9DSaqOAjTYWwrI+JdU4nAnqXOHVQKNK/rTrYEqfkZaPFDfRXxgAxQhR1xM6HmOcUe4s2GhTRvcTZWklKsDWXyj0AHMKV3iIymKyzZuNV1Yx2gLuPmvNiaZR2nD/SFFMPOYHKVoHuRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA8L9Fbzy0Nij5mAuO2b4fzh/TjRYtQYuL2l1Ef3rcM=;
 b=n7g23Dp5lje52hdTxeK4cVmYsZWnMooeffBXXRlg9lPT1reJGObJs1Cu90KUFJvElEq4OdOeNTBdMEtK8r7TaHwh0bA4Woi2y3LLlWCFlxaTN+dE7nc6o5UsWJ5f6J4shkA4VoH2IGCCEI49os8O4gpZVh6xNdNmy0pWGsfSS/b23+DxZdlNf0zuenLISWNFpuh1I+CZHRBePRjR8xskMDdPJItxpAJVKIvUf+FHi4RZgQdqXqHsEMRd1Gghozv7bPZZbmy9jkqkJsPNZQKtcLeP+m6YYu8180DcJTBqKE92QUcGC9Iwc+TV000Jh0gMh+Ph5TVdXbIrCVZmittbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA8L9Fbzy0Nij5mAuO2b4fzh/TjRYtQYuL2l1Ef3rcM=;
 b=eD8PI5hmMo5jCB9DpQS4iTmVtB76qeGbUom1FidWnOrSRjbdixaN3LyHWK2CQKgmPbPrucleEfP4FEq2/DPvoJb/3yskqGXY0nwOpCuOgfqNe+ZR9U/J2IfDhSZYgIYIQPZYaSJEzDd1XbN9IWkwnnJL3Dlrh/cWd6NmIrRXdhY=
Received: from (2603:10b6:301:7c::11) by
 MW4PR21MB1874.namprd21.prod.outlook.com (2603:10b6:303:73::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.3; Thu, 4 Feb 2021 16:41:47 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::9c8:94c9:faf1:17c2]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::9c8:94c9:faf1:17c2%9]) with mapi id 15.20.3846.006; Thu, 4 Feb 2021
 16:41:47 +0000
To: Wei Liu <wei.liu@kernel.org>
Subject: RE: [PATCH v5 16/16] iommu/hyperv: setup an IO-APIC IRQ remapping
 domain for root partition
Thread-Topic: [PATCH v5 16/16] iommu/hyperv: setup an IO-APIC IRQ remapping
 domain for root partition
Thread-Index: AQHW7yP8YtCnZy7E10m8VGWiVVtuDao6/HmggAt6kgCAAdJPsA==
Date: Thu, 4 Feb 2021 16:41:47 +0000
Message-ID: <MWHPR21MB1593F0BB81545B450D2ACBE6D7B39@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210120120058.29138-1-wei.liu@kernel.org>
 <20210120120058.29138-17-wei.liu@kernel.org>
 <MWHPR21MB15936ED25B56AF897B655B76D7BB9@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20210203124700.ugx5vd526455u7lb@liuwe-devbox-debian-v2>
In-Reply-To: <20210203124700.ugx5vd526455u7lb@liuwe-devbox-debian-v2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-02-04T16:41:45Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=1bdeb6aa-cb4a-406c-933b-e8e4beb73466;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b17701db-3e6b-4ebb-a95c-08d8c92bc389
x-ms-traffictypediagnostic: MW4PR21MB1874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR21MB1874F30B9FA81B490AEF6749D7B39@MW4PR21MB1874.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oW5DtwBz/pRxtHjDF0HyLvIC0oae4eMXTgBcknaOUZcVW/6MA+0pr2KJkSrjSoZNXerJUHlrFZV0iKIBv627ECjCMieuMvcDn7//DYAh/vw+VG1+uAox1QeVgmdhCPomYNp2wTEG8yxEgSesnTOiZk6goy5gisbp7HB7aIEpLDhfrEhWMICjsuoYN3FyzCQv41g39IgiTc1lU/dANuouFaoYxN9l/I+TMkxxM36+AKLLWMiJs8A86il1S5C7CxFqz8pn17E2BYHiK6sFMhOBGP1gxw0xYr2qElQeQ+VkVYDAvIsYAHuOCHRDUjOOkewP5JJhKXWPpxS9OFW5tpDUYipiOscijoRoVHDYwZEEtA1G2AQJZqYx/+DWHR8RG+6b0S4Y+rJIOLy6pL4xBxT2qmK10+XJ0uuk+s/Ya9nZuSWZbMN/BomeJJtOv4VVmCezAkyG5yEt5nkC2L7IhtsG+GKOF7V6xhXeDJ3EjVi59mDm7SXHnQl9J0tNK32n1NIFt0yDmYw5KSqzJ45i8YBFnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(86362001)(8990500004)(9686003)(10290500003)(26005)(55016002)(33656002)(6506007)(186003)(7696005)(54906003)(8936002)(316002)(2906002)(478600001)(82960400001)(82950400001)(64756008)(66446008)(30864003)(6916009)(52536014)(76116006)(71200400001)(4326008)(83380400001)(5660300002)(8676002)(66946007)(66476007)(66556008)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2QTFpTtlDj6HEvkFvPefAtln9oGi0tzK7+FCIHl+6u3FfeZR2RNqv7YenIqf?=
 =?us-ascii?Q?TAzb8PdkPeB+ZMXUcjWR8sxWG838+ce1nQiO6L1LVfOC2sDnGkzUF4tdKmiK?=
 =?us-ascii?Q?IBKOXSgyBUSMGMhYmxVx9nhu3u2SJywKQlkH3IRynHh9ear7wCwQCrGN6ZA+?=
 =?us-ascii?Q?YtgGTHcvH1jU7BkZXCduVpO20BWgbRpX11JWJuGv858d1xceTc683TzLPyQW?=
 =?us-ascii?Q?3mpyNBo7YqdIB7LhZYpDLlrkOXsVqMnYIxJJ6VEyARE/8YLiPQQvCo5JHCXb?=
 =?us-ascii?Q?Y7WgPnDEM25eAQ7z3VEbWDW8CE24U9y2CYmpSOPugElXERxiynjUyIAzJ1L+?=
 =?us-ascii?Q?YDye9tzq8PpSKStj1WsUu8OdQKzUvHekq//qOXmLa49SerNiPuaHVu58qs2h?=
 =?us-ascii?Q?6nrZPRK/L6HZ2QGsZHbxpz77kFGIPvqe3HxvL06+yN+DOVu6Lk9KenFPV8N5?=
 =?us-ascii?Q?ddylBooWilSSiNYy7MDsDVgqq5HFKgdhicgv4MSw6PmtOefcoQY0SnElqPnQ?=
 =?us-ascii?Q?1r0WvG4g82dRlnBrdiZtX0dQmIXW8qmU+EiRq4uC+MyNr5ST9GHofcuXZg/R?=
 =?us-ascii?Q?QHxCutcHY5FOwkmli8mK0sExlot7bZJ9bTYNkSw4azP/rtxfQXfeCa7Ad14Z?=
 =?us-ascii?Q?J+8pUuT/ftL9BXRExBwqOpm/HuYRVM1MWGm3P0AyuwZ+XhS/xBl0az/XA2ht?=
 =?us-ascii?Q?Uj3L2lLZxvh9t173oQUFWMDAqzmNbdE6lXXd/zFpgigTdtkGREKoR5JlSilK?=
 =?us-ascii?Q?+37FXSKLfEvXAluulZACYJ1xbnQTsc/n0XRFsEbtK2+UgEdQE5+2Cc62pf3I?=
 =?us-ascii?Q?lrIN075zXmBTANP1gAECs8VsnN3JMrIBoDuRvY1Ycps9uKZN3e+vneGLzGG1?=
 =?us-ascii?Q?sL73E8mcj+RenKBOluGGDV5sKkZBSCdUYd22cxelPg0u2x1y4ooQbVaXbNyp?=
 =?us-ascii?Q?QviOkLYyZiPA4ugm12CYx/yKR61jJoxuj9Wh4FCClWhk5arW1hY4iSFVfdTi?=
 =?us-ascii?Q?AWkeF6/ukLdHMZ9OQyTPxwiaW0tdKV6MhgT3BYXBDG14xEmwntR03jU9exNJ?=
 =?us-ascii?Q?IwJXE5W1rFTz/QTXInw2ORwAMd+QmbIoQrhboE/1ERe6kXEzBaeRVUDuziUg?=
 =?us-ascii?Q?KDNYTprqJnz8TiMeBUee8jPsT4I8V/2NJfTVsHGy4BM/CwHFKCL2c4Gv7MyI?=
 =?us-ascii?Q?Z0QbRK1e86wiCfsjGCCWs4F6FhowKeBedwVyvCqV9ZHtBMOlOV76Q/kf9lLA?=
 =?us-ascii?Q?7iYKqyyo3PqDuyf+KTIedzNiPYM+hJfn/ExOzoTy2//PO7S+CULmldJ2vZ9N?=
 =?us-ascii?Q?1SoK2eOwdR8Xo+5fksnHBiaJ?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17701db-3e6b-4ebb-a95c-08d8c92bc389
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 16:41:47.1772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDQ5uEzjVTdRe8XO2Yk0BePktBSsjriIeb3ehjbJCHOmRSu6mgnNlB2O5YPOZQWTs6c1+nnXKFuU+OBlprG9Zn6tbDb/8Wrx/AXJLUHg6BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1874
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
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

From: Wei Liu <wei.liu@kernel.org> Sent: Wednesday, February 3, 2021 4:47 AM
> 
> On Wed, Jan 27, 2021 at 05:47:08AM +0000, Michael Kelley wrote:
> > From: Wei Liu <wei.liu@kernel.org> Sent: Wednesday, January 20, 2021 4:01 AM
> > >
> > > Just like MSI/MSI-X, IO-APIC interrupts are remapped by Microsoft
> > > Hypervisor when Linux runs as the root partition. Implement an IRQ
> > > domain to handle mapping and unmapping of IO-APIC interrupts.
> > >
> > > Signed-off-by: Wei Liu <wei.liu@kernel.org>
> > > ---
> > >  arch/x86/hyperv/irqdomain.c     |  54 ++++++++++
> > >  arch/x86/include/asm/mshyperv.h |   4 +
> > >  drivers/iommu/hyperv-iommu.c    | 179 +++++++++++++++++++++++++++++++-
> > >  3 files changed, 233 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
> > > index 19637cd60231..8e2b4e478b70 100644
> > > --- a/arch/x86/hyperv/irqdomain.c
> > > +++ b/arch/x86/hyperv/irqdomain.c
> > > @@ -330,3 +330,57 @@ struct irq_domain * __init hv_create_pci_msi_domain(void)
> > >  }
> > >
> > >  #endif /* CONFIG_PCI_MSI */
> > > +
> > > +int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry)
> > > +{
> > > +	union hv_device_id device_id;
> > > +
> > > +	device_id.as_uint64 = 0;
> > > +	device_id.device_type = HV_DEVICE_TYPE_IOAPIC;
> > > +	device_id.ioapic.ioapic_id = (u8)ioapic_id;
> > > +
> > > +	return hv_unmap_interrupt(device_id.as_uint64, entry) &
> HV_HYPERCALL_RESULT_MASK;
> >
> > The masking is already done in hv_unmap_interrupt.
> 
> Fixed.
> 
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(hv_unmap_ioapic_interrupt);
> > > +
> > > +int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
> > > +		struct hv_interrupt_entry *entry)
> > > +{
> > > +	unsigned long flags;
> > > +	struct hv_input_map_device_interrupt *input;
> > > +	struct hv_output_map_device_interrupt *output;
> > > +	union hv_device_id device_id;
> > > +	struct hv_device_interrupt_descriptor *intr_desc;
> > > +	u16 status;
> > > +
> > > +	device_id.as_uint64 = 0;
> > > +	device_id.device_type = HV_DEVICE_TYPE_IOAPIC;
> > > +	device_id.ioapic.ioapic_id = (u8)ioapic_id;
> > > +
> > > +	local_irq_save(flags);
> > > +	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
> > > +	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
> > > +	memset(input, 0, sizeof(*input));
> > > +	intr_desc = &input->interrupt_descriptor;
> > > +	input->partition_id = hv_current_partition_id;
> > > +	input->device_id = device_id.as_uint64;
> > > +	intr_desc->interrupt_type = HV_X64_INTERRUPT_TYPE_FIXED;
> > > +	intr_desc->target.vector = vector;
> > > +	intr_desc->vector_count = 1;
> > > +
> > > +	if (level)
> > > +		intr_desc->trigger_mode = HV_INTERRUPT_TRIGGER_MODE_LEVEL;
> > > +	else
> > > +		intr_desc->trigger_mode = HV_INTERRUPT_TRIGGER_MODE_EDGE;
> > > +
> > > +	__set_bit(vcpu, (unsigned long *)&intr_desc->target.vp_mask);
> > > +
> > > +	status = hv_do_rep_hypercall(HVCALL_MAP_DEVICE_INTERRUPT, 0, 0, input,
> output) &
> > > +			 HV_HYPERCALL_RESULT_MASK;
> > > +	local_irq_restore(flags);
> > > +
> > > +	*entry = output->interrupt_entry;
> > > +
> > > +	return status;
> >
> > As a cross-check, I was comparing this code against hv_map_msi_interrupt().  They are
> > mostly parallel, though some of the assignments are done in a different order.  It's a nit,
> > but making them as parallel as possible would be nice. :-)
> >
> 
> Indeed. I will see about factoring out a function.

If factoring out a separate helper function is clumsy, just having the parallel code
in the two functions be as similar as possible makes it easier to see what's the
same and what's different.

> 
> > Same 64 vCPU comment applies here as well.
> >
> 
> This is changed to use vpset instead. Took me a bit of time to get it
> working because document is a bit lacking.
> 
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(hv_map_ioapic_interrupt);
> > > diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> > > index ccc849e25d5e..345d7c6f8c37 100644
> > > --- a/arch/x86/include/asm/mshyperv.h
> > > +++ b/arch/x86/include/asm/mshyperv.h
> > > @@ -263,6 +263,10 @@ static inline void hv_set_msi_entry_from_desc(union
> > > hv_msi_entry *msi_entry,
> > >
> > >  struct irq_domain *hv_create_pci_msi_domain(void);
> > >
> > > +int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
> > > +		struct hv_interrupt_entry *entry);
> > > +int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
> > > +
> > >  #else /* CONFIG_HYPERV */
> > >  static inline void hyperv_init(void) {}
> > >  static inline void hyperv_setup_mmu_ops(void) {}
> > > diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
> > > index b7db6024e65c..6d35e4c303c6 100644
> > > --- a/drivers/iommu/hyperv-iommu.c
> > > +++ b/drivers/iommu/hyperv-iommu.c
> > > @@ -116,30 +116,43 @@ static const struct irq_domain_ops hyperv_ir_domain_ops = {
> > >  	.free = hyperv_irq_remapping_free,
> > >  };
> > >
> > > +static const struct irq_domain_ops hyperv_root_ir_domain_ops;
> > >  static int __init hyperv_prepare_irq_remapping(void)
> > >  {
> > >  	struct fwnode_handle *fn;
> > >  	int i;
> > > +	const char *name;
> > > +	const struct irq_domain_ops *ops;
> > >
> > >  	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV) ||
> > >  	    x86_init.hyper.msi_ext_dest_id() ||
> > > -	    !x2apic_supported() || hv_root_partition)
> > > +	    !x2apic_supported())
> >
> > Any reason that the check for hv_root_partition was added
> > in patch #4  of this series, and then removed here?  Could
> > patch #4 just be dropped?
> >
> 
> Before v5 (or v4?) IO-APIC was not handled via Hyper-V IOMMU. Now it is.
> 
> Patch 4 has become redundant with that change. I already dropped patch 4
> in the v6 branch I have locally.
> 
> > >  		return -ENODEV;
> > >
> > > -	fn = irq_domain_alloc_named_id_fwnode("HYPERV-IR", 0);
> > > +	if (hv_root_partition) {
> > > +		name = "HYPERV-ROOT-IR";
> > > +		ops = &hyperv_root_ir_domain_ops;
> > > +	} else {
> > > +		name = "HYPERV-IR";
> > > +		ops = &hyperv_ir_domain_ops;
> > > +	}
> > > +
> [...]
> > > +static void
> > > +hyperv_root_ir_compose_msi_msg(struct irq_data *irq_data, struct msi_msg *msg)
> > > +{
> > > +	u16 status;
> > > +	u32 vector;
> > > +	struct irq_cfg *cfg;
> > > +	int ioapic_id;
> > > +	struct cpumask *affinity;
> > > +	int cpu, vcpu;
> > > +	struct hv_interrupt_entry entry;
> > > +	struct hyperv_root_ir_data *data = irq_data->chip_data;
> > > +	struct IO_APIC_route_entry e;
> > > +
> > > +	cfg = irqd_cfg(irq_data);
> > > +	affinity = irq_data_get_effective_affinity_mask(irq_data);
> > > +	cpu = cpumask_first_and(affinity, cpu_online_mask);
> > > +	vcpu = hv_cpu_number_to_vp_number(cpu);
> > > +
> > > +	vector = cfg->vector;
> > > +	ioapic_id = data->ioapic_id;
> > > +
> > > +	if (data->entry.source == HV_DEVICE_TYPE_IOAPIC
> >
> > Does 'data' need to be checked to be non-NULL?  The parallel code in
> > hv_irq_compose_msi_msg() makes such a check.
> 
> The usage of irq_data->chip_data is different in these two functions.
> 
> In this function, we're sure it is correctly allocated by
> hyperv_root_ir_remapping_alloc at some point before.
> 
> In hv_irq_compose_msi_msg, irq_data->chip_data is instead used as a
> temporary place to stash some state that is controlled solely by the
> said function.
> 
> Once we get to the point of introducing a paravirtualized IOMMU for the
> root partition, we can then unify these two paths.

OK, thanks for the explanation.

> 
> >
> > > +	    && data->entry.ioapic_rte.as_uint64) {
> > > +		entry = data->entry;
> > > +
> > > +		status = hv_unmap_ioapic_interrupt(ioapic_id, &entry);
> > > +
> > > +		if (status != HV_STATUS_SUCCESS)
> > > +			pr_debug("%s: unexpected unmap status %d\n", __func__,
> status);
> > > +
> > > +		data->entry.ioapic_rte.as_uint64 = 0;
> > > +		data->entry.source = 0; /* Invalid source */
> >
> > Again comparing, hv_irq_compose_msi_msg() frees the old
> > entry, and then allocates a new one.   This code reuses the old entry.
> > Any reason for the difference?
> >
> 
> See above.
> 
> I can perhaps tweak the logic a bit to reuse the same entry, but the
> overall design won't change. I opted to always reallocate because that
> looked more straight-forward to me.
> 
> Let me know if you feel strongly about reusing.

I don't feel strongly about reusing.  I was just comparing/contrasting
the two functions.

> 
> > > +	}
> > > +
> > > +
> > > +	status = hv_map_ioapic_interrupt(ioapic_id, data->is_level, vcpu,
> > > +					vector, &entry);
> > > +
> > > +	if (status != HV_STATUS_SUCCESS) {
> > > +		pr_err("%s: map hypercall failed, status %d\n", __func__, status);
> > > +		return;
> > > +	}
> > > +
> > > +	data->entry = entry;
> > > +
> > > +	/* Turn it into an IO_APIC_route_entry, and generate MSI MSG. */
> > > +	e.w1 = entry.ioapic_rte.low_uint32;
> > > +	e.w2 = entry.ioapic_rte.high_uint32;
> > > +
> > > +	memset(msg, 0, sizeof(*msg));
> > > +	msg->arch_data.vector = e.vector;
> > > +	msg->arch_data.delivery_mode = e.delivery_mode;
> > > +	msg->arch_addr_lo.dest_mode_logical = e.dest_mode_logical;
> > > +	msg->arch_addr_lo.dmar_format = e.ir_format;
> > > +	msg->arch_addr_lo.dmar_index_0_14 = e.ir_index_0_14;
> > > +}
> >
> > Having this whole function be more parallel to hv_irq_compose_msi_msg()
> > would be nice. :-)
> >
> 
> Unlike hv_map_ioapic_interrupt and hv_map_msi_interrupt, which can
> benefit from unifying now, this and hv_irq_compose_msi_msg will need to
> wait till we have an IOMMU for the reason I stated above.

OK.  Just having the code in the two functions be more parallel where
possible would make it easier to see similarities and differences.  But
it's not a big deal.

> 
> > > +
> > > +static int hyperv_root_ir_set_affinity(struct irq_data *data,
> > > +		const struct cpumask *mask, bool force)
> > > +{
> > > +	struct irq_data *parent = data->parent_data;
> > > +	struct irq_cfg *cfg = irqd_cfg(data);
> > > +	int ret;
> > > +
> > > +	ret = parent->chip->irq_set_affinity(parent, mask, force);
> > > +	if (ret < 0 || ret == IRQ_SET_MASK_OK_DONE)
> > > +		return ret;
> > > +
> > > +	send_cleanup_vector(cfg);
> > > +
> > > +	return 0;
> > > +}
> > > +
> [...]
> > > +
> > > +static void hyperv_root_irq_remapping_free(struct irq_domain *domain,
> > > +				 unsigned int virq, unsigned int nr_irqs)
> > > +{
> > > +	struct irq_data *irq_data;
> > > +	struct hyperv_root_ir_data *data;
> > > +	struct hv_interrupt_entry *e;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < nr_irqs; i++) {
> > > +		irq_data = irq_domain_get_irq_data(domain, virq + i);
> > > +
> > > +		if (irq_data && irq_data->chip_data) {
> > > +			data = irq_data->chip_data;
> >
> > Set irq_data->chip_data to NULL?  That seems to be done in other
> > similar places in your code.
> 
> There is no need to do that. By the time this function returns, irq_data
> will be gone too -- freed by irq_domain_free_irqs_common.

OK

> 
> >
> > > +			e = &data->entry;
> > > +
> > > +			if (e->source == HV_DEVICE_TYPE_IOAPIC
> > > +			      && e->ioapic_rte.as_uint64)
> > > +				hv_unmap_ioapic_interrupt(data->ioapic_id,
> > > +							&data->entry);
> > > +
> > > +			kfree(data);
> > > +		}
> > > +	}
> > > +
> > > +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
> > > +}
> > > +
> > > +static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
> > > +	.select = hyperv_irq_remapping_select,
> > > +	.alloc = hyperv_root_irq_remapping_alloc,
> > > +	.free = hyperv_root_irq_remapping_free,
> > > +};
> > > +
> > >  #endif
> > > --
> > > 2.20.1
> >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
