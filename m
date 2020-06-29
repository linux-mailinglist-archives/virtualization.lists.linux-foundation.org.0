Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC520D043
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 18:48:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C227F8698F;
	Mon, 29 Jun 2020 16:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gDSebFpadDK; Mon, 29 Jun 2020 16:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7EFB86A59;
	Mon, 29 Jun 2020 16:48:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3372C016E;
	Mon, 29 Jun 2020 16:48:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89F9FC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7495120494
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t08ykfP23CmI
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:48:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by silver.osuosl.org (Postfix) with ESMTPS id EBD1620420
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:48:47 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TGbilX079593; Mon, 29 Jun 2020 12:48:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydmqnnu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 12:48:41 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05TGeQ0B090545;
 Mon, 29 Jun 2020 12:48:41 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydmqnnt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 12:48:41 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05TGfcbo015555;
 Mon, 29 Jun 2020 16:48:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr8ajr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 16:48:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05TGmZ6b33161402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 16:48:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB584C059;
 Mon, 29 Jun 2020 16:48:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 006AF4C050;
 Mon, 29 Jun 2020 16:48:31 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.79.64])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 16:48:30 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115952-mutt-send-email-mst@kernel.org>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <66f808f2-5dd9-9127-d0e8-6bafbf13fc62@linux.ibm.com>
Date: Mon, 29 Jun 2020 18:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629115952-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_18:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=868 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006290107
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, heiko.carstens@de.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, david@gibson.dropbear.id.au
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 2020-06-29 18:09, Michael S. Tsirkin wrote:
> On Wed, Jun 17, 2020 at 12:43:57PM +0200, Pierre Morel wrote:
>> An architecture protecting the guest memory against unauthorized host
>> access may want to enforce VIRTIO I/O device protection through the
>> use of VIRTIO_F_IOMMU_PLATFORM.
>> Let's give a chance to the architecture to accept or not devices
>> without VIRTIO_F_IOMMU_PLATFORM.
> 
> I agree it's a bit misleading. Protection is enforced by memory
> encryption, you can't trust the hypervisor to report the bit correctly
> so using that as a securoty measure would be pointless.
> The real gain here is that broken configs are easier to
> debug.
> 
> Here's an attempt at a better description:
> 
> 	On some architectures, guest knows that VIRTIO_F_IOMMU_PLATFORM is
> 	required for virtio to function: e.g. this is the case on s390 protected
> 	virt guests, since otherwise guest passes encrypted guest memory to devices,
> 	which the device can't read. Without VIRTIO_F_IOMMU_PLATFORM the
> 	result is that affected memory (or even a whole page containing
> 	it is corrupted). Detect and fail probe instead - that is easier
> 	to debug.

Thanks indeed better aside from the "encrypted guest memory": the 
mechanism used to avoid the access to the guest memory from the host by 
s390 is not encryption but a hardware feature denying the general host 
access and allowing pieces of memory to be shared between guest and host.
As a consequence the data read from memory is not corrupted but not read 
at all and the read error kills the hypervizor with a SIGSEGV.


> 
> however, now that we have described what it is (hypervisor
> misconfiguration) I ask a question: can we be sure this will never
> ever work? E.g. what if some future hypervisor gains ability to
> access the protected guest memory in some abstractly secure manner?

The goal of the s390 PV feature is to avoid this possibility so I don't 
think so; however, there is a possibility that some hardware VIRTIO 
device gain access to the guest's protected memory, even such device 
does not exist yet.

At the moment such device exists we will need a driver for it, at least 
to enable the feature and apply policies, it is also one of the reasons 
why a hook to the architecture is interesting.

> We are blocking this here, and it's hard to predict the future,
> and a broken hypervisor can always find ways to crash the guest ...

yes, this is also something to fix on the hypervizor side, Halil is 
working on it.

> 
> IMHO it would be safer to just print a warning.
> What do you think?

Sadly, putting a warning may not help as qemu is killed if it accesses 
the protected memory.
Also note that the crash occurs not only on start but also on hotplug.

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
