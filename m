Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46DADCEE
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 18:18:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CACA1C7C;
	Mon,  9 Sep 2019 16:18:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7865CACD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:18:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 12E8C8B6
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:18:22 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8525EC05FF87
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:18:21 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id k68so16919671qkb.19
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 09:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=xd5J0j1O8RM23sIIIj9h2xCJg8OqHfg7OWxpv2iexsc=;
	b=I9yDJvMzHFvoUhtF1qRahOEYmjkULxp4oChbqBhSyjjMYpizQGVZN6ZG5NcYvMegxp
	tWPqpsmwErnrDIcrniXLMmdePVobAMUXa7nOQapWkydpvt1aPIP6/Z/56qWvw++ik2hk
	429zM+8E6hhL03NJnEKFFPDSrwrd4WHqIsQ2S/17FaffSneNSDz3K8pTo6SAWnOEWP8Y
	2ccHjdVGfIfUMoZfMgzhVfRKIiQGN+qu9eR6F7SrT9sbBVUlWxtvs7i2zhsVZUfHbQ2+
	LLYu8/Hxep8pj9H1URQ16aQ9UU1CJkqvPyOtBlqLnFya57SQULm0GBN9m4Ts5NQTjHtS
	lLRg==
X-Gm-Message-State: APjAAAWd5G4bmGMgLHnj2z3NtAHnnwzF2yxAGRWMyil2inPm5FqFLTMp
	RdMIoA/LwB5I6iZJav+cotMt9WAMJS4po/h1GRK/JOTbN4P5WsprVXV5hoyQVj+DYr6n7YzmTqI
	ls1nsHM17p5PH62PeNIaN+0xNG/QrqKDg8EDADwK1fw==
X-Received: by 2002:aed:316d:: with SMTP id 100mr442785qtg.20.1568045900871;
	Mon, 09 Sep 2019 09:18:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvZ3BxEyb3pt+fbqjr5qKBJvhxJopIJiuMLcQ+RPNA0muqjQbM1NQBmU9ZKN8evHR3WQQZoA==
X-Received: by 2002:aed:316d:: with SMTP id 100mr442761qtg.20.1568045900648;
	Mon, 09 Sep 2019 09:18:20 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	c14sm8927771qta.80.2019.09.09.09.18.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 09:18:19 -0700 (PDT)
Date: Mon, 9 Sep 2019 12:18:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 00/18] virtiofs: Fix various races and
	cleanups round 1
Message-ID: <20190909121604-mutt-send-email-mst@kernel.org>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<CAJfpegu8POz9gC4MDEcXxDWBD0giUNFgJhMEzntJX_u4+cS9Zw@mail.gmail.com>
	<20190906103613.GH5900@stefanha-x1.localdomain>
	<CAJfpegudNVZitQ5L8gPvA45mRPFDk9fhyboceVW6xShpJ4mLww@mail.gmail.com>
	<866a1469-2c4b-59ce-cf3f-32f65e861b99@huawei.com>
	<20190909161455.GG20875@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909161455.GG20875@stefanha-x1.localdomain>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	piaojun <piaojun@huawei.com>, linux-fsdevel@vger.kernel.org,
	Vivek Goyal <vgoyal@redhat.com>
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

On Mon, Sep 09, 2019 at 06:14:55PM +0200, Stefan Hajnoczi wrote:
> On Sun, Sep 08, 2019 at 07:53:55PM +0800, piaojun wrote:
> > 
> > 
> > On 2019/9/6 19:52, Miklos Szeredi wrote:
> > > On Fri, Sep 6, 2019 at 12:36 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >>
> > >> On Fri, Sep 06, 2019 at 10:15:14AM +0200, Miklos Szeredi wrote:
> > >>> On Thu, Sep 5, 2019 at 9:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >>>>
> > >>>> Hi,
> > >>>>
> > >>>> Michael Tsirkin pointed out issues w.r.t various locking related TODO
> > >>>> items and races w.r.t device removal.
> > >>>>
> > >>>> In this first round of cleanups, I have taken care of most pressing
> > >>>> issues.
> > >>>>
> > >>>> These patches apply on top of following.
> > >>>>
> > >>>> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtiofs-v4
> > >>>>
> > >>>> I have tested these patches with mount/umount and device removal using
> > >>>> qemu monitor. For example.
> > >>>
> > >>> Is device removal mandatory?  Can't this be made a non-removable
> > >>> device?  Is there a good reason why removing the virtio-fs device
> > >>> makes sense?
> > >>
> > >> Hot plugging and unplugging virtio PCI adapters is common.  I'd very
> > >> much like removal to work from the beginning.
> > > 
> > > Can you give an example use case?
> > 
> > I think VirtFS migration need hot plugging, or it may cause QEMU crash
> > or some problems.
> 
> Live migration is currently unsupported.  Hot unplugging the virtio-fs
> device would allow the guest to live migrate successfully, so it's a
> useful feature to work around the missing live migration support.
> 
> Is this what you mean?
> 
> Stefan

Exactly. That's what I also said. To add to that, hotplug can not be
negotiated, so it's not a feature we can easily add down the road if old
guests crash on unplug. Thus a driver that does not support unplug
should not claim to support removal.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
