Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B367DA7
	for <lists.virtualization@lfdr.de>; Sun, 14 Jul 2019 08:03:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A31ED176F;
	Sun, 14 Jul 2019 06:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EADBBE95;
	Sun, 14 Jul 2019 05:51:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DC6EF63D;
	Sun, 14 Jul 2019 05:51:44 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x6E5lJwb118984; Sun, 14 Jul 2019 01:51:33 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
	[169.62.189.11])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2tqvhyubqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 14 Jul 2019 01:51:33 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	x6E5oH2C013431; Sun, 14 Jul 2019 05:51:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
	(b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 2tq6x6py4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 14 Jul 2019 05:51:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x6E5pUo553608944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 14 Jul 2019 05:51:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 753387805F;
	Sun, 14 Jul 2019 05:51:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AD967805C;
	Sun, 14 Jul 2019 05:51:26 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.191.219])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Sun, 14 Jul 2019 05:51:25 +0000 (GMT)
References: <20190204144048-mutt-send-email-mst@kernel.org>
	<87ef71seve.fsf@morokweng.localdomain>
	<20190320171027-mutt-send-email-mst@kernel.org>
	<87tvfvbwpb.fsf@morokweng.localdomain>
	<20190323165456-mutt-send-email-mst@kernel.org>
	<87a7go71hz.fsf@morokweng.localdomain>
	<20190520090939-mutt-send-email-mst@kernel.org>
	<877ea26tk8.fsf@morokweng.localdomain>
	<20190603211528-mutt-send-email-mst@kernel.org>
	<877e96qxm7.fsf@morokweng.localdomain>
	<20190701092212-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
In-reply-to: <20190701092212-mutt-send-email-mst@kernel.org>
Date: Sun, 14 Jul 2019 02:51:18 -0300
Message-ID: <87d0id9nah.fsf@morokweng.localdomain>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-07-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1907140073
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mike Anderson <andmike@linux.ibm.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>,
	iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, David Gibson <david@gibson.dropbear.id.au>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org



Michael S. Tsirkin <mst@redhat.com> writes:

> On Thu, Jun 27, 2019 at 10:58:40PM -0300, Thiago Jung Bauermann wrote:
>>
>> Michael S. Tsirkin <mst@redhat.com> writes:
>>
>> > On Mon, Jun 03, 2019 at 10:13:59PM -0300, Thiago Jung Bauermann wrote:
>> >>
>> >>
>> >> Michael S. Tsirkin <mst@redhat.com> writes:
>> >>
>> >> > On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
>> >> >> I rephrased it in terms of address translation. What do you think of
>> >> >> this version? The flag name is slightly different too:
>> >> >>
>> >> >>
>> >> >> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
>> >> >>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
>> >> >>     with the exception that address translation is guaranteed to be
>> >> >>     unnecessary when accessing memory addresses supplied to the device
>> >> >>     by the driver. Which is to say, the device will always use physical
>> >> >>     addresses matching addresses used by the driver (typically meaning
>> >> >>     physical addresses used by the CPU) and not translated further. This
>> >> >>     flag should be set by the guest if offered, but to allow for
>> >> >>     backward-compatibility device implementations allow for it to be
>> >> >>     left unset by the guest. It is an error to set both this flag and
>> >> >>     VIRTIO_F_ACCESS_PLATFORM.
>> >> >
>> >> >
>> >> >
>> >> >
>> >> > OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
>> >> > drivers. This is why devices fail when it's not negotiated.
>> >>
>> >> Just to clarify, what do you mean by unprivileged drivers? Is it drivers
>> >> implemented in guest userspace such as with VFIO? Or unprivileged in
>> >> some other sense such as needing to use bounce buffers for some reason?
>> >
>> > I had drivers in guest userspace in mind.
>>
>> Great. Thanks for clarifying.
>>
>> I don't think this flag would work for guest userspace drivers. Should I
>> add a note about that in the flag definition?
>
> I think you need to clarify access protection rules. Is it only
> translation that is bypassed or is any platform-specific
> protection mechanism bypassed too?

It is only translation. In a secure guest, if the device tries to access
a memory address that wasn't provided by the driver then the
architecture will deny that access. If the device accesses addresses
provided to it by the driver, then there's no protection mechanism or
translation to get in the way.

>> >> > This confuses me.
>> >> > If driver is unpriveledged then what happens with this flag?
>> >> > It can supply any address it wants. Will that corrupt kernel
>> >> > memory?
>> >>
>> >> Not needing address translation doesn't necessarily mean that there's no
>> >> IOMMU. On powerpc we don't use VIRTIO_F_ACCESS_PLATFORM but there's
>> >> always an IOMMU present. And we also support VFIO drivers. The VFIO API
>> >> for pseries (sPAPR section in Documentation/vfio.txt) has extra ioctls
>> >> to program the IOMMU.
>> >>
>> >> For our use case, we don't need address translation because we set up an
>> >> identity mapping in the IOMMU so that the device can use guest physical
>> >> addresses.
>
> OK so I think I am beginning to see it in a different light.  Right now the specific
> platform creates an identity mapping. That in turn means DMA API can be
> fast - it does not need to do anything.  What you are looking for is a
> way to tell host it's an identity mapping - just as an optimization.
>
> Is that right?

