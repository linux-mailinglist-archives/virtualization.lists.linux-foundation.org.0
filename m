Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A2167F02
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 14:49:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C87587F1F;
	Fri, 21 Feb 2020 13:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bvr-nPw-VZkf; Fri, 21 Feb 2020 13:49:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 830EF87F0C;
	Fri, 21 Feb 2020 13:49:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EC06C013E;
	Fri, 21 Feb 2020 13:49:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DFA3C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 187B087ED2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUXFnEo7eyEd
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:49:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6E3C987BC8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:49:47 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LDege4090683 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:49:46 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y9sbvh4sk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:49:46 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Fri, 21 Feb 2020 13:49:43 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 13:49:39 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LDncmK46792746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 13:49:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 182E942042;
 Fri, 21 Feb 2020 13:49:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 875A14203F;
 Fri, 21 Feb 2020 13:49:37 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 13:49:37 +0000 (GMT)
Date: Fri, 21 Feb 2020 14:49:36 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
In-Reply-To: <20200220163055-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220163055-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20022113-4275-0000-0000-000003A42EE8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022113-4276-0000-0000-000038B83E39
Message-Id: <20200221144936.2102bcce.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_03:2020-02-19,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210106
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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

On Thu, 20 Feb 2020 16:33:35 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 20, 2020 at 05:06:04PM +0100, Halil Pasic wrote:
> > For vhost-net the feature VIRTIO_F_IOMMU_PLATFORM has the following side
> > effect The vhost code assumes it the addresses on the virtio descriptor
> > ring are not guest physical addresses but iova's, and insists on doing a
> > translation of these regardless of what transport is used (e.g. whether
> > we emulate a PCI or a CCW device). (For details see commit 6b1e6cc7855b
> > "vhost: new device IOTLB API".) On s390 this results in severe
> > performance degradation (c.a. factor 10). BTW with ccw I/O there is
> > (architecturally) no IOMMU, so the whole address translation makes no
> > sense in the context of virtio-ccw.
> 
> So it sounds like a host issue: the emulation of s390 unnecessarily complicated.
> Working around it by the guest looks wrong ...

While do think that forcing IOMMU_PLATFORM on devices that do not
want or need it, just to trigger DMA API usage in guest is conceptually
wrong, I do agree, that we might have a host issue. Namely, unlike PCI,
CCW does not have an IOMMU, and the spec clearly states that "Whether
accesses are actually limited or translated is described by
platform-specific means.". With CCW devices we don't have address translation
by IOMMU, and in that sense vhost is probably wrong about trying to do
the translation. That is why I mentioned the patch, and that it's done
regardless of the transport/platform.

Regards,
Halil


> 
> > Halil Pasic (2):
> >   mm: move force_dma_unencrypted() to mem_encrypt.h
> >   virtio: let virtio use DMA API when guest RAM is protected
> > 
> >  drivers/virtio/virtio_ring.c |  3 +++
> >  include/linux/dma-direct.h   |  9 ---------
> >  include/linux/mem_encrypt.h  | 10 ++++++++++
> >  3 files changed, 13 insertions(+), 9 deletions(-)
> > 
> > 
> > base-commit: ca7e1fd1026c5af6a533b4b5447e1d2f153e28f2
> > -- 
> > 2.17.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
