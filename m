Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1C809ED
	for <lists.virtualization@lfdr.de>; Sun,  4 Aug 2019 10:07:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 64FD1D6A;
	Sun,  4 Aug 2019 08:07:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4CE52D39
	for <virtualization@lists.linux-foundation.org>;
	Sun,  4 Aug 2019 08:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2339829
	for <virtualization@lists.linux-foundation.org>;
	Sun,  4 Aug 2019 08:07:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so81426160wru.0
	for <virtualization@lists.linux-foundation.org>;
	Sun, 04 Aug 2019 01:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=9iGihd0uQZm0OhWtfPGT4IVKLzhJ/X1+ULeDAnIt+iM=;
	b=s2UdmoPeOe/j0woc+5K4YHkfcwCyhYsORGI2FaEk7ppQv9DuW02Fikzc3yPEzxrZdD
	kiSDVY1dMdW6dDNcNBFL/+wvTPQeaRWWJfq8fWvBCjzyaHeL3fXPIhdGEoAaLIv4aZRc
	GT3McFkTLdlsgnXIifX7jWvIHOaWBr2MblmfxXSQ3GTilBlgfAHAyB0Euso/EYv0jiA0
	MBkpxJ4An9PC8LEg+IyEWlya93f2PeMSlcC5kUxwSwg2twHgLHYmBIf2gFTnXa8ck3CT
	QSFe1GxHtQ2Yj5hMgww+iDax2B8+AWqqKsSgFFyNwywgAfh446SvKkv0a49ukb6TvZyg
	+O5w==
X-Gm-Message-State: APjAAAWvremLNzX/8eKY0UEjwpCav39EuaaJhQN3SqPkjoZh8wXmAVAj
	Vp28VqBc0xr/kd1zjIxy1jvw2A==
X-Google-Smtp-Source: APXvYqwI+gaRAvVddfB9OVUlNyUeUxov9xoEZgkuKZzlqBcvGCZoK4Z/LJM3l40Bq9U3eA5YbA17zQ==
X-Received: by 2002:adf:e2c1:: with SMTP id d1mr163081358wrj.283.1564906041363;
	Sun, 04 Aug 2019 01:07:21 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	r11sm124352644wre.14.2019.08.04.01.07.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 04 Aug 2019 01:07:20 -0700 (PDT)
Date: Sun, 4 Aug 2019 04:07:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190804040034-mutt-send-email-mst@kernel.org>
References: <7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
	<20190803172944-mutt-send-email-mst@kernel.org>
	<20190804001400.GA25543@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804001400.GA25543@ziepe.ca>
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

On Sat, Aug 03, 2019 at 09:14:00PM -0300, Jason Gunthorpe wrote:
> On Sat, Aug 03, 2019 at 05:36:13PM -0400, Michael S. Tsirkin wrote:
> > On Fri, Aug 02, 2019 at 02:24:18PM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 02, 2019 at 10:27:21AM -0400, Michael S. Tsirkin wrote:
> > > > On Fri, Aug 02, 2019 at 09:46:13AM -0300, Jason Gunthorpe wrote:
> > > > > On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> > > > > > > This must be a proper barrier, like a spinlock, mutex, or
> > > > > > > synchronize_rcu.
> > > > > > 
> > > > > > 
> > > > > > I start with synchronize_rcu() but both you and Michael raise some
> > > > > > concern.
> > > > > 
> > > > > I've also idly wondered if calling synchronize_rcu() under the various
> > > > > mm locks is a deadlock situation.
> > > > > 
> > > > > > Then I try spinlock and mutex:
> > > > > > 
> > > > > > 1) spinlock: add lots of overhead on datapath, this leads 0 performance
> > > > > > improvement.
> > > > > 
> > > > > I think the topic here is correctness not performance improvement
> > > > 
> > > > The topic is whether we should revert
> > > > commit 7f466032dc9 ("vhost: access vq metadata through kernel virtual address")
> > > > 
> > > > or keep it in. The only reason to keep it is performance.
> > > 
> > > Yikes, I'm not sure you can ever win against copy_from_user using
> > > mmu_notifiers?
> > 
> > Ever since copy_from_user started playing with flags (for SMAP) and
> > added speculation barriers there's a chance we can win by accessing
> > memory through the kernel address.
> 
> You think copy_to_user will be more expensive than the minimum two
> atomics required to synchronize with another thread?

I frankly don't know. With SMAP you flip flags twice, and with spectre
you flush the pipeline. Is that cheaper or more expensive than an atomic
operation? Testing is the only way to tell.

> > > Also, why can't this just permanently GUP the pages? In fact, where
> > > does it put_page them anyhow? Worrying that 7f466 adds a get_user page
> > > but does not add a put_page??
> 
> You didn't answer this.. Why not just use GUP?
> 
> Jason

Sorry I misunderstood the question. Permanent GUP breaks lots of
functionality we need such as THP and numa balancing.

release_pages is used instead of put_page.




-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
