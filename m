Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4D168637
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 19:16:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AA0C85CB8;
	Fri, 21 Feb 2020 18:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1-eRqYQhSHS; Fri, 21 Feb 2020 18:16:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F46A864C3;
	Fri, 21 Feb 2020 18:16:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CD6CC013E;
	Fri, 21 Feb 2020 18:16:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83183C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 18:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6EB62221DC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 18:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01thgC9DbYwK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 18:16:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by silver.osuosl.org (Postfix) with ESMTPS id E783C22001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 18:16:36 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LIFxg2131445 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:16:36 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yadge7txu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:16:35 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Fri, 21 Feb 2020 18:16:34 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 18:16:29 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LIGRl854984706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 18:16:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FE7C52051;
 Fri, 21 Feb 2020 18:16:27 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.149])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E10EA5204E;
 Fri, 21 Feb 2020 18:16:26 +0000 (GMT)
Date: Fri, 21 Feb 2020 19:16:25 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
In-Reply-To: <20200221163938.GC10054@lst.de>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
 <20200220161309.GB12709@lst.de>
 <20200221153340.4cdcde81.pasic@linux.ibm.com>
 <20200221163938.GC10054@lst.de>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20022118-0008-0000-0000-00000355389C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022118-0009-0000-0000-00004A764C38
Message-Id: <20200221191625.1d589ea7.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_06:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210139
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Fri, 21 Feb 2020 17:39:38 +0100
Christoph Hellwig <hch@lst.de> wrote:

> On Fri, Feb 21, 2020 at 03:33:40PM +0100, Halil Pasic wrote:
> > > Hell no.  This is a detail of the platform DMA direct implementation.
> > 
> > I beg to differ. If it was a detail of the DMA direct implementation, it
> > should have/would have been private to kernel/dma/direct.c. 
> 
> It can't given that platforms have to implement it.  It is an arch hook
> for dma-direct.
> 
> > Consider what would we have to do to make PCI devices do I/O trough
> > pages that were shared when the guest is running in a protected VM. The
> > s390_pci_dma_ops would also need to know whether to 'force dma uencrypted'
> > or not, and it's the exact same logic. I doubt simply using DMA direct
> > for zPCI would do, because we still have to do all the Z specific IOMMU
> > management.
> 
> And your IOMMU can't deal with the encryption bit?

There is no encrypt bit, and our memory is not encrypted, but protected.
Means e.g. when buggy/malicious hypervisor tries to read a protected
page it wont get ciphertext, but a slap on its finger. In order do make
memory accessible to the hypervisor (or another guest, or a real device)
the guest must make a so called utlravisor call (talk to the firmware)
and share the respective page.

We tapped into the memory encryption infrastructure, because both is
protecting the guest memory form the host (just by different means), and
because it made no sense to build up something in parallel when most of
the stuff we need was already there. But most unfortunately the names
are deceiving when it comes to s390 protected virtualization and it's
guest I/O enablement.


>  In the case we
> could think of allowing IOMMU implementation to access it.  But the
> point that it is an internal detail of the DMA implementation and by
> now means for drivers.

From the perspective, that any driver that does anything remotely DMAish,
that is, some external entity (possibly a hypervisor, possibly a channel
subsystem, possibly a DMA controller) to should the memory, should do
DMA API first, to make sure, the DMAish goes well, your argument makes
perfect sense. But form that perspective !F_ACCESS_PLATFORM is also a
DMAish. And the virtio spec mandates that !F_ACCESS_PLATFORM implies
GPA's.

For virtio-ccw I want GPA's and not IOVA's on s390, for virtio-pci,
which we also support in general but not with protected virtualization,
well, it's a different story.

With protected visualization however I must make sure all I/O goes
through shared pages. We use swiotlb for that. But then the old
infrastructure won't cut it. Jet we still need GPA's on the ring (with
the extra requirement that the page must be shared). 

DMA API is a nice fit there because we can allocate DMA coherent memory
(such that what comes back from our DMA ops is a GPA), so we have shared
memory that the hypervisor and the guest is allowed to look at
concurrently, and for the buffers that are going to be put on the vring,
we can use the streaming API, which uses bounce buffers. The returned
IOVA (in DMA API speak) is a GPA of the bounce buffer, and the guest is
not allowed to peek until it unmaps, so everything is cozy. But for that
to work, we all (AMD SEV, power, and s390) must go through the DMA API,
because the old infrastructure in virtio core simply won't cut it. And
it has nothing to do with the device. David explained it very well.

My series is about controlling virtio-core's usage of DMA API. I believe,
I did it in a way that doesn't hurt any arch at the moment.

Maybe the conflict can be resolved if the transport gets a say in
whether to use the DMA API or not. In the end the VIRTIO spec does say
that "Whether accesses are actually limited or translated is described
by platform-specific means."

Regards,
Halil






 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
