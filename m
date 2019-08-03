Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D98086E
	for <lists.virtualization@lfdr.de>; Sat,  3 Aug 2019 23:38:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2A331B40;
	Sat,  3 Aug 2019 21:38:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EDFD61B49
	for <virtualization@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 21:36:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B552712
	for <virtualization@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 21:36:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h21so77449876qtn.13
	for <virtualization@lists.linux-foundation.org>;
	Sat, 03 Aug 2019 14:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=EkifmyHxwnsPs8regEBTA5tK93nCtmZrIpRMe8ScOn4=;
	b=A9wplZaq9sIkllxQm7xbJtfi+tZyU1nA1VfGYER8pzGujIXWE2V/cHychc1rvM3zXh
	YSGQ/ZkDsHhc/EFkfdcV1grwnbtRaZZrqW/+NijroPqB3vRV3E1XmVmYbnk1VRs7/IZz
	JsxT4BnhCA7pyjfiTLQO90h38QHUnunL/b5KgkE7Xmal4+Qn108NrJqZ37zUYE8CiJIV
	n5C4BdVgfwOAKWhA48fFTS6ZBhQix5hXKl3Fv4ZyHZb3Sgb6cacF+S2o0mB//CsNTSNa
	Umdr8cirTPMkrREd09vQVxhjaw/fkhjJ1EoF9JE6+peuuOPo0q13oxEPo8Wt8Gc5YEd6
	Osxg==
X-Gm-Message-State: APjAAAUgouAsOY5xCKczgUZS2miJhMYjMAqMVJjDSNgPjdWhk3/A5M+h
	6khqvL5v+kNSrGLl2Qdnq3YTXg==
X-Google-Smtp-Source: APXvYqyFdgNs0jCQVpmdi8dR64CNPy6wD73snHAaLEfC40B+RZ0ZopacAYTEXjRinq1ReEeoFWNEuA==
X-Received: by 2002:ac8:32ec:: with SMTP id
	a41mr103176717qtb.375.1564868179417; 
	Sat, 03 Aug 2019 14:36:19 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	g3sm33648801qke.105.2019.08.03.14.36.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 14:36:18 -0700 (PDT)
Date: Sat, 3 Aug 2019 17:36:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190803172944-mutt-send-email-mst@kernel.org>
References: <20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802172418.GB11245@ziepe.ca>
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

On Fri, Aug 02, 2019 at 02:24:18PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 02, 2019 at 10:27:21AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Aug 02, 2019 at 09:46:13AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> > > > > This must be a proper barrier, like a spinlock, mutex, or
> > > > > synchronize_rcu.
> > > > 
> > > > 
> > > > I start with synchronize_rcu() but both you and Michael raise some
> > > > concern.
> > > 
> > > I've also idly wondered if calling synchronize_rcu() under the various
> > > mm locks is a deadlock situation.
> > > 
> > > > Then I try spinlock and mutex:
> > > > 
> > > > 1) spinlock: add lots of overhead on datapath, this leads 0 performance
> > > > improvement.
> > > 
> > > I think the topic here is correctness not performance improvement
> > 
> > The topic is whether we should revert
> > commit 7f466032dc9 ("vhost: access vq metadata through kernel virtual address")
> > 
> > or keep it in. The only reason to keep it is performance.
> 
> Yikes, I'm not sure you can ever win against copy_from_user using
> mmu_notifiers?

Ever since copy_from_user started playing with flags (for SMAP) and
added speculation barriers there's a chance we can win by accessing
memory through the kernel address.


Another reason would be to access it from e.g. softirq
context. copy_from_user will only work if the
correct mmu is active.


> The synchronization requirements are likely always
> more expensive unless large and scattered copies are being done..
> 
> The rcu is about the only simple approach that could be less
> expensive, and that gets back to the question if you can block an
> invalidate_start_range in synchronize_rcu or not..
> 
> So, frankly, I'd revert it until someone could prove the rcu solution is
> OK..

I have it all disabled at compile time, so reverting isn't urgent
anymore. I'll wait a couple more days to decide what's cleanest.

> BTW, how do you get copy_from_user to work outside a syscall?

By switching to the correct mm.

> 
> Also, why can't this just permanently GUP the pages? In fact, where
> does it put_page them anyhow? Worrying that 7f466 adds a get_user page
> but does not add a put_page??
> 
> Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
