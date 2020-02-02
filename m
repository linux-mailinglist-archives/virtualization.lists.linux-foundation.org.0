Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A014FB0B
	for <lists.virtualization@lfdr.de>; Sun,  2 Feb 2020 01:21:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C61B3863CD;
	Sun,  2 Feb 2020 00:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEGm1ZmVbk6H; Sun,  2 Feb 2020 00:21:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 40D05863AE;
	Sun,  2 Feb 2020 00:21:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BA33C0171;
	Sun,  2 Feb 2020 00:21:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DE35C0171
 for <virtualization@lists.linux-foundation.org>;
 Sun,  2 Feb 2020 00:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2684D2041E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  2 Feb 2020 00:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ge1JAj35RARX
 for <virtualization@lists.linux-foundation.org>;
 Sun,  2 Feb 2020 00:21:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by silver.osuosl.org (Postfix) with ESMTPS id 4D5A320026
 for <virtualization@lists.linux-foundation.org>;
 Sun,  2 Feb 2020 00:21:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id f2so3992145pjq.1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 01 Feb 2020 16:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=pOGxtezeEJTov4MHafgAwZgKmMTrnZy8DjiqsybXSvU=;
 b=Q5dG92AtDWLiBa6eLsSlNxV28+VwD/Uf31ItjhaOI7aumJ81zhwcrk3wC/wnvc3oTB
 8JtLOZTtPLzCyqphcBntIW93I0k/Js7LJqb3QkH1Gp2ojk9atuZjZ12ztqf+Qc38QOuz
 hLPBr2fER9rx7ng7Zf8SS4kESxqiFBnELxRnbV59xEq3fEZdGlDJRtbWBe/lY7YFiZZb
 yxnb/+b2nHZXFgmy4FYtWLslhmsS9wkKnQJ3Y9blEb62jf9mFtHAbymzA5m+fV9xxG4P
 dHEOIuqlHFVL56ADYwxz1hn9tp+sWjLds/7jyzJ6596pt0IqKIxEacIyqXRZ8BxaIP9v
 LlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=pOGxtezeEJTov4MHafgAwZgKmMTrnZy8DjiqsybXSvU=;
 b=V5wjsyl+UTkaHFM/jpYQrw7GZ/juzItoslWMcRNPby/911ub+Pw81frjVb9yuBkedb
 M1kSswe2DVzWBOwkx2sbJ04CD2IusdlHwErD/CVk9aqgcb3Zt2tEaLU3mG8OVXqUBM2M
 YMqnKCpNWi4oamVk+IwMbYsJ4pF9js3Edj6I8rnF4BS4mxCUm7iNy4Cza9q7/AaNpqza
 JskNZG03zBZDt6rcHt+WBu/B6BsFRKEykA4gyER7O7z5Feu9pNl91kOjM/KHen0BNPco
 H5VmMIpEgwdWFRx6mx+Mla1sfOTOOSnYLRUAa82iix+YvrOTe+omNgiqWMPz5G/tkKUH
 MRcA==
X-Gm-Message-State: APjAAAUIB/s4aYjtmPImK59q1cCngamHWjwCpyiPhgx0WORzXWgva+/W
 xaT9j63h49UklU8px2x4K0FASg==
X-Google-Smtp-Source: APXvYqynjbv1piggmv8yDfX47isoPx/AGUCvucK/Or9SqNrp6/eDbC9v5V+0KsGgbRNGTFnJ66IjfQ==
X-Received: by 2002:a17:90a:ba07:: with SMTP id
 s7mr21215825pjr.75.1580602886581; 
 Sat, 01 Feb 2020 16:21:26 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id k9sm14875759pjo.19.2020.02.01.16.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 16:21:25 -0800 (PST)
Date: Sat, 1 Feb 2020 16:21:25 -0800 (PST)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Tyler Sanderson <tysand@google.com>
Subject: Re: Balloon pressuring page cache
In-Reply-To: <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2002011618340.227600@chino.kir.corp.google.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: virtualization@lists.linux-foundation.org
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
From: David Rientjes via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, 29 Jan 2020, Tyler Sanderson wrote:

> > > A primary advantage of virtio balloon over other memory reclaim
> > > mechanisms is that it can pressure the guest's page cache into shrinking.
> > >
> > > However, since the balloon driver changed to using the shrinker API
> > > <
> > https://github.com/torvalds/linux/commit/71994620bb25a8b109388fefa9e99a28e355255a#diff-fd202acf694d9eba19c8c64da3e480c9
> > > this
> > > use case has become a bit more tricky. I'm wondering what the intended
> > > device implementation is.
> > >
> > > When inflating the balloon against page cache (i.e. no free memory
> > > remains) vmscan.c will both shrink page cache, but also invoke the
> > > shrinkers -- including the balloon's shrinker. So the balloon driver
> > > allocates memory which requires reclaim, vmscan gets this memory by
> > > shrinking the balloon, and then the driver adds the memory back to the
> > > balloon. Basically a busy no-op.
> > >
> > > If file IO is ongoing during this balloon inflation then the page cache
> > > could be growing which further puts "back pressure" on the balloon
> > > trying to inflate. In testing I've seen periods of > 45 seconds where
> > > balloon inflation makes no net forward progress.
> > >
> > > This wasn't a problem before the change to the shrinker API since forced
> > > balloon deflation only occurred via the OOM notifier callback which was
> > > invoked only after the page cache had depleted.
> > >
> > > Is this new busy behavior working as intended?
> >
> > Please note that the shrinker will only be registered in case we have
> > VIRTIO_BALLOON_F_DEFLATE_ON_OOM - (which is AFAIK very rare) - to
> > implement automatic balloon deflation when the guest is under memory
> > pressure.
> 
> 
> > Are you actually experiencing issues with that or did you just stumble
> > over the code?
> >
> 
> We have a use case that is encountering this (and that registers
> DEFLATE_ON_OOM). We can work around this, but it does seem inefficient.
> I understand there were good reasons for moving away from the OOM notifier
> callback, but I'm wondering if the balloon driver could specify a "nice"
> level to the shrinker API that would cause it to be reclaimed from only as
> a last resort?
> 

Shrinkers aren't priority based so I don't think there's a non-hacky way 
to avoid reclaiming from them, it's not the correct way to implement a
reclaim callback unless the objects can be fairly freed compared to other 
shrinkers.  The oom notifier callbacks are the canonical way for global 
reclaim to free memory only as a last resort.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
