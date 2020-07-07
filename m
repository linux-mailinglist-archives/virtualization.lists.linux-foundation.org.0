Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910B216B50
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 13:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2977E234AC;
	Tue,  7 Jul 2020 11:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQR8DFU2jXff; Tue,  7 Jul 2020 11:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 04787263A6;
	Tue,  7 Jul 2020 11:19:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E41EAC016F;
	Tue,  7 Jul 2020 11:19:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC81EC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A4390263A6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htpalBs-PDel
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:19:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id 55650234AC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:19:52 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067B2eG5117663; Tue, 7 Jul 2020 07:19:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324ptpja3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:19:46 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 067B2fKA117738;
 Tue, 7 Jul 2020 07:19:46 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324ptpja2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:19:46 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067B0vYs023869;
 Tue, 7 Jul 2020 11:19:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 322hd81puu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 11:19:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067BJfuc57934070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 11:19:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 810A74C046;
 Tue,  7 Jul 2020 11:19:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB0904C04A;
 Tue,  7 Jul 2020 11:19:40 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.49.148])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 11:19:40 +0000 (GMT)
Date: Tue, 7 Jul 2020 13:19:30 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200707131930.546d2643.pasic@linux.ibm.com>
In-Reply-To: <e9976a77-f4a6-841d-6b95-59811751bce9@linux.ibm.com>
References: <1594111477-15401-1-git-send-email-pmorel@linux.ibm.com>
 <1594111477-15401-3-git-send-email-pmorel@linux.ibm.com>
 <20200707114633.68122a00.cohuck@redhat.com>
 <e9976a77-f4a6-841d-6b95-59811751bce9@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_06:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 mlxscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070081
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 Cornelia Huck <cohuck@redhat.com>, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, 7 Jul 2020 12:38:17 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> 
> 
> On 2020-07-07 11:46, Cornelia Huck wrote:
> > On Tue,  7 Jul 2020 10:44:37 +0200
> > Pierre Morel <pmorel@linux.ibm.com> wrote:
> > 
> >> S390, protecting the guest memory against unauthorized host access
> >> needs to enforce VIRTIO I/O device protection through the use of
> >> VIRTIO_F_VERSION_1 and VIRTIO_F_IOMMU_PLATFORM.
> > 
> > Hm... what about:
> > 
> > "If protected virtualization is active on s390, the virtio queues are
> > not accessible to the host, unless VIRTIO_F_IOMMU_PLATFORM has been
> > negotiated. Use the new arch_validate_virtio_features() interface to
> > enforce this."
> 
> Yes, thanks.
> 
> 
> > 
> >>
> >> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> >> ---
> >>   arch/s390/kernel/uv.c | 25 +++++++++++++++++++++++++

Is this the right place to put this stuff? This file seems to be about
implementing the interface for interacting with the ultravisor. I would
rather expect something like arch/s390/kernel/virtio.c 

Should we ever get arch hooks for balloon those could go in
arch/s390/kernel/virtio.c as well.

> >>   1 file changed, 25 insertions(+)
> >>
> >> diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> >> index c296e5c8dbf9..106330f6eda1 100644
> >> --- a/arch/s390/kernel/uv.c
> >> +++ b/arch/s390/kernel/uv.c
> >> @@ -14,6 +14,7 @@
> >>   #include <linux/memblock.h>
> >>   #include <linux/pagemap.h>
> >>   #include <linux/swap.h>
> >> +#include <linux/virtio_config.h>
> >>   #include <asm/facility.h>
> >>   #include <asm/sections.h>
> >>   #include <asm/uv.h>
> >> @@ -413,3 +414,27 @@ static int __init uv_info_init(void)
> >>   }
> >>   device_initcall(uv_info_init);
> >>   #endif
> >> +
> >> +/*
> >> + * arch_validate_virtio_iommu_platform
> > 
> > s/arch_validate_virtio_iommu_platform/arch_validate_virtio_features/
> > 
> >> + * @dev: the VIRTIO device being added
> >> + *
> >> + * Return value: returns -ENODEV if any features of the
> >> + *               device breaks the protected virtualization
> >> + *               0 otherwise.
> > 
> > I don't think you need to specify the contract here: that belongs to
> > the definition in the virtio core. What about simply adding a sentence
> > "Return an error if required features are missing on a guest running
> > with protected virtualization." ?
> 
> OK, right.
> 
> > 
> >> + */
> >> +int arch_validate_virtio_features(struct virtio_device *dev)
> >> +{
> > 
> > Maybe jump out immediately if the guest is not protected?
> > 
> >> +	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> >> +		dev_warn(&dev->dev, "device must provide VIRTIO_F_VERSION_1\n");
> >> +		return is_prot_virt_guest() ? -ENODEV : 0;
> >> +	}
> >> +
> >> +	if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> >> +		dev_warn(&dev->dev,
> >> +			 "device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> >> +		return is_prot_virt_guest() ? -ENODEV : 0;
> >> +	}
> > 
> > if (!is_prot_virt_guest())
> > 	return 0;
> > 
> > if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> > 	dev_warn(&dev->dev,
> >                   "legacy virtio is incompatible with protected guests");
> > 	return -ENODEV;
> > }
> > 
> > if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> > 	dev_warn(&dev->dev,
> > 		 "device does not work with limited memory access in protected guests");
> > 	return -ENODEV;
> > }
> 
> Yes, easier to read.
> 

Not only easier to read but does not produce warnings
if !is_prot_virt_guest(). I strongly prefer the variant proposed by
Connie.

Otherwise LGTM.

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
