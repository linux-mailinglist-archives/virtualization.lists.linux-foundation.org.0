Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461E400F0E
	for <lists.virtualization@lfdr.de>; Sun,  5 Sep 2021 12:20:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045C1403A6;
	Sun,  5 Sep 2021 10:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SC8IVlUYR1YM; Sun,  5 Sep 2021 10:20:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EEB7A404CD;
	Sun,  5 Sep 2021 10:20:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 748D6C001F;
	Sun,  5 Sep 2021 10:20:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68020C000E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Sep 2021 10:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F43400F7
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Sep 2021 10:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z12ZWM6xdKwX
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Sep 2021 10:20:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA8D4400C9
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Sep 2021 10:20:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F78260F6D;
 Sun,  5 Sep 2021 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630837228;
 bh=SUnFrhVsbSr7xhXMvn+ilFPAkoBHg1wZQuj1B8J6If4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uz14KLZnk+VNxm5+LffpjNsTNJLqQuHIbmmkU7oEGWYQFakUovEGcl3LXC69ySUrY
 GhsEketgZV0J4CO+T2UnSHBu/AJMiwNidAw/oRRc5cEUZu0/5Evlir1G3Z1uLMC2xQ
 zGzH/z+AFo1OhEkoN/MSa64wdl6VesgSAKGSSC5f3NtEqFG1ijnteDnPecgReXpZjh
 8I8fkSCPrpqssRx7VL2dR4uWRHE2h+XUu2lbJtN5rwlfzVWei/w7scDeAhiNs56wQc
 UYiwxgVzVaoSPVkkzKf0LZRGLQTY3lCDaX9HpRlzQeqTEoG2wSKZvjend41tVARWGk
 wPq5mTk59aa2Q==
Date: Sun, 5 Sep 2021 13:20:24 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-blk: add num_request_queues module parameter
Message-ID: <YTSZ6CYM6BCsbVmk@unreal>
References: <20210902204622.54354-1-mgurtovoy@nvidia.com>
 <YTR12AHOGs1nhfz1@unreal>
 <b2e60035-2e63-3162-6222-d8c862526a28@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2e60035-2e63-3162-6222-d8c862526a28@gmail.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, linux-block@vger.kernel.org,
 kvm@vger.kernel.org, mst@redhat.com, israelr@nvidia.com,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 nitzanc@nvidia.com, axboe@kernel.dk, stefanha@redhat.com, oren@nvidia.com
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

On Sun, Sep 05, 2021 at 01:49:46AM -0700, Chaitanya Kulkarni wrote:
> 
> On 9/5/2021 12:46 AM, Leon Romanovsky wrote:
> > > +static unsigned int num_request_queues;
> > > +module_param_cb(num_request_queues, &queue_count_ops, &num_request_queues,
> > > +		0644);
> > > +MODULE_PARM_DESC(num_request_queues,
> > > +		 "Number of request queues to use for blk device. Should > 0");
> > > +
> > Won't it limit all virtio block devices to the same limit?
> > 
> > It is very common to see multiple virtio-blk devices on the same system
> > and they probably need different limits.
> > 
> > Thanks
> 
> 
> Without looking into the code, that can be done adding a configfs
> 
> interface and overriding a global value (module param) when it is set from
> 
> configfs.

So why should we do double work instead of providing one working
interface from the beginning?

Thanks

> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
