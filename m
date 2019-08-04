Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BD808AB
	for <lists.virtualization@lfdr.de>; Sun,  4 Aug 2019 02:14:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BB43F1E48;
	Sun,  4 Aug 2019 00:14:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B5B361E45
	for <virtualization@lists.linux-foundation.org>;
	Sun,  4 Aug 2019 00:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2EC8B7ED
	for <virtualization@lists.linux-foundation.org>;
	Sun,  4 Aug 2019 00:14:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z4so77733945qtc.3
	for <virtualization@lists.linux-foundation.org>;
	Sat, 03 Aug 2019 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WqP5IEn9c1KXpbjHniLk8HqGR3ikHJzys8MEePZlMFc=;
	b=lAi4L6Z1XyIiSM5lL1y3xq2yW7AhMhA5cc/2JWhK4Uq58oYTXRY+SEfOyGjKf6kkCb
	EPC9/wo5tKQKNgcCq7J5u94OLKKBkYAT9e7xtRKka5BNmKvZWgWXct5IFZiXhtUBed8m
	rk3hbmVvbY+x2rSZElIcRMSuJak9sbEMLouEsX5kctrioFW3dP5ZTCHUO7a88gwJF86c
	Kw4vjibh/yQ70e+pFUaKMHvh1MOZwG0UveYwUOrZxaDK9+spjQNaOE305bhzgGLhXZaG
	1qCnoPNDxKWD7uKl46B5GsKjuaJdx75qFBHdD8Xa8h8Svul5AL5C3uyvDl1nKlcQKCkP
	pPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WqP5IEn9c1KXpbjHniLk8HqGR3ikHJzys8MEePZlMFc=;
	b=EAgSG9qkpXZHLJeP1rjqfwAvNkK8T5A7si+SWfA+nwPwq4qwM3fsGPnpU5e1AtLVc4
	TVaRlxEVBnnDnmkzPKZfFa3/fnjG4u2MuAeveXZvpBL+kQ8lCZUFh/eH1VdNDht9RRCu
	RVilumLep4oF7pkTw5zbBR/ZvdZI6hDZKuxhOFSPUoCa9XaPhF5eFT3dozcg4PXToYsL
	UrGkk8TqePN4aICGXaHOvDhwi4FkEba5aVrWOInn30cMY0D6MFIicYQpr2wvXNYGdAqD
	uXZWesRE1t/fWXDFrASG2sDHtvIs0/nEd8bow3qvdctnJkB0LA9PEtgXB3Z1t67f+C2+
	u17Q==
X-Gm-Message-State: APjAAAX6+PKYhEbmciRHjDkYenbpgmKyG/+g+j3Cam0/Xq9lAw6nWmDG
	JdZdngdR2FOPspxpaMr9bk6Xvw==
X-Google-Smtp-Source: APXvYqzsyyLWq0jXkEok0bUf3FHiInYAhbn8RrkmZKAfLQFhGrLDITCXgW1cHLxjIP+uPvSHKyq3TA==
X-Received: by 2002:a05:6214:1312:: with SMTP id
	a18mr103640128qvv.241.1564877642991; 
	Sat, 03 Aug 2019 17:14:02 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	g35sm42675590qtg.92.2019.08.03.17.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Aug 2019 17:14:01 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hu49w-0006gS-Bm; Sat, 03 Aug 2019 21:14:00 -0300
Date: Sat, 3 Aug 2019 21:14:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190804001400.GA25543@ziepe.ca>
References: <20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
	<20190803172944-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190803172944-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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

On Sat, Aug 03, 2019 at 05:36:13PM -0400, Michael S. Tsirkin wrote:
> On Fri, Aug 02, 2019 at 02:24:18PM -0300, Jason Gunthorpe wrote:
> > On Fri, Aug 02, 2019 at 10:27:21AM -0400, Michael S. Tsirkin wrote:
> > > On Fri, Aug 02, 2019 at 09:46:13AM -0300, Jason Gunthorpe wrote:
> > > > On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> > > > > > This must be a proper barrier, like a spinlock, mutex, or
> > > > > > synchronize_rcu.
> > > > > 
> > > > > 
> > > > > I start with synchronize_rcu() but both you and Michael raise some
> > > > > concern.
> > > > 
> > > > I've also idly wondered if calling synchronize_rcu() under the various
> > > > mm locks is a deadlock situation.
> > > > 
> > > > > Then I try spinlock and mutex:
> > > > > 
> > > > > 1) spinlock: add lots of overhead on datapath, this leads 0 performance
> > > > > improvement.
> > > > 
> > > > I think the topic here is correctness not performance improvement
> > > 
> > > The topic is whether we should revert
> > > commit 7f466032dc9 ("vhost: access vq metadata through kernel virtual address")
> > > 
> > > or keep it in. The only reason to keep it is performance.
> > 
> > Yikes, I'm not sure you can ever win against copy_from_user using
> > mmu_notifiers?
> 
> Ever since copy_from_user started playing with flags (for SMAP) and
> added speculation barriers there's a chance we can win by accessing
> memory through the kernel address.

You think copy_to_user will be more expensive than the minimum two
atomics required to synchronize with another thread?

> > Also, why can't this just permanently GUP the pages? In fact, where
> > does it put_page them anyhow? Worrying that 7f466 adds a get_user page
> > but does not add a put_page??

You didn't answer this.. Why not just use GUP?

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
