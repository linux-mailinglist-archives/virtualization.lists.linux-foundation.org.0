Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E25DD7FC3C
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 16:29:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D72DD14D9;
	Fri,  2 Aug 2019 14:28:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E078D1489
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 14:27:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 831027ED
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 14:27:30 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h18so74077262qtm.9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 02 Aug 2019 07:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=P2Hb3FZglhIdbXiYdjxjKY7R3yX7bFoilggrVili8pk=;
	b=QE4cQRRz8yt0Ppsx6fZqDiJUIkOPStkUj17nZf13eFzfU3KkYeYTAmv63xTpfw6jd3
	g8DoAwDztWD6MeclPxbY6dWGyCM7+J+EB4vsv44KIPoB6ZBnqrnmoTF8UVM+ZuLGa/FP
	5SKnGNWxZeYBRiRwRYIrINOqgi2atYi8GA4k8ZrV5FaD3NN5btIpPXJRMsGbzxuU6m6j
	mRuawr2++dgCoIqqkOoF0R5qhxjhxPBUqVStri87mVc9u0YiVwh3KH+q89mHnF7Xqoq5
	ImIfq/K/XIoS7HEcupM3EFidXqTlrMLXY/guuJGFvA8CHN8NXPlaVJ0Jfpp+Yu5yYSpt
	c/Sg==
X-Gm-Message-State: APjAAAX+rdiKwz/2QGxX055Ad0EdQVVfjYxQ2zxO2DWun3Rl93JSQ3tV
	p5fBARjSX5sVO5o99C/mKpEFyw==
X-Google-Smtp-Source: APXvYqw3KBnCa3P7200Yn0foGxB3Mb3u607NCRK+HftBdUxylQNUOizF39tGc/1MfSlJjVQ6mmiQyA==
X-Received: by 2002:aed:3944:: with SMTP id l62mr96389184qte.34.1564756049676; 
	Fri, 02 Aug 2019 07:27:29 -0700 (PDT)
Received: from redhat.com ([147.234.38.1]) by smtp.gmail.com with ESMTPSA id
	d20sm30304231qto.59.2019.08.02.07.27.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 07:27:28 -0700 (PDT)
Date: Fri, 2 Aug 2019 10:27:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190802100414-mutt-send-email-mst@kernel.org>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802124613.GA11245@ziepe.ca>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Fri, Aug 02, 2019 at 09:46:13AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> > > This must be a proper barrier, like a spinlock, mutex, or
> > > synchronize_rcu.
> > 
> > 
> > I start with synchronize_rcu() but both you and Michael raise some
> > concern.
> 
> I've also idly wondered if calling synchronize_rcu() under the various
> mm locks is a deadlock situation.
> 
> > Then I try spinlock and mutex:
> > 
> > 1) spinlock: add lots of overhead on datapath, this leads 0 performance
> > improvement.
> 
> I think the topic here is correctness not performance improvement

The topic is whether we should revert
commit 7f466032dc9 ("vhost: access vq metadata through kernel virtual address")

or keep it in. The only reason to keep it is performance.

Now as long as all this code is disabled anyway, we can experiment a
bit.

I personally feel we would be best served by having two code paths:

- Access to VM memory directly mapped into kernel
- Access to userspace


Having it all cleanly split will allow a bunch of optimizations, for
example for years now we planned to be able to process an incoming short
packet directly on softirq path, or an outgoing on directly within
eventfd.


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
