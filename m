Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC67236B8
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 15:09:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B78A7CDF;
	Mon, 20 May 2019 13:09:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E15D9CDE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 13:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2336CA3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 13:09:02 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i26so16120457qtr.10
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 06:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=dFuLtne3guYuFwbHKpK48q543MOC/my0Y0MNbyUjuPE=;
	b=T3H8J7UtjQwaJ3QymK0vNrYcflHSzxvq05bmH3A6UAh8pSjE8+io1ZxTcwKNt7vpRz
	nvyosZSfWrwgisbgfQekOtBcyE60zKobbcH9inIj0JK9B5t+R1nquORR6ZA1YiHiGzQz
	Q7Z0M0kDahaJgjo2WIALJhVCtOzvZHFA9rRuzFCOOJ6aC4JIB1dG/9URnrbOSUwTz5YL
	84ODdjBTPyolJWzca7Z54H1OxJdhr9HfSfocyRIv8AuKZb9dCUDtYyGwG7JwWejtQp+d
	BiVdx6b+ajf8pIfW/0+V3bSMjBLPS9+m8PSGp4JVIdKlIAZzZzdsROnyCkugwdVykR9w
	XtUw==
X-Gm-Message-State: APjAAAV1uUOUfMpotdVW/VEkj0nWjfXnXnuLfczcLIDgjlAHwNwWZPkw
	GhRc7dywTo22KdgDWumFCCaWjA==
X-Google-Smtp-Source: APXvYqxFmd0nNrX047VR0mRGjhNHl6yQJCi/WzEdlp1N5DlMzFNrD0wqdFlb4sI+QUnVeRVV7+bGMQ==
X-Received: by 2002:a0c:af51:: with SMTP id j17mr38357606qvc.34.1558357741216; 
	Mon, 20 May 2019 06:09:01 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	n190sm7929770qkb.83.2019.05.20.06.08.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 06:08:59 -0700 (PDT)
Date: Mon, 20 May 2019 09:08:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190520090602-mutt-send-email-mst@kernel.org>
References: <20190204144048-mutt-send-email-mst@kernel.org>
	<87ef71seve.fsf@morokweng.localdomain>
	<20190320171027-mutt-send-email-mst@kernel.org>
	<87tvfvbwpb.fsf@morokweng.localdomain>
	<20190323165456-mutt-send-email-mst@kernel.org>
	<87a7go71hz.fsf@morokweng.localdomain>
	<20190419190258-mutt-send-email-mst@kernel.org>
	<875zr228zf.fsf@morokweng.localdomain>
	<20190424210813-mutt-send-email-mst@kernel.org>
	<871s1o1ft0.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871s1o1ft0.fsf@morokweng.localdomain>
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

