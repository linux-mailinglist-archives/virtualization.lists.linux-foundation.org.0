Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B42D4BE9
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 03:46:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BDB7E1DFB;
	Sat, 12 Oct 2019 01:46:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E7221DD6
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 01:36:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 258525D3
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 01:36:40 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x9C1WW8u004440 for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 21:36:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2vk2b8cdtd-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 21:36:39 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<linuxram@us.ibm.com>; Sat, 12 Oct 2019 02:36:36 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sat, 12 Oct 2019 02:36:31 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x9C1aUUm52691120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 12 Oct 2019 01:36:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40343A404D;
	Sat, 12 Oct 2019 01:36:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1B33A4040;
	Sat, 12 Oct 2019 01:36:25 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.130.213])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Sat, 12 Oct 2019 01:36:25 +0000 (GMT)
Date: Fri, 11 Oct 2019 18:36:22 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: linux-kernel@vger.kernel.org, mst@redhat.com, bauerman@linux.ibm.com
Subject: Re: [PATCH 0/2] virtio: Support encrypted memory on powerpc secure
	guests
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19101201-4275-0000-0000-0000037158C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101201-4276-0000-0000-000038846517
Message-Id: <20191012013622.GC17661@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-10-11_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1910120006
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
	benh@kernel.crashing.org, aik@linux.ibm.com,
	virtualization@lists.linux-foundation.org, paulus@ozlabs.org,
	iommu@lists.linux-foundation.org, paul.burton@mips.com,
	mpe@ellerman.id.au, robin.murphy@arm.com,
	m.szyprowski@samsung.com, linuxppc-dev@lists.ozlabs.org,
	hch@lst.de, david@gibson.dropbear.id.au
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Hmm.. git-send-email forgot to CC  Michael Tsirkin, and Thiago; the
original author, who is on vacation.

Adding them now.
RP

On Fri, Oct 11, 2019 at 06:25:17PM -0700, Ram Pai wrote:
>  **We would like the patches to be merged through the virtio tree.  Please
>  review, and ack merging the DMA mapping change through that tree. Thanks!**
> 
>  The memory of powerpc secure guests can't be accessed by the hypervisor /
>  virtio device except for a few memory regions designated as 'shared'.
> 
>  At the moment, Linux uses bounce-buffering to communicate with the
>  hypervisor, with a bounce buffer marked as shared. This is how the DMA API
>  is implemented on this platform.
> 
>  In particular, the most convenient way to use virtio on this platform is by
>  making virtio use the DMA API: in fact, this is exactly what happens if the
>  virtio device exposes the flag VIRTIO_F_ACCESS_PLATFORM.  However, bugs in the
>  hypervisor on the powerpc platform do not allow setting this flag, with some
>  hypervisors already in the field that don't set this flag. At the moment they
>  are forced to use emulated devices when guest is in secure mode; virtio is
>  only useful when guest is not secure.
> 
>  Normally, both device and driver must support VIRTIO_F_ACCESS_PLATFORM:
>  if one of them doesn't, the other mustn't assume it for communication
>  to work.
> 
>  However, a guest-side work-around is possible to enable virtio
>  for these hypervisors with guest in secure mode: it so happens that on
>  powerpc secure platform the DMA address is actually a physical address -
>  that of the bounce buffer. For these platforms we can make the virtio
>  driver go through the DMA API even though the device itself ignores
>  the DMA API.
> 
>  These patches implement this work around for virtio: we detect that
>  - secure guest mode is enabled - so we know that since we don't share
>    most memory and Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM,
>    regular virtio code won't work.
>  - DMA API is giving us addresses that are actually also physical
>    addresses.
>  - Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM.
> 
>  and if all conditions are true, we force all data through the bounce
>  buffer.
> 
>  To put it another way, from hypervisor's point of view DMA API is
>  not required: hypervisor would be happy to get access to all of guest
>  memory. That's why it does not set VIRTIO_F_ACCESS_PLATFORM. However,
>  guest decides that it does not trust the hypervisor and wants to force
>  a bounce buffer for its own reasons.
> 
> 
> Thiago Jung Bauermann (2):
>   dma-mapping: Add dma_addr_is_phys_addr()
>   virtio_ring: Use DMA API if memory is encrypted
> 
>  arch/powerpc/include/asm/dma-mapping.h | 21 +++++++++++++++++++++
>  arch/powerpc/platforms/pseries/Kconfig |  1 +
>  drivers/virtio/virtio.c                | 18 ++++++++++++++++++
>  drivers/virtio/virtio_ring.c           |  8 ++++++++
>  include/linux/dma-mapping.h            | 20 ++++++++++++++++++++
>  include/linux/virtio_config.h          | 14 ++++++++++++++
>  kernel/dma/Kconfig                     |  3 +++
>  7 files changed, 85 insertions(+)
> 
> -- 
> 1.8.3.1

-- 
Ram Pai

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
