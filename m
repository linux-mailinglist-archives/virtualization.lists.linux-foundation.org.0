Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA51166C38
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 02:18:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CE6786222;
	Fri, 21 Feb 2020 01:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdSDrnoUls8F; Fri, 21 Feb 2020 01:18:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A214C8623E;
	Fri, 21 Feb 2020 01:18:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70FC8C013E;
	Fri, 21 Feb 2020 01:18:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1EEFC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 01:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C6A3887E38
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 01:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxfVbX2bBd5O
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 01:18:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0DF9C87DB2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 01:18:03 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L13esw089327 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:18:03 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y93kgj9ge-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:18:02 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <linuxram@us.ibm.com>;
 Fri, 21 Feb 2020 01:18:01 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 01:17:57 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01L1HtsE41419040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 01:17:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C748D4203F;
 Fri, 21 Feb 2020 01:17:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C2A642045;
 Fri, 21 Feb 2020 01:17:51 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.188.83])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Feb 2020 01:17:51 +0000 (GMT)
Date: Thu, 20 Feb 2020 17:17:48 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
 <20200220154904-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220154904-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20022101-0016-0000-0000-000002E8C975
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022101-0017-0000-0000-0000334BE816
Message-Id: <20200221011748.GE5713@oc0525413822.ibm.com>
Subject: RE: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1011 phishscore=0 mlxlogscore=972 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210006
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Feb 20, 2020 at 03:55:14PM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 20, 2020 at 05:06:06PM +0100, Halil Pasic wrote:
> > Currently the advanced guest memory protection technologies (AMD SEV,
> > powerpc secure guest technology and s390 Protected VMs) abuse the
> > VIRTIO_F_IOMMU_PLATFORM flag to make virtio core use the DMA API, which
> > is in turn necessary, to make IO work with guest memory protection.
> > 
> > But VIRTIO_F_IOMMU_PLATFORM a.k.a. VIRTIO_F_ACCESS_PLATFORM is really a
> > different beast: with virtio devices whose implementation runs on an SMP
> > CPU we are still fine with doing all the usual optimizations, it is just
> > that we need to make sure that the memory protection mechanism does not
> > get in the way. The VIRTIO_F_ACCESS_PLATFORM mandates more work on the
> > side of the guest (and possibly he host side as well) than we actually
> > need.
> > 
> > An additional benefit of teaching the guest to make the right decision
> > (and use DMA API) on it's own is: removing the need, to mandate special
> > VM configuration for guests that may run with protection. This is
> > especially interesting for s390 as VIRTIO_F_IOMMU_PLATFORM pushes all
> > the virtio control structures into the first 2G of guest memory:
> > something we don't necessarily want to do per-default.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Tested-by: Ram Pai <linuxram@us.ibm.com>
> > Tested-by: Michael Mueller <mimu@linux.ibm.com>
> 
> This might work for you but it's fragile, since without
> VIRTIO_F_ACCESS_PLATFORM hypervisor assumes it gets
> GPA's, not DMA addresses.
> 
> 
> 
> IOW this looks like another iteration of:
> 
> 	virtio: Support encrypted memory on powerpc secure guests
> 
> which I was under the impression was abandoned as unnecessary.

It has been abondoned on powerpc. We enabled VIRTIO_F_ACCESS_PLATFORM;
by default, flag on powerpc.

We would like to enable secure guests on powerpc without this flag
aswell enabled, but past experience has educated us that its not a easy
path.  However if Halil makes some inroads in this path for s390, we
will like to support him.


RP

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
