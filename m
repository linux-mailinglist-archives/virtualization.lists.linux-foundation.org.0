Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE47FF8B
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 19:26:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 098721661;
	Fri,  2 Aug 2019 17:26:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5F4081542
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 17:24:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BC97E7ED
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 17:24:20 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r21so55446875qke.2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 02 Aug 2019 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=b/ZbdcC0DDz1oNoCfSGh30lpnC4X+0hWOBfmleHyzyg=;
	b=Bqm8lPIQh1rFwvAVca4MuGFlAzmCDYu5Rh+vK2o/lwsywYkM8FWq8PDerS1S494YUd
	YdRlqN86V3V07Ubkc9+u0LPC85tI9+nhfhgXLNTvG0jKt+2qsbDduSumpl+pf4RQrgiu
	/morBoV3u7YQ2MvhfXY3yuO815LwFDOzG+OPNzn+Yxd+d20QcyXCyAmyX/G2jnPicg8x
	ZmDxd4z0b8rzujaHcU5/9PkhjFkbO6/CdZXCXw4gkaClngdJY4k8vFwKphG0uzps+6rr
	fSkdfl5lEpvi8p/j3nr2rpHVff4rM27uBG1YJZnrHv0lUAHajWA+r+eYkDKDxwpzjfU8
	74YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=b/ZbdcC0DDz1oNoCfSGh30lpnC4X+0hWOBfmleHyzyg=;
	b=VWAxRo166S4q1gSxGo5Z6vx6A4YafqeYwo2/veQMHj11sk5sBIZrKWsbIHRyp1B4hp
	IZUkSfF0CqVqnudkUmB1KoETm4D2sk8FayMsT5l+64veG0TiMz94TKDNsIDyQ+233Ttt
	KYPY1ssZUmMlRKp4OaotMN3YvcGM8+fI99TUNY64+qhQwu3gSaKeK0HOZJsX0u6K4x1F
	gO1VtGyQZf9QX8c4/B1xVw2tg/NASvF9zoabVt7EDcIBipzqWN5ylB3KGUM1xPQG70S2
	CVMN6BAjifWgcK5bRdbHT2nNlDfkRPIJNwAqAvpt0OjRwUZjufcD1VYsgToq//1il7mP
	fAkw==
X-Gm-Message-State: APjAAAXr2ENvIFLMY6x04eg7XN3oTYoJW6VSN/UY6Tur3n4fiYR6YPIo
	DUrcOZQEjtKUTeq2yW+PmKtpUA==
X-Google-Smtp-Source: APXvYqz3bf1RYWu6U39GeHZIQdaItvlh7ks4r7TbDlC8NTybQtBARJwkp1RvWALo25T9mXOBSdzKwA==
X-Received: by 2002:a37:9d96:: with SMTP id
	g144mr92937157qke.288.1564766659730; 
	Fri, 02 Aug 2019 10:24:19 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	l19sm41977618qtb.6.2019.08.02.10.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Aug 2019 10:24:19 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1htbHu-0005z3-NQ; Fri, 02 Aug 2019 14:24:18 -0300
Date: Fri, 2 Aug 2019 14:24:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190802172418.GB11245@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802100414-mutt-send-email-mst@kernel.org>
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

On Fri, Aug 02, 2019 at 10:27:21AM -0400, Michael S. Tsirkin wrote:
> On Fri, Aug 02, 2019 at 09:46:13AM -0300, Jason Gunthorpe wrote:
> > On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> > > > This must be a proper barrier, like a spinlock, mutex, or
> > > > synchronize_rcu.
> > > 
> > > 
> > > I start with synchronize_rcu() but both you and Michael raise some
> > > concern.
> > 
> > I've also idly wondered if calling synchronize_rcu() under the various
> > mm locks is a deadlock situation.
> > 
> > > Then I try spinlock and mutex:
> > > 
> > > 1) spinlock: add lots of overhead on datapath, this leads 0 performance
> > > improvement.
> > 
> > I think the topic here is correctness not performance improvement
> 
> The topic is whether we should revert
> commit 7f466032dc9 ("vhost: access vq metadata through kernel virtual address")
> 
> or keep it in. The only reason to keep it is performance.

Yikes, I'm not sure you can ever win against copy_from_user using
mmu_notifiers?  The synchronization requirements are likely always
more expensive unless large and scattered copies are being done..

The rcu is about the only simple approach that could be less
expensive, and that gets back to the question if you can block an
invalidate_start_range in synchronize_rcu or not..

So, frankly, I'd revert it until someone could prove the rcu solution is
OK..

BTW, how do you get copy_from_user to work outside a syscall?

Also, why can't this just permanently GUP the pages? In fact, where
does it put_page them anyhow? Worrying that 7f466 adds a get_user page
but does not add a put_page??

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
