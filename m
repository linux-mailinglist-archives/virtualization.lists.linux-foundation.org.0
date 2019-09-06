Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 566ADABA0D
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 15:57:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 234012353;
	Fri,  6 Sep 2019 13:57:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 850EB2347
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:57:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1BAAC7DB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:57:36 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 840384E8AC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 13:57:35 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id 72so6468443qki.12
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 06:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=tvOYoeurVEmYtOK8IHP/SsbTbDLRv0QLwd4LI9xguBI=;
	b=sN23I4jsYRqzWTaOieEX6Or4EbQLZaPj/O3/QMDz1OCHPDcMtnP6/zzkdN8anM56AA
	jua3bM2+iOQ6NTcFLIOxOumuuYWYwks/wNgcreuMfusqM0GlZrQGIRu7e2qCqmjDpIe5
	N+dwoYKz9pgRS+DsSmVTY0wjdXRxfo3f1eBxrojcJ2BFdWbtCDfWwHSKefaFXSEnKYsS
	yqFu0nzUnG1xf3pCOdXs80qBZ3ZFRxY0cz2+tG97MlDHJejyy8T02qaQ2ojOo9xjwkt9
	yX7YSaoLENJIE0svbc1LwKR0XKQE3BERdDDcrnsbJVLlG4xyfAqCPTDFfXo1/MuX2hU7
	3nIg==
X-Gm-Message-State: APjAAAW/j8bDEz4lV4YGybSaEYI1VvleqgZXX+BbZS6HJcBKt1bQiK/i
	oXWcySHDrknXy+VTabe2nWuUAvEgNbF097DXH4e+GpkwjmL67zlbYETfTAZfC+xHJuwz5m9lBkY
	s2oB7y031ZpjEKRCNhtWg9jV/vGUv+ZB4iwwFYGNuew==
X-Received: by 2002:ac8:1793:: with SMTP id o19mr9128628qtj.64.1567778254723; 
	Fri, 06 Sep 2019 06:57:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZc49QnyXzg0nyuLIbTlHLkfvD93+v8Ae4jU42P20db23h2fLY0IYcXZVIrHdUZq3he+/hHw==
X-Received: by 2002:ac8:1793:: with SMTP id o19mr9128572qtj.64.1567778253776; 
	Fri, 06 Sep 2019 06:57:33 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	b16sm3231741qtk.65.2019.09.06.06.57.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 06:57:33 -0700 (PDT)
Date: Fri, 6 Sep 2019 09:57:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 00/18] virtiofs: Fix various races and cleanups round 1
Message-ID: <20190906095428-mutt-send-email-mst@kernel.org>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<CAJfpegu8POz9gC4MDEcXxDWBD0giUNFgJhMEzntJX_u4+cS9Zw@mail.gmail.com>
	<20190906103613.GH5900@stefanha-x1.localdomain>
	<CAJfpegudNVZitQ5L8gPvA45mRPFDk9fhyboceVW6xShpJ4mLww@mail.gmail.com>
	<20190906120817.GA22083@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906120817.GA22083@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
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

On Fri, Sep 06, 2019 at 08:08:17AM -0400, Vivek Goyal wrote:
> On Fri, Sep 06, 2019 at 01:52:41PM +0200, Miklos Szeredi wrote:
> > On Fri, Sep 6, 2019 at 12:36 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Fri, Sep 06, 2019 at 10:15:14AM +0200, Miklos Szeredi wrote:
> > > > On Thu, Sep 5, 2019 at 9:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Michael Tsirkin pointed out issues w.r.t various locking related TODO
> > > > > items and races w.r.t device removal.
> > > > >
> > > > > In this first round of cleanups, I have taken care of most pressing
> > > > > issues.
> > > > >
> > > > > These patches apply on top of following.
> > > > >
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#virtiofs-v4
> > > > >
> > > > > I have tested these patches with mount/umount and device removal using
> > > > > qemu monitor. For example.
> > > >
> > > > Is device removal mandatory?  Can't this be made a non-removable
> > > > device?  Is there a good reason why removing the virtio-fs device
> > > > makes sense?
> > >
> > > Hot plugging and unplugging virtio PCI adapters is common.  I'd very
> > > much like removal to work from the beginning.
> > 
> > Can you give an example use case?
> 
> David Gilbert mentioned this could be useful if daemon stops responding
> or dies. One could remove device. That will fail all future requests
> and allow unmounting filesystem.
> 
> Havind said that, current implementation will help in above situation
> only if there are no pending requests. If there are pending requests
> and daemon stops responding, then removal will hang too, as we wait
> for draining the queues.
> 
> So at some point of time, we also need some sort of timeout functionality
> where we end requests with error after a timeout.
> 
> I feel we should support removing device at some point of time. But its
> not necessarily a must have feature for first round.
> 
> Thanks
> Vivek

Without removal how do we stop guest poking at some files if we want to?

I guess we could invent a special event to block accesses,
but unplug will just do it.

blk and scsi support removal out of box, if this is supposed
to be a drop in replacement then I think yes, you want this
support.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