On Fri, Apr 26, 2019 at 08:56:43PM -0300, Thiago Jung Bauermann wrote:
> 
> Michael S. Tsirkin <mst@redhat.com> writes:
> 
> > On Wed, Apr 24, 2019 at 10:01:56PM -0300, Thiago Jung Bauermann wrote:
> >>
> >> Michael S. Tsirkin <mst@redhat.com> writes:
> >>
> >> > On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
> >> >>
> >> >> Michael S. Tsirkin <mst@redhat.com> writes:
> >> >>
> >> >> > On Thu, Mar 21, 2019 at 09:05:04PM -0300, Thiago Jung Bauermann wrote:
> >> >> >>
> >> >> >> Michael S. Tsirkin <mst@redhat.com> writes:
> >> >> >>
> >> >> >> > On Wed, Mar 20, 2019 at 01:13:41PM -0300, Thiago Jung Bauermann wrote:
> >> >> >> >> >From what I understand of the ACCESS_PLATFORM definition, the host will
> >> >> >> >> only ever try to access memory addresses that are supplied to it by the
> >> >> >> >> guest, so all of the secure guest memory that the host cares about is
> >> >> >> >> accessible:
> >> >> >> >>
> >> >> >> >>     If this feature bit is set to 0, then the device has same access to
> >> >> >> >>     memory addresses supplied to it as the driver has. In particular,
> >> >> >> >>     the device will always use physical addresses matching addresses
> >> >> >> >>     used by the driver (typically meaning physical addresses used by the
> >> >> >> >>     CPU) and not translated further, and can access any address supplied
> >> >> >> >>     to it by the driver. When clear, this overrides any
> >> >> >> >>     platform-specific description of whether device access is limited or
> >> >> >> >>     translated in any way, e.g. whether an IOMMU may be present.
> >> >> >> >>
> >> >> >> >> All of the above is true for POWER guests, whether they are secure
> >> >> >> >> guests or not.
> >> >> >> >>
> >> >> >> >> Or are you saying that a virtio device may want to access memory
> >> >> >> >> addresses that weren't supplied to it by the driver?
> >> >> >> >
> >> >> >> > Your logic would apply to IOMMUs as well.  For your mode, there are
> >> >> >> > specific encrypted memory regions that driver has access to but device
> >> >> >> > does not. that seems to violate the constraint.
> >> >> >>
> >> >> >> Right, if there's a pre-configured 1:1 mapping in the IOMMU such that
> >> >> >> the device can ignore the IOMMU for all practical purposes I would
> >> >> >> indeed say that the logic would apply to IOMMUs as well. :-)
> >> >> >>
> >> >> >> I guess I'm still struggling with the purpose of signalling to the
> >> >> >> driver that the host may not have access to memory addresses that it
> >> >> >> will never try to access.
> >> >> >
> >> >> > For example, one of the benefits is to signal to host that driver does
> >> >> > not expect ability to access all memory. If it does, host can
> >> >> > fail initialization gracefully.
> >> >>
> >> >> But why would the ability to access all memory be necessary or even
> >> >> useful? When would the host access memory that the driver didn't tell it
> >> >> to access?
> >> >
> >> > When I say all memory I mean even memory not allowed by the IOMMU.
> >>
> >> Yes, but why? How is that memory relevant?
> >
> > It's relevant when driver is not trusted to only supply correct
> > addresses. The feature was originally designed to support userspace
> > drivers within guests.
> 
> Ah, thanks for clarifying. I don't think that's a problem in our case.
> If the guest provides an incorrect address, the hardware simply won't
> allow the host to access it.
> 
> >> >> >> > Another idea is maybe something like virtio-iommu?
> >> >> >>
> >> >> >> You mean, have legacy guests use virtio-iommu to request an IOMMU
> >> >> >> bypass? If so, it's an interesting idea for new guests but it doesn't
> >> >> >> help with guests that are out today in the field, which don't have A
> >> >> >> virtio-iommu driver.
> >> >> >
> >> >> > I presume legacy guests don't use encrypted memory so why do we
> >> >> > worry about them at all?
> >> >>
> >> >> They don't use encrypted memory, but a host machine will run a mix of
> >> >> secure and legacy guests. And since the hypervisor doesn't know whether
> >> >> a guest will be secure or not at the time it is launched, legacy guests
> >> >> will have to be launched with the same configuration as secure guests.
> >> >
> >> > OK and so I think the issue is that hosts generally fail if they set
> >> > ACCESS_PLATFORM and guests do not negotiate it.
> >> > So you can not just set ACCESS_PLATFORM for everyone.
> >> > Is that the issue here?
> >>
> >> Yes, that is one half of the issue. The other is that even if hosts
> >> didn't fail, existing legacy guests wouldn't "take the initiative" of
> >> not negotiating ACCESS_PLATFORM to get the improved performance. They'd
> >> have to be modified to do that.
> >
> > So there's a non-encrypted guest, hypervisor wants to set
> > ACCESS_PLATFORM to allow encrypted guests but that will slow down legacy
> > guests since their vIOMMU emulation is very slow.
> 
> Yes.
> 
> > So enabling support for encryption slows down non-encrypted guests. Not
> > great but not the end of the world, considering even older guests that
> > don't support ACCESS_PLATFORM are completely broken and you do not seem
> > to be too worried by that.
> 
> Well, I guess that would be the third half of the issue. :-)
> 
> > For future non-encrypted guests, bypassing the emulated IOMMU for when
> > that emulated IOMMU is very slow might be solvable in some other way,
> > e.g. with virtio-iommu. Which reminds me, could you look at
> > virtio-iommu as a solution for some of the issues?
> > Review of that patchset from that POV would be appreciated.
> 
> Yes, I will have a look. As you mentioned already, virtio-iommu doesn't
> define a way to request iommu bypass for a device so that would have to
> be added.

I think it does have a way for guest to request bypass:
there's a feature bit which - if set - specifies that a device
that is in no domain bypasses the iommu.

> Though to be honest in practice I don't think such a feature in
> virtio-iommu would make things easier for us, at least in the short
> term. It would take the same effort to define a powerpc-specific
> hypercall to accomplish the same thing (easier, in fact since we
> wouldn't have to implement the rest of virtio-iommu). In fact, there
> already is such hypercall, but it is only defined for VIO devices
> (RTAS_IBM_SET_TCE_BYPASS in QEMU). We would have to make it work on
> virtio devices as well.

Now I'm a bit lost. Could you pls describe quickly what does it do?

> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
