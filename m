Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA9D4BDC
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 03:34:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EAAA1DE1;
	Sat, 12 Oct 2019 01:34:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8BE4D1DD0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 01:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E465D14D
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 01:25:55 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x9C1MwOO057607 for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 21:25:55 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2vjxqutgk4-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 21:25:54 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<linuxram@us.ibm.com>; Sat, 12 Oct 2019 02:25:52 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sat, 12 Oct 2019 02:25:48 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x9C1Plsf54657110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 12 Oct 2019 01:25:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADFAA52052;
	Sat, 12 Oct 2019 01:25:47 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.130.213])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 56EB752050;
	Sat, 12 Oct 2019 01:25:43 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] virtio: Support encrypted memory on powerpc secure guests
Date: Fri, 11 Oct 2019 18:25:17 -0700
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19101201-0020-0000-0000-00000378559F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101201-0021-0000-0000-000021CE689F
Message-Id: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-10-11_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=974 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1910120005
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
	benh@kernel.crashing.org, aik@linux.ibm.com, linuxram@us.ibm.com,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

 **We would like the patches to be merged through the virtio tree.  Please
 review, and ack merging the DMA mapping change through that tree. Thanks!**

 The memory of powerpc secure guests can't be accessed by the hypervisor /
 virtio device except for a few memory regions designated as 'shared'.
 
 At the moment, Linux uses bounce-buffering to communicate with the
 hypervisor, with a bounce buffer marked as shared. This is how the DMA API
 is implemented on this platform.
 
 In particular, the most convenient way to use virtio on this platform is by
 making virtio use the DMA API: in fact, this is exactly what happens if the
 virtio device exposes the flag VIRTIO_F_ACCESS_PLATFORM.  However, bugs in the
 hypervisor on the powerpc platform do not allow setting this flag, with some
 hypervisors already in the field that don't set this flag. At the moment they
 are forced to use emulated devices when guest is in secure mode; virtio is
 only useful when guest is not secure.
 
 Normally, both device and driver must support VIRTIO_F_ACCESS_PLATFORM:
 if one of them doesn't, the other mustn't assume it for communication
 to work.
 
 However, a guest-side work-around is possible to enable virtio
 for these hypervisors with guest in secure mode: it so happens that on
 powerpc secure platform the DMA address is actually a physical address -
 that of the bounce buffer. For these platforms we can make the virtio
 driver go through the DMA API even though the device itself ignores
 the DMA API.
 
 These patches implement this work around for virtio: we detect that
 - secure guest mode is enabled - so we know that since we don't share
   most memory and Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM,
   regular virtio code won't work.
 - DMA API is giving us addresses that are actually also physical
   addresses.
 - Hypervisor has not enabled VIRTIO_F_ACCESS_PLATFORM.
 
 and if all conditions are true, we force all data through the bounce
 buffer.
 
 To put it another way, from hypervisor's point of view DMA API is
 not required: hypervisor would be happy to get access to all of guest
 memory. That's why it does not set VIRTIO_F_ACCESS_PLATFORM. However,
 guest decides that it does not trust the hypervisor and wants to force
 a bounce buffer for its own reasons.


Thiago Jung Bauermann (2):
  dma-mapping: Add dma_addr_is_phys_addr()
  virtio_ring: Use DMA API if memory is encrypted

 arch/powerpc/include/asm/dma-mapping.h | 21 +++++++++++++++++++++
 arch/powerpc/platforms/pseries/Kconfig |  1 +
 drivers/virtio/virtio.c                | 18 ++++++++++++++++++
 drivers/virtio/virtio_ring.c           |  8 ++++++++
 include/linux/dma-mapping.h            | 20 ++++++++++++++++++++
 include/linux/virtio_config.h          | 14 ++++++++++++++
 kernel/dma/Kconfig                     |  3 +++
 7 files changed, 85 insertions(+)

-- 
1.8.3.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
