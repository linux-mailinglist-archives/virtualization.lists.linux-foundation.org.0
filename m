Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6448B16A7BD
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 14:56:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1791E85D21;
	Mon, 24 Feb 2020 13:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06tKTFyrObiW; Mon, 24 Feb 2020 13:56:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E9A785EF5;
	Mon, 24 Feb 2020 13:56:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B2B9C0177;
	Mon, 24 Feb 2020 13:56:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C369C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ED57E83527
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bidiaQ2KgQoT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:56:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 712BC8357C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:56:19 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ODtE1w090889 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 08:56:18 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yaygntqec-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 08:56:17 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <pasic@linux.ibm.com>;
 Mon, 24 Feb 2020 13:56:15 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Feb 2020 13:56:10 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01ODu9Cv32571682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 13:56:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1746B52057;
 Mon, 24 Feb 2020 13:56:09 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.149])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9201452054;
 Mon, 24 Feb 2020 13:56:08 +0000 (GMT)
Date: Mon, 24 Feb 2020 14:56:07 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
In-Reply-To: <08d6bdfb-9b49-c278-3c0b-2e02376cf0cf@redhat.com>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <426e6972-0565-c931-e171-da0f58fbf856@redhat.com>
 <20200221155602.4de41fa7.pasic@linux.ibm.com>
 <0181712c-e533-fcfd-2638-8a0649d713dd@redhat.com>
 <20200224010607-mutt-send-email-mst@kernel.org>
 <b3c52c67-c740-a50e-2595-fe04d179c881@redhat.com>
 <20200224024641-mutt-send-email-mst@kernel.org>
 <08d6bdfb-9b49-c278-3c0b-2e02376cf0cf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20022413-0008-0000-0000-00000355F424
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022413-0009-0000-0000-00004A770CC7
Message-Id: <20200224145607.2729f47b.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_04:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240115
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Viktor Mihajlovski <mihajlov@linux.ibm.com>,
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

On Mon, 24 Feb 2020 17:26:20 +0800
Jason Wang <jasowang@redhat.com> wrote:

> That's better.
> 
> How about attached?
> 
> Thanks

Thanks Jason! It does avoid the translation overhead in vhost.

Tested-by: Halil Pasic <pasic@linux.ibm.com>

Regarding the code, you fence it in virtio-net.c, but AFAIU this feature
has relevance for other vhost devices as well. E.g. what about vhost
user? Would it be the responsibility of each virtio device to fence this
on its own?

I'm also a bit confused about the semantics of the vhost feature bit
F_ACCESS_PLATFORM. What we have specified on virtio level is:
"""
This feature indicates that the device can be used on a platform where
device access to data in memory is limited and/or translated. E.g. this
is the case if the device can be located behind an IOMMU that translates
bus addresses from the device into physical addresses in memory, if the
device can be limited to only access certain memory addresses or if
special commands such as a cache flush can be needed to synchronise data
in memory with the device. Whether accesses are actually limited or
translated is described by platform-specific means. If this feature bit
is set to 0, then the device has same access to memory addresses
supplied to it as the driver has. In particular, the device will always
use physical addresses matching addresses used by the driver (typically
meaning physical addresses used by the CPU) and not translated further,
and can access any address supplied to it by the driver. When clear,
this overrides any platform-specific description of whether device
access is limited or translated in any way, e.g. whether an IOMMU may be
present.
"""

I read this like the addresses may be IOVAs which require
IMMU translation or GPAs which don't.

On the vhost level however, it seems that F_IOMMU_PLATFORM means that
vhost has to do the translation (via IOTLB API).

Do I understand this correctly? If yes, I believe we should document
this properly.

BTW I'm still not 100% on the purpose and semantics of the
F_ACCESS_PLATFORM feature bit. But that is a different problem.

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
