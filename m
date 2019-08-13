Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BF8B7B1
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 13:57:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 70E43CB5;
	Tue, 13 Aug 2019 11:57:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 030A0C2A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 11:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 83FD312F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 11:57:09 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t12so17416592qtp.9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 04:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RPb0NU5H2rzwjdvr45r58ZWni2Zoy4JljRGSpgnMMr4=;
	b=ap0SmPcZPZ6NNFvNyFkpypRbg36yi8bdsTd4/F6gQQqPPgiM5IjDvTKZEGGxca8l8F
	u5EQEn7sEyhGruMuB7cjg3kUgzh9Cv/quO6ECF3rbawY4hb6Yw2dyN9iU6PgCvTDOCh0
	xsYZVNW0ajla3uTLaTh6ZCITFtrsONP4+81D6sumJLjqzxf2snBDmJYrwx6qXccYld+H
	swJwSMjlc5QmHizDCiZoTu8O5ptOxdiKgiKAZ9i3JGi/jhbj1siIrzDAKpRTStg72MQw
	/hWyMVuaK40viEpVJr1GXiLhMU2L4bLITv7lm7rfgwRXFHTHOxuSU5tATEjLqz3Rmkx9
	LONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RPb0NU5H2rzwjdvr45r58ZWni2Zoy4JljRGSpgnMMr4=;
	b=obJfSZVca64G2r2n6s8OTK5oxAwaWNebjkGZDiXOWbwffUp4gD9eHK1eAb80b5vNJg
	JPIu66JtxwEDmENCbV4v7rfib842WQHsXiqgn9JRKz9eBUEAYnOFxsG6O6qOvqdVkHXy
	JZhlHZd07My3YXGHxi6Ec/TzD3lhxL5d4r+0bMUQbDe1clDLQlqjQe2Gr4mdXETgYGbb
	deE/tCG4hPNpEwZqqJcjU0P/WKyGe4bZ5b+p49IAqUImwGG9lYuZ/vQtM5HV6sM8EmzY
	3HBe9uasUQW7PQJ8EbBMy9O5ZeITDzOFptILli6RAkLLKU0j3YG5OHKmqHqopUib84Ch
	pV/w==
X-Gm-Message-State: APjAAAXnxvYgG/DlRwAF7tVOOL0miNTrkWgLmgbgleJss/VA8fvCu07I
	7ix2Ysb6hv1KCkI2tRfyZnH0kQ==
X-Google-Smtp-Source: APXvYqyQLbr3IuoVdbXppS/ZGOesGhtgbHcYTwB9ezrUQfPYFcx2A9k+2h1mf3jK0ev1zMtBSQ9gpg==
X-Received: by 2002:a0c:f193:: with SMTP id m19mr33863324qvl.20.1565697428498; 
	Tue, 13 Aug 2019 04:57:08 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	r4sm69930362qta.93.2019.08.13.04.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Aug 2019 04:57:07 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hxVQJ-0007sn-HH; Tue, 13 Aug 2019 08:57:07 -0300
Date: Tue, 13 Aug 2019 08:57:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190813115707.GC29508@ziepe.ca>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<20190812130252.GE24457@ziepe.ca>
	<9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Tue, Aug 13, 2019 at 04:31:07PM +0800, Jason Wang wrote:

> What kind of issues do you see? Spinlock is to synchronize GUP with MMU
> notifier in this series.

A GUP that can't sleep can't pagefault which makes it a really weird
pattern

> Btw, back to the original question. May I know why synchronize_rcu() is not
> suitable? Consider:

We already went over this. You'd need to determine it doesn't somehow
deadlock the mm on reclaim paths. Maybe it is OK, the rcq_gq_wq is
marked WQ_MEM_RECLAIM at least..

I also think Michael was concerned about the latency spikes a long RCU
delay would cause.

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
