Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45D1BF5C1
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:41:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D52A86CA5;
	Thu, 30 Apr 2020 10:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aROsTRRvvLae; Thu, 30 Apr 2020 10:41:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDC5086CDE;
	Thu, 30 Apr 2020 10:41:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E43C016F;
	Thu, 30 Apr 2020 10:41:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD92C0864;
 Thu, 30 Apr 2020 10:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7E7DC88569;
 Thu, 30 Apr 2020 10:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4X0mWQgl5ezQ; Thu, 30 Apr 2020 10:41:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5BBF088534;
 Thu, 30 Apr 2020 10:41:55 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9B2320838;
 Thu, 30 Apr 2020 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588243315;
 bh=ZcTtHU52BJcfeJg1O8unpT4GgD3JTL20IZWKUTF8TKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NoqNnmeKkPJyRneJ9nMRoBDO87ZWFjCkgG1ug60/9sKtzuDrOfUH6GYjuV09Epb5Z
 3mfxuTey9BjKXEuQX5GPlVcv4F4fS1W6Yt7XGl2CiupaHTqoL3BnztP8mNgZzFUZd2
 air1XKZM4E8l6ApPlZbshsahzH2kIyfc5OkPZmTc=
Date: Thu, 30 Apr 2020 11:41:50 +0100
From: Will Deacon <will@kernel.org>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [RFC/PATCH 1/1] virtio: Introduce MMIO ops
Message-ID: <20200430104149.GG19932@willie-the-truck>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
 <1588240976-10213-2-git-send-email-vatsa@codeaurora.org>
 <20200430101431.GD19932@willie-the-truck>
 <20200430103446.GH5097@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430103446.GH5097@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, mst@redhat.com,
 jan.kiszka@siemens.com, konrad.wilk@oracle.com, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, pratikp@codeaurora.org,
 linux-kernel@vger.kernel.org
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

On Thu, Apr 30, 2020 at 04:04:46PM +0530, Srivatsa Vaddagiri wrote:
> * Will Deacon <will@kernel.org> [2020-04-30 11:14:32]:
> 
> > > +#ifdef CONFIG_VIRTIO_MMIO_OPS
> > >  
> > > +static struct virtio_mmio_ops *mmio_ops;
> > > +
> > > +#define virtio_readb(a)		mmio_ops->mmio_readl((a))
> > > +#define virtio_readw(a)		mmio_ops->mmio_readl((a))
> > > +#define virtio_readl(a)		mmio_ops->mmio_readl((a))
> > > +#define virtio_writeb(val, a)	mmio_ops->mmio_writeb((val), (a))
> > > +#define virtio_writew(val, a)	mmio_ops->mmio_writew((val), (a))
> > > +#define virtio_writel(val, a)	mmio_ops->mmio_writel((val), (a))
> > 
> > How exactly are these ops hooked up? I'm envisaging something like:
> > 
> > 	ops = spec_compliant_ops;
> > 	[...]
> > 	if (firmware_says_hypervisor_is_buggy())
> > 		ops = magic_qcom_ops;
> > 
> > am I wrong?
> 
> If CONFIG_VIRTIO_MMIO_OPS is defined, then I expect this to be unconditionally
> set to 'magic_qcom_ops' that uses hypervisor-supported interface for IO (for
> example: message_queue_send() and message_queue_recevie() hypercalls).

Hmm, but then how would such a kernel work as a guest under all the
spec-compliant hypervisors out there?

> > > +int register_virtio_mmio_ops(struct virtio_mmio_ops *ops)
> > > +{
> > > +	pr_info("Registered %s as mmio ops\n", ops->name);
> > > +	mmio_ops = ops;
> > 
> > Not looking good, and really defeats the point of standardising this stuff
> > imo.
> 
> Ok. I guess the other option is to standardize on a new virtio transport (like
> ivshmem2-virtio)?

I haven't looked at that, but I suppose it depends on what your hypervisor
folks are willing to accomodate.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