Almost. Theoretically it is just an optimization. But in practice the
pseries boot firmware (SLOF) doesn't support IOMMU_PLATFORM so it's not
possible to boot a guest from a device with that flag set.

> So this is what I would call this option:
>
> VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS
>
> and the explanation should state that all device
> addresses are translated by the platform to identical
> addresses.
>
> In fact this option then becomes more, not less restrictive
> than VIRTIO_F_ACCESS_PLATFORM - it's a promise
> by guest to only create identity mappings,
> and only before driver_ok is set.
> This option then would always be negotiated together with
> VIRTIO_F_ACCESS_PLATFORM.
>
> Host then must verify that
> 1. full 1:1 mappings are created before driver_ok
>     or can we make sure this happens before features_ok?
>     that would be ideal as we could require that features_ok fails
> 2. mappings are not modified between driver_ok and reset
>     i guess attempts to change them will fail -
>     possibly by causing a guest crash
>     or some other kind of platform-specific error

I think VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS is good, but requiring
it to be accompanied by ACCESS_PLATFORM can be a problem. One reason is
SLOF as I mentioned above, another is that we would be requiring all
guests running on the machine (secure guests or not, since we would use
the same configuration for all guests) to support it. But
ACCESS_PLATFORM is relatively recent so it's a bit early for that. For
instance, Ubuntu 16.04 LTS (which is still supported) doesn't know about
it and wouldn't be able to use the device.

> So far so good, but now a question:
>
> how are we handling guest address width limitations?
> Is VIRTIO_F_ACCESS_PLATFORM_IDENTITY_ADDRESS subject to
> guest address width limitations?
> I am guessing we can make them so ...
> This needs to be documented.

I'm not sure. I will get back to you on this.

>> > And can it access any guest physical address?
>>
>> Sorry, I was mistaken. We do support VFIO in guests but not for virtio
>> devices, only for regular PCI devices. In which case they will use
>> address translation.
>
> Not sure how this answers the question.

Because I had said that we had VFIO virtio drivers, you asked:

> >> > This confuses me.
> >> > If driver is unpriveledged then what happens with this flag?
> >> > It can supply any address it wants. Will that corrupt kernel
> >> > memory?

Since we can't actually have VFIO virtio drivers, there's nothing to
corrupt the kernel memory.

>> >> If the guest kernel is concerned that an unprivileged driver could
>> >> jeopardize its integrity it should not negotiate this feature flag.
>> >
>> > Unfortunately flag negotiation is done through config space
>> > and so can be overwritten by the driver.
>>
>> Ok, so the guest kernel has to forbid VFIO access on devices where this
>> flag is advertised.
>
> That's possible in theory but in practice we did not yet teach VFIO not
> to attach to legacy devices without VIRTIO_F_ACCESS_PLATFORM.  So all
> security relies on host denying driver_ok without
> VIRTIO_F_ACCESS_PLATFORM.  New options that bypass guest security are
> thus tricky as they can create security holes for existing guests.
> I'm open to ideas about how to do this in a safe way,

If the new flag isn't coupled with ACCESS_PLATFORM then the existing
mechanism of the host denying driver_ok when ACCESS_PLATFORM isn't set
will be enough.

>> >> Perhaps there should be a note about this in the flag definition? This
>> >> concern is platform-dependant though. I don't believe it's an issue in
>> >> pseries.
>> >
>> > Again ACCESS_PLATFORM has a pretty open definition. It does actually
>> > say it's all up to the platform.
>> >
>> > Specifically how will VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION be
>> > implemented portably? virtio has no portable way to know
>> > whether DMA API bypasses translation.
>>
>> The fact that VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION is set
>> communicates that knowledge to virtio. There is a shared understanding
>> between the guest and the host about what this flag being set means.
>
> Right but I wonder how are you going to *actually* implement it on Linux?
> Are you adding a new set of DMA APIs that do everything except
> translation?

Actually it's the opposite. There's nothing to do in the guest besides
setting up SWIOTLB and sharing its buffer with the host.

Normally on pseries, devices use the dma_iommu_ops defined in
arch/powerpc/kernel/dma-iommu.c. I have a patch which changes the
device's dma_ops to NULL so that the default DMA path will be used:

https://lore.kernel.org/linuxppc-dev/20190713060023.8479-12-bauerman@linux.ibm.com/

Then another patch forces use of SWIOTLB and defines the
set_memory_{encrypted,decrypted} functions so that SWIOTLB can make its
buffer be shared with the host:

https://lore.kernel.org/linuxppc-dev/20190713060023.8479-13-bauerman@linux.ibm.com/

--
Thiago Jung Bauermann
IBM Linux Technology Center
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
