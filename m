Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42B3EDDA5
	for <lists.virtualization@lfdr.de>; Mon, 16 Aug 2021 21:11:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED2A5600D1;
	Mon, 16 Aug 2021 19:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QW4qHY5V-Ep9; Mon, 16 Aug 2021 19:11:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AB72860796;
	Mon, 16 Aug 2021 19:11:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3652FC000E;
	Mon, 16 Aug 2021 19:11:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E7CBC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 19:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A702823CF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 19:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19L4QUi_lClC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 19:11:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D48D280F94
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 19:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629141102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YlXwlqIMFjxEcCuzBk05B0XnLJDSfPdEFh85EFRYA8=;
 b=NrB0uo94iNt5NuZl/q7a/UN1geWd5dAYNsUlUEn3hUmy5N1YidVsyTgXdO3lSSCfBi0JBv
 nnk5g4p7l7/xbC6XpLpV7h00vMJ8OgImTbbNj6ECHL2sIn+LqquhAQL+rLs3BMMxr3SOOL
 +ongq7Qa1OGw6vFdI6VZ0zaaM6mKMxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-Wu5iE0PxP5KQNZf89IvS5w-1; Mon, 16 Aug 2021 15:11:41 -0400
X-MC-Unique: Wu5iE0PxP5KQNZf89IvS5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B841394EE1;
 Mon, 16 Aug 2021 19:11:39 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E48BD5D9DD;
 Mon, 16 Aug 2021 19:11:23 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6A0EA2237F5; Mon, 16 Aug 2021 15:11:23 -0400 (EDT)
Date: Mon, 16 Aug 2021 15:11:23 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH v4 5/5] virtiofs: propagate sync() to file server
Message-ID: <YRq4W1zcsAZh3FLX@redhat.com>
References: <20210520154654.1791183-1-groug@kaod.org>
 <20210520154654.1791183-6-groug@kaod.org>
 <CAOQ4uxh69ii5Yk-DgFAq+TrrvJ6xCv9s8sKLfo3aBCSWjJvp9Q@mail.gmail.com>
 <YRqEPjzHg9IlifBo@redhat.com>
 <CAOQ4uxg+UX6MWRv9JTQDmf6Yf_NyD+pJ438Ds270vGr9YSSPZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxg+UX6MWRv9JTQDmf6Yf_NyD+pJ438Ds270vGr9YSSPZw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Max Reitz <mreitz@redhat.com>,
 Robert Krawitz <rlk@redhat.com>
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

On Mon, Aug 16, 2021 at 09:57:08PM +0300, Amir Goldstein wrote:
> On Mon, Aug 16, 2021 at 6:29 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Sun, Aug 15, 2021 at 05:14:06PM +0300, Amir Goldstein wrote:
> > > Hi Greg,
> > >
> > > Sorry for the late reply, I have some questions about this change...
> > >
> > > On Fri, May 21, 2021 at 9:12 AM Greg Kurz <groug@kaod.org> wrote:
> > > >
> > > > Even if POSIX doesn't mandate it, linux users legitimately expect
> > > > sync() to flush all data and metadata to physical storage when it
> > > > is located on the same system. This isn't happening with virtiofs
> > > > though : sync() inside the guest returns right away even though
> > > > data still needs to be flushed from the host page cache.
> > > >
> > > > This is easily demonstrated by doing the following in the guest:
> > > >
> > > > $ dd if=/dev/zero of=/mnt/foo bs=1M count=5K ; strace -T -e sync sync
> > > > 5120+0 records in
> > > > 5120+0 records out
> > > > 5368709120 bytes (5.4 GB, 5.0 GiB) copied, 5.22224 s, 1.0 GB/s
> > > > sync()                                  = 0 <0.024068>
> > > > +++ exited with 0 +++
> > > >
> > > > and start the following in the host when the 'dd' command completes
> > > > in the guest:
> > > >
> > > > $ strace -T -e fsync /usr/bin/sync virtiofs/foo
> > > > fsync(3)                                = 0 <10.371640>
> > > > +++ exited with 0 +++
> > > >
> > > > There are no good reasons not to honor the expected behavior of
> > > > sync() actually : it gives an unrealistic impression that virtiofs
> > > > is super fast and that data has safely landed on HW, which isn't
> > > > the case obviously.
> > > >
> > > > Implement a ->sync_fs() superblock operation that sends a new
> > > > FUSE_SYNCFS request type for this purpose. Provision a 64-bit
> > > > placeholder for possible future extensions. Since the file
> > > > server cannot handle the wait == 0 case, we skip it to avoid a
> > > > gratuitous roundtrip. Note that this is per-superblock : a
> > > > FUSE_SYNCFS is send for the root mount and for each submount.
> > > >
> > > > Like with FUSE_FSYNC and FUSE_FSYNCDIR, lack of support for
> > > > FUSE_SYNCFS in the file server is treated as permanent success.
> > > > This ensures compatibility with older file servers : the client
> > > > will get the current behavior of sync() not being propagated to
> > > > the file server.
> > >
> > > I wonder - even if the server does not support SYNCFS or if the kernel
> > > does not trust the server with SYNCFS, fuse_sync_fs() can wait
> > > until all pending requests up to this call have been completed, either
> > > before or after submitting the SYNCFS request. No?
> >
> > >
> > > Does virtiofsd track all requests prior to SYNCFS request to make
> > > sure that they were executed on the host filesystem before calling
> > > syncfs() on the host filesystem?
> >
> > Hi Amir,
> >
> > I don't think virtiofsd has any such notion. I would think, that
> > client should make sure all pending writes have completed and
> > then send SYNCFS request.
> >
> > Looking at the sync_filesystem(), I am assuming vfs will take care
> > of flushing out all dirty pages and then call ->sync_fs.
> >
> > Having said that, I think fuse queues the writeback request internally
> > and signals completion of writeback to mm(end_page_writeback()). And
> > that's why fuse_fsync() has notion of waiting for all pending
> > writes to finish on an inode (fuse_sync_writes()).
> >
> > So I think you have raised a good point. That is if there are pending
> > writes at the time of syncfs(), we don't seem to have a notion of
> > first waiting for all these writes to finish before we send
> > FUSE_SYNCFS request to server.
> 
> Maybe, but I was not referring to inode writeback requests.
> I had assumed that those were handled correctly.
> I was referring to pending metadata requests.
> 
> ->sync_fs() in local fs also takes care of flushing metadata
> (e.g. journal). I assumed that virtiofsd implements FUSE_SYNCFS
> request by calling syncfs() on host fs,

Yes virtiofsd calls syncfs() on host fs.

> but it is does that than
> there is no guarantee that all metadata requests have reached the
> host fs from virtiofs unless client or server take care of waiting
> for all pending metadata requests before issuing FUSE_SYNCFS.

We don't have any journal in virtiofs. In fact we don't seem to
cache any metadta. Except probably the case when "-o writeback" 
where we can trust local time stamps.

If "-o writeback" is not enabled, i am not sure what metadata
we will be caching that we will need to worry about. Do you have
something specific in mind. (Atleast from virtiofs point of view,
I can't seem to think what metadata we are caching which we need
to worry about).

Thanks
Vivek

> 
> But maybe I am missing something.
> 
> It might be worth mentioning that I did not find any sync_fs()
> commands that request to flush metadata caches on the server in
> NFS or SMB protocols either.
> 
> Thanks,
> Amir.
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
