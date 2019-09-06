Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC61AB1DC
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 07:08:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B81CF1AD5;
	Fri,  6 Sep 2019 05:08:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F0408173E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:08:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 52C5A756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:08:02 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AEF32A09C5
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:08:01 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id k68so5094578qkb.19
	for <virtualization@lists.linux-foundation.org>;
	Thu, 05 Sep 2019 22:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=l2IJkNQk1WGVpYF2C2pNnjExkv8L64jyK1l0fhuGrQQ=;
	b=aaxe52AOIrs+zSJhaEV2GoBy5fadKHdG59ta+wQWCItmqaaiuRjozecyQCyalCn4Qi
	ipD9QUu537P8zwnPLIWg+RsxqXnjNssJK40aZPFNxORfXtcQI13RLTaDBHqIvJAEpEPb
	1lyVSTjAGkUTj2vD6brxsq4VNgJqFCbbMWgdAT9h4GcfonbSSux4KQ2gslpa1zWuvCLX
	002VdUQniA2wJsrng0djX0DUOU0TUZEyg63ulDZpYOjGBCfvMFAYatjfSDV7m/1MlEDx
	0ut6di3I5R+HsxRha+ch/pn54tAmj0pggrwjZRVuUuz8mtz9FTi7kejNaM0PbvuWNJkK
	/VPw==
X-Gm-Message-State: APjAAAVFRRp6PLscYZVQZ4mHuwJKcAy3j5MPbU7afmoMYxDnR1PmPLAz
	BdahTzz+6K4ShLMV56r00SViqB/PSNnnzwbDBjTvKtf3dQ6ARZbWmu3dJp/WqnON0R+ozeol1Z6
	OXLrg5KKE3f4zwlihW2WWX8WutoRM1GMoeUT8+ARm1w==
X-Received: by 2002:ac8:149a:: with SMTP id l26mr7381731qtj.267.1567746481006; 
	Thu, 05 Sep 2019 22:08:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSVqXB2yJBiZ8qLNaAGXzVS5fYjQAlfJVZ4rV3ixHqyHyZ9tuPVELNAMJ1/UauLsyEphl8xA==
X-Received: by 2002:ac8:149a:: with SMTP id l26mr7381715qtj.267.1567746480788; 
	Thu, 05 Sep 2019 22:08:00 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	b192sm2114746qkg.39.2019.09.05.22.07.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 22:07:59 -0700 (PDT)
Date: Fri, 6 Sep 2019 01:07:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190906001220-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
	<20190811044431-mutt-send-email-mst@kernel.org>
	<20190812121532.GB9405@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812121532.GB9405@lst.de>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	David Gibson <david@gibson.dropbear.id.au>
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

On Mon, Aug 12, 2019 at 02:15:32PM +0200, Christoph Hellwig wrote:
> On Sun, Aug 11, 2019 at 04:55:27AM -0400, Michael S. Tsirkin wrote:
> > On Sun, Aug 11, 2019 at 07:56:07AM +0200, Christoph Hellwig wrote:
> > > So we need a flag on the virtio device, exposed by the
> > > hypervisor (or hardware for hw virtio devices) that says:  hey, I'm real,
> > > don't take a shortcut.
> > 
> > The point here is that it's actually still not real. So we would still
> > use a physical address. However Linux decides that it wants extra
> > security by moving all data through the bounce buffer.  The distinction
> > made is that one can actually give device a physical address of the
> > bounce buffer.
> 
> Sure.  The problem is just that you keep piling hacks on top of hacks.
> We need the per-device flag anyway to properly support hardware virtio
> device in all circumstances.  Instead of coming up with another ad-hoc
> hack to force DMA uses implement that one proper bit and reuse it here.

The flag that you mention literally means "I am a real device" so for
example, you can use VFIO with it. And this device isn't a real one,
and you can't use VFIO with it, even though it's part of a power
system which always has an IOMMU.



Or here's another way to put it: we have a broken device that can only
access physical addresses, not DMA addresses. But to enable SEV Linux
requires DMA API.  So we can still make it work if DMA address happens
to be a physical address (not necessarily of the same page).


This is where dma_addr_is_a_phys_addr() is coming from: it tells us this
weird configuration can still work.  What are we going to do for SEV if
dma_addr_is_a_phys_addr does not apply? Fail probe I guess.


So the proposal is really to make things safe and to this end,
to add this in probe:

	if (sev_active() &&
	    !dma_addr_is_a_phys_addr(dev) &&
	    !virtio_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM))
		return -EINVAL;


the point being to prevent loading driver where it would
corrupt guest memory. Put this way, any objections to adding
dma_addr_is_a_phys_addr to the DMA API?





-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
