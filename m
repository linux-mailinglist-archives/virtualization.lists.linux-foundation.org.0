Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDEA33CCC
	for <lists.virtualization@lfdr.de>; Tue,  4 Jun 2019 03:43:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 074A4D81;
	Tue,  4 Jun 2019 01:43:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1CBDDD48
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 01:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5BE7979
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 01:43:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s15so11893604qtk.9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 18:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=UhYcCxgEtL0AtQ/eoB2A8hUZouQaYG46tp9fVW9VG8Y=;
	b=CV0hV2QNb4UvCTAgtUJ+9ydvqK3FXbc6fnDZGdpHPR/aAjYvcZk/LL+NXjOfhD48d2
	GhOEJ8w1VjhH38Ork+33sZGNzXdO7f+mu36VfpdoH/LLFT7tVkm31q3SFuOtbb7/YFtP
	xhffEmWlHsHoogi4HZSOCyW8eAUFN0+Bi18Z2+0awf1JrXQDI2AmyWKMK2hroM5SvALN
	kByKkrJ9riLRH/1WcwKatUJg6MovuQHYjTppZ+ycynEMEghOfNI/W0gpHuEw8ZICceWd
	fo8rcRW83Tp+KW+SJ9+CU1I79/Akm2YuvBR0eFrCqsvwYxuWqJmQlB66emLYvbTzyLgL
	Jrtw==
X-Gm-Message-State: APjAAAWylqYrMR19TSuGnvi9oygUzX6sgq3/hoLE+zYr6GvuP/VlJsHg
	+jaRMKRMMb8AF/ya2vgkLRT//w==
X-Google-Smtp-Source: APXvYqzNXQ/3cx4oaT89jcuj4XmgWuJZ6ovl6rypbLqytAvqStAvYyx+TJNjAlTL/uzBpJjaoQNTmA==
X-Received: by 2002:ac8:2c7d:: with SMTP id e58mr25943949qta.243.1559612582509;
	Mon, 03 Jun 2019 18:43:02 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	q187sm236373qkd.19.2019.06.03.18.42.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 18:43:01 -0700 (PDT)
Date: Mon, 3 Jun 2019 21:42:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190603211528-mutt-send-email-mst@kernel.org>
References: <20190129134750-mutt-send-email-mst@kernel.org>
	<877eefxvyb.fsf@morokweng.localdomain>
	<20190204144048-mutt-send-email-mst@kernel.org>
	<87ef71seve.fsf@morokweng.localdomain>
	<20190320171027-mutt-send-email-mst@kernel.org>
	<87tvfvbwpb.fsf@morokweng.localdomain>
	<20190323165456-mutt-send-email-mst@kernel.org>
	<87a7go71hz.fsf@morokweng.localdomain>
	<20190520090939-mutt-send-email-mst@kernel.org>
	<877ea26tk8.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877ea26tk8.fsf@morokweng.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
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

On Mon, Jun 03, 2019 at 10:13:59PM -0300, Thiago Jung Bauermann wrote:
> 
> 
> Michael S. Tsirkin <mst@redhat.com> writes:
> 
> > On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
> >> I rephrased it in terms of address translation. What do you think of
> >> this version? The flag name is slightly different too:
> >>
> >>
> >> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
> >>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
> >>     with the exception that address translation is guaranteed to be
> >>     unnecessary when accessing memory addresses supplied to the device
> >>     by the driver. Which is to say, the device will always use physical
> >>     addresses matching addresses used by the driver (typically meaning
> >>     physical addresses used by the CPU) and not translated further. This
> >>     flag should be set by the guest if offered, but to allow for
> >>     backward-compatibility device implementations allow for it to be
> >>     left unset by the guest. It is an error to set both this flag and
> >>     VIRTIO_F_ACCESS_PLATFORM.
> >
> >
> > OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
> > drivers. This is why devices fail when it's not negotiated.
> 
> Just to clarify, what do you mean by unprivileged drivers? Is it drivers
> implemented in guest userspace such as with VFIO? Or unprivileged in
> some other sense such as needing to use bounce buffers for some reason?

I had drivers in guest userspace in mind.

> > This confuses me.
> > If driver is unpriveledged then what happens with this flag?
> > It can supply any address it wants. Will that corrupt kernel
> > memory?
> 
> Not needing address translation doesn't necessarily mean that there's no
> IOMMU. On powerpc we don't use VIRTIO_F_ACCESS_PLATFORM but there's
> always an IOMMU present. And we also support VFIO drivers. The VFIO API
> for pseries (sPAPR section in Documentation/vfio.txt) has extra ioctls
> to program the IOMMU.
> 
> For our use case, we don't need address translation because we set up an
> identity mapping in the IOMMU so that the device can use guest physical
> addresses.

And can it access any guest physical address?

> If the guest kernel is concerned that an unprivileged driver could
> jeopardize its integrity it should not negotiate this feature flag.

Unfortunately flag negotiation is done through config space
and so can be overwritten by the driver.

> Perhaps there should be a note about this in the flag definition? This
> concern is platform-dependant though. I don't believe it's an issue in
> pseries.

Again ACCESS_PLATFORM has a pretty open definition. It does actually
say it's all up to the platform.

Specifically how will VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION be
implemented portably? virtio has no portable way to know
whether DMA API bypasses translation.



> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
