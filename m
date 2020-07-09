Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 926F3219CAA
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 11:57:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D13226AD9;
	Thu,  9 Jul 2020 09:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfEnKE9LGn8D; Thu,  9 Jul 2020 09:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F30E426698;
	Thu,  9 Jul 2020 09:57:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC57CC016F;
	Thu,  9 Jul 2020 09:57:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19C9FC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 09:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A39A887F78
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 09:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UEoJ+nGfS3Sm
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 09:56:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F1D7887E91
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 09:56:11 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0699ZmNI117754; Thu, 9 Jul 2020 05:56:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325r2cce2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 05:56:02 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0699qg3u169301;
 Thu, 9 Jul 2020 05:56:02 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325r2cce1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 05:56:01 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0699l0Id018985;
 Thu, 9 Jul 2020 09:55:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 325k0crrsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 09:55:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0699tuGL61931650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 09:55:56 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB156A4054;
 Thu,  9 Jul 2020 09:55:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0D42A405C;
 Thu,  9 Jul 2020 09:55:55 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.152.61])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 09:55:55 +0000 (GMT)
Date: Thu, 9 Jul 2020 11:55:53 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v5 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200709115553.2dde6ab1.pasic@linux.ibm.com>
In-Reply-To: <20200709105733.6d68fa53.cohuck@redhat.com>
References: <1594283959-13742-1-git-send-email-pmorel@linux.ibm.com>
 <1594283959-13742-3-git-send-email-pmorel@linux.ibm.com>
 <20200709105733.6d68fa53.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_05:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090075
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

On Thu, 9 Jul 2020 10:57:33 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu,  9 Jul 2020 10:39:19 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > If protected virtualization is active on s390, the virtio queues are
> > not accessible to the host, unless VIRTIO_F_IOMMU_PLATFORM has been
> > negotiated. Use the new arch_validate_virtio_features() interface to
> > fail probe if that's not the case, preventing a host error on access
> > attempt

Punctuation at the end?

Also 'that's not the case' refers to the negation
'VIRTIO_F_IOMMU_PLATFORM has been negotiated',
arch_validate_virtio_features() is however part of
virtio_finalize_features(), which is in turn part of the feature
negotiation. But that is details. I'm fine with keeping the message as
is. 

> > 
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > ---
> >  arch/s390/mm/init.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> > index 6dc7c3b60ef6..b8e6f90117da 100644
> > --- a/arch/s390/mm/init.c
> > +++ b/arch/s390/mm/init.c
> > @@ -45,6 +45,7 @@
> >  #include <asm/kasan.h>
> >  #include <asm/dma-mapping.h>
> >  #include <asm/uv.h>
> > +#include <linux/virtio_config.h>
> >  
> >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
> >  
> > @@ -161,6 +162,32 @@ bool force_dma_unencrypted(struct device *dev)
> >  	return is_prot_virt_guest();
> >  }
> >  
> > +/*
> > + * arch_validate_virtio_features
> > + * @dev: the VIRTIO device being added
> > + *
> > + * Return an error if required features are missing on a guest running
> > + * with protected virtualization.
> > + */
> > +int arch_validate_virtio_features(struct virtio_device *dev)
> > +{
> > +	if (!is_prot_virt_guest())
> > +		return 0;
> > +
> > +	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> > +		dev_warn(&dev->dev, "device must provide VIRTIO_F_VERSION_1\n");
> 
> I'd probably use "legacy virtio not supported with protected
> virtualization".
> 
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> > +		dev_warn(&dev->dev,
> > +			 "device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> 
> "support for limited memory access required for protected
> virtualization"
> 
> ?
> 
> Mentioning the feature flag is shorter in both cases, though.

I liked the messages in v4. Why did we change those? Did somebody
complain?

I prefer the old ones, but it any case:

Acked-by: Halil Pasic <pasic@linux.ibm.com>


> 
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /* protected virtualization */
> >  static void pv_init(void)
> >  {
> 
> Either way,
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
