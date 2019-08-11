Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA0890BA
	for <lists.virtualization@lfdr.de>; Sun, 11 Aug 2019 10:44:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3AE7BAE7;
	Sun, 11 Aug 2019 08:44:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8119CACD
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:44:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 446046E0
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:44:24 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r4so74778960qkm.13
	for <virtualization@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 01:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=hcr1GZOkXo/SpBuFQN2sn5O4znC3vPI6qwtk9Hnv4bM=;
	b=psWwgkj2m1/qkVD4eqiscliaYjVzljgu9R68TWeOD6VzJGzLzR/gkPrmU/l+SPuS/b
	r09N/adtLGAyp1dbKgwYkrSf6/XdbWF4A74zVFxmETcWOnSRCzV/CfELDdVxMPIAkWkL
	wg9hdD67zOh05ZZORS9QlYSaKO5bq9lsaAAzIPZ5okpWwD4S7X5CaJ3tN27+ENFp89ez
	LmvP1cX0V7iSKP1tWqd3ULO2kuDimhkKdVsQQIw179O+DtQZ/z4QAt4o+B2YA8koF5QA
	vPBsRM3PvL8nSU3ssk5sj3V4+7QYUOw7EApdEFEl8L+Vo9aCyWxuA1qq/RiiTq7+5mQX
	/1/A==
X-Gm-Message-State: APjAAAVCVFatqpyVr5DpiqpdK6G5b+Dr54QlbzDrI+Ahdo4wnEsVA3Oj
	wkyoPGvUrslnq7b0/Zteg/BfbQ==
X-Google-Smtp-Source: APXvYqwtJ8qJQX9u6p3npJxqnjO9//GeJFQdkKZGJ1PnQ4tx5aYXx+lvnUCwpoSIPVkCh1o6EEBaKw==
X-Received: by 2002:a37:b303:: with SMTP id c3mr25443520qkf.253.1565513063479; 
	Sun, 11 Aug 2019 01:44:23 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	23sm42858742qkk.121.2019.08.11.01.44.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 01:44:22 -0700 (PDT)
Date: Sun, 11 Aug 2019 04:44:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190811044256-mutt-send-email-mst@kernel.org>
References: <87zhrj8kcp.fsf@morokweng.localdomain>
	<20190810143038-mutt-send-email-mst@kernel.org>
	<20190810220702.GA5964@ram.ibm.com> <20190811055607.GA12488@lst.de>
	<20190811064621.GB5964@ram.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811064621.GB5964@ram.ibm.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexey Kardashevskiy <aik@linux.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Paul Mackerras <paulus@ozlabs.org>, iommu@lists.linux-foundation.org,
	linuxppc-devel@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
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

On Sat, Aug 10, 2019 at 11:46:21PM -0700, Ram Pai wrote:
> On Sun, Aug 11, 2019 at 07:56:07AM +0200, Christoph Hellwig wrote:
> > sev_active() is gone now in linux-next, at least as a global API.
> > 
> > And once again this is entirely going in the wrong direction.  The only
> > way using the DMA API is going to work at all is if the device is ready
> > for it.  So we need a flag on the virtio device, exposed by the
> > hypervisor (or hardware for hw virtio devices) that says:  hey, I'm real,
> > don't take a shortcut.
> > 
> > And that means on power and s390 qemu will always have to set thos if
> > you want to be ready for the ultravisor and co games.  It's not like we
> > haven't been through this a few times before, have we?
> 
> 
> We have been through this so many times, but I dont think, we ever
> understood each other.   I have a fundamental question, the answer to
> which was never clear. Here it is...
> 
> If the hypervisor (hardware for hw virtio devices) does not mandate a
> DMA API, why is it illegal for the driver to request, special handling
> of its i/o buffers? Why are we associating this special handling to
> always mean, some DMA address translation? Can't there be 
> any other kind of special handling needs, that has nothing to do with
> DMA address translation?

I think the answer to that is, extend the DMA API to cover that special
need then. And that's exactly what dma_addr_is_phys_addr is trying to
do.

> 
> -- 
> Ram Pai
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
