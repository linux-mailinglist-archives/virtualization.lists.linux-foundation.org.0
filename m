Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 56114168237
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 16:48:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF8788643D;
	Fri, 21 Feb 2020 15:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTZYNI_46i9J; Fri, 21 Feb 2020 15:48:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 538AB863FF;
	Fri, 21 Feb 2020 15:48:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49221C1D85;
	Fri, 21 Feb 2020 15:48:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF308C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 15:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BCFBC875A1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 15:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ma0vQ35zjjJX
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 15:48:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AB5886497
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582300111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMuXYm/rPXTbSbIyT257TjmGAho8shid8dR0IC6/tX8=;
 b=esh8Jmqnrpodd6+hdBZKVUgAdFKmltKZdL/Xa2vAqibJRWsbRPpqdafx10Waijazw6KDSm
 M12VkUjd/Q0Uq/6t/cy5fwSaTr+mXQSKU4y8YQpJ9QhxZYAb1xvk7prNJ5TnNCEC6jqKuo
 sn019/Rg43oJOmGTbEVz6R9pmexKQa4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-bpmo-s_GPr6mD2BDe3PLfA-1; Fri, 21 Feb 2020 10:48:27 -0500
X-MC-Unique: bpmo-s_GPr6mD2BDe3PLfA-1
Received: by mail-qt1-f197.google.com with SMTP id x8so2036013qtq.14
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nMuXYm/rPXTbSbIyT257TjmGAho8shid8dR0IC6/tX8=;
 b=lZuFnFZ/t5mVokGCV4vh6h/3sEYYx3qjFrOsUxn1imkzXhBmHiJSy9jLK48me7PZC5
 4GnYlYGlUnLCP9sqxgd/mph5in8sjNRb6AMa5nufA/QwYqgx2inikRuMdq9Dk9CQ+Zk7
 ecrsFxL6q5L9G0Muf9lC9aEkT3RqKSEyYgmrEft1lh22NbMtsKOtAw71XOFY3gtEENEx
 +8e7N/aHtqwmpyYgVE9zW2MICPSiLgqd7/fybLB2053/oFG3bUxIqwK3/eitw8Oie6aL
 tA8gvOfSN7d9Mh9mav7RS+AwBKyO9SXXQZMpQmtr1xgbhabte7S0xBHS2dCipDVd/6Wz
 fMyQ==
X-Gm-Message-State: APjAAAVmcRMxEPI/gFnQAH8pu5qorrA26sau1+MD5dsAo72M3L1HUr0E
 J8A2gdE3xJujtAYWq4ACyVQ3F+JzYTApc8uWaTT9Kovrr1qG9YvycGXE0dJPcbYllR147F/DFhk
 NVjEqaPiGtxNnTUIVANLyzR0cXqZd05mRftigQmi4bA==
X-Received: by 2002:a05:620a:1326:: with SMTP id
 p6mr13887737qkj.50.1582300107034; 
 Fri, 21 Feb 2020 07:48:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZ5r0+jwSBeRkygk9EFdnmUIJfdBlfp8mfZ4GFs+3IU6OZoA6wUKcAnfNUKef1wSipRN9KMw==
X-Received: by 2002:a05:620a:1326:: with SMTP id
 p6mr13887707qkj.50.1582300106779; 
 Fri, 21 Feb 2020 07:48:26 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id o55sm1770202qtf.46.2020.02.21.07.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:48:25 -0800 (PST)
Date: Fri, 21 Feb 2020 10:48:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/2] mm: move force_dma_unencrypted() to mem_encrypt.h
Message-ID: <20200221104724-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-2-pasic@linux.ibm.com>
 <20200220161146.GA12709@lst.de>
 <4369f099-e4e4-4a58-b38b-642cf53ccca6@de.ibm.com>
 <20200220163135.GA13192@lst.de>
 <20200221032727.GC2298@umbus.fritz.box>
 <20200221140639.54928efe.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200221140639.54928efe.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Michael Mueller <mimu@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
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

On Fri, Feb 21, 2020 at 02:06:39PM +0100, Halil Pasic wrote:
> On Fri, 21 Feb 2020 14:27:27 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
> > On Thu, Feb 20, 2020 at 05:31:35PM +0100, Christoph Hellwig wrote:
> > > On Thu, Feb 20, 2020 at 05:23:20PM +0100, Christian Borntraeger wrote:
> > > > >From a users perspective it makes absolutely perfect sense to use the
> > > > bounce buffers when they are NEEDED. 
> > > > Forcing the user to specify iommu_platform just because you need bounce buffers
> > > > really feels wrong. And obviously we have a severe performance issue
> > > > because of the indirections.
> > > 
> > > The point is that the user should not have to specify iommu_platform.
> > > We need to make sure any new hypervisor (especially one that might require
> > > bounce buffering) always sets it,
> > 
> > So, I have draft qemu patches which enable iommu_platform by default.
> > But that's really because of other problems with !iommu_platform, not
> > anything to do with bounce buffering or secure VMs.
> > 
> > The thing is that the hypervisor *doesn't* require bounce buffering.
> > In the POWER (and maybe s390 as well) models for Secure VMs, it's the
> > *guest*'s choice to enter secure mode, so the hypervisor has no reason
> > to know whether the guest needs bounce buffering.  As far as the
> > hypervisor and qemu are concerned that's a guest internal detail, it
> > just expects to get addresses it can access whether those are GPAs
> > (iommu_platform=off) or IOVAs (iommu_platform=on).
> 
> I very much agree!
> 
> > 
> > > as was a rather bogus legacy hack
> > 
> > It was certainly a bad idea, but it was a bad idea that went into a
> > public spec and has been widely deployed for many years.  We can't
> > just pretend it didn't happen and move on.
> > 
> > Turning iommu_platform=on by default breaks old guests, some of which
> > we still care about.  We can't (automatically) do it only for guests
> > that need bounce buffering, because the hypervisor doesn't know that
> > ahead of time.
> 
> Turning iommu_platform=on for virtio-ccw makes no sense whatsover,
> because for CCW I/O there is no such thing as IOMMU and the addresses
> are always physical addresses.

Fix the name then. The spec calls is ACCESS_PLATFORM now, which
makes much more sense.

> > 
> > > that isn't extensibe for cases that for example require bounce buffering.
> > 
> > In fact bounce buffering isn't really the issue from the hypervisor
> > (or spec's) point of view.  It's the fact that not all of guest memory
> > is accessible to the hypervisor.  Bounce buffering is just one way the
> > guest might deal with that.
> > 
> 
> Agreed.
> 
> Regards,
> Halil
> 
> 
> 


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
