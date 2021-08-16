Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D119D3ED9DF
	for <lists.virtualization@lfdr.de>; Mon, 16 Aug 2021 17:29:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 430B84025E;
	Mon, 16 Aug 2021 15:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9tEkDlMoWbY; Mon, 16 Aug 2021 15:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D724D401D7;
	Mon, 16 Aug 2021 15:29:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DAE8C000E;
	Mon, 16 Aug 2021 15:29:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 097B2C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 15:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECE656075D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 15:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPrhfspSE34f
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 15:29:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 021EA60767
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629127763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wKQWJP2CL88WYigQwy4KZTVcvSxL90N4z38eoJblzK4=;
 b=Xk2LPvZlOgvu44ixE8wKIvL0JMStXOmi+4AX714d51JCKRPLMaJeni3uwAoQKVXhqT9Ffp
 PDx4c+g1OEyNQA3O6g7gf+JjwnSymIx/RuKSB87ogN1wYvJVn7D2lkFfkRMW/YOj0LKUgT
 EOXV0CsoKOA6Ze/wiRK4ziVgG1YYgZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-fzRKeABpPr2KdlOVJxxupw-1; Mon, 16 Aug 2021 11:29:20 -0400
X-MC-Unique: fzRKeABpPr2KdlOVJxxupw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B3431019630;
 Mon, 16 Aug 2021 15:29:19 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0C692CD33;
 Mon, 16 Aug 2021 15:29:02 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 851462237F5; Mon, 16 Aug 2021 11:29:02 -0400 (EDT)
Date: Mon, 16 Aug 2021 11:29:02 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH v4 5/5] virtiofs: propagate sync() to file server
Message-ID: <YRqEPjzHg9IlifBo@redhat.com>
References: <20210520154654.1791183-1-groug@kaod.org>
 <20210520154654.1791183-6-groug@kaod.org>
 <CAOQ4uxh69ii5Yk-DgFAq+TrrvJ6xCv9s8sKLfo3aBCSWjJvp9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxh69ii5Yk-DgFAq+TrrvJ6xCv9s8sKLfo3aBCSWjJvp9Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Sun, Aug 15, 2021 at 05:14:06PM +0300, Amir Goldstein wrote:
> Hi Greg,
> 
> Sorry for the late reply, I have some questions about this change...
> 
> On Fri, May 21, 2021 at 9:12 AM Greg Kurz <groug@kaod.org> wrote:
> >
> > Even if POSIX doesn't mandate it, linux users legitimately expect
> > sync() to flush all data and metadata to physical storage when it
> > is located on the same system. This isn't happening with virtiofs
> > though : sync() inside the guest returns right away even though
> > data still needs to be flushed from the host page cache.
> >
> > This is easily demonstrated by doing the following in the guest:
> >
> > $ dd if=/dev/zero of=/mnt/foo bs=1M count=5K ; strace -T -e sync sync
> > 5120+0 records in
> > 5120+0 records out
> > 5368709120 bytes (5.4 GB, 5.0 GiB) copied, 5.22224 s, 1.0 GB/s
> > sync()                                  = 0 <0.024068>
> > +++ exited with 0 +++
> >
> > and start the following in the host when the 'dd' command completes
> > in the guest:
> >
> > $ strace -T -e fsync /usr/bin/sync virtiofs/foo
> > fsync(3)                                = 0 <10.371640>
> > +++ exited with 0 +++
> >
> > There are no good reasons not to honor the expected behavior of
> > sync() actually : it gives an unrealistic impression that virtiofs
> > is super fast and that data has safely landed on HW, which isn't
> > the case obviously.
> >
> > Implement a ->sync_fs() superblock operation that sends a new
> > FUSE_SYNCFS request type for this purpose. Provision a 64-bit
> > placeholder for possible future extensions. Since the file
> > server cannot handle the wait == 0 case, we skip it to avoid a
> > gratuitous roundtrip. Note that this is per-superblock : a
> > FUSE_SYNCFS is send for the root mount and for each submount.
> >
> > Like with FUSE_FSYNC and FUSE_FSYNCDIR, lack of support for
> > FUSE_SYNCFS in the file server is treated as permanent success.
> > This ensures compatibility with older file servers : the client
> > will get the current behavior of sync() not being propagated to
> > the file server.
> 
> I wonder - even if the server does not support SYNCFS or if the kernel
> does not trust the server with SYNCFS, fuse_sync_fs() can wait
> until all pending requests up to this call have been completed, either
> before or after submitting the SYNCFS request. No?

> 
> Does virtiofsd track all requests prior to SYNCFS request to make
> sure that they were executed on the host filesystem before calling
> syncfs() on the host filesystem?

Hi Amir,

I don't think virtiofsd has any such notion. I would think, that
client should make sure all pending writes have completed and
then send SYNCFS request.

Looking at the sync_filesystem(), I am assuming vfs will take care
of flushing out all dirty pages and then call ->sync_fs.

Having said that, I think fuse queues the writeback request internally
and signals completion of writeback to mm(end_page_writeback()). And
that's why fuse_fsync() has notion of waiting for all pending
writes to finish on an inode (fuse_sync_writes()).

So I think you have raised a good point. That is if there are pending
writes at the time of syncfs(), we don't seem to have a notion of
first waiting for all these writes to finish before we send
FUSE_SYNCFS request to server. 

In case of virtiofs, we could probably move away from the notion
of ending writeback immediately. IIUC, this was needed for regular
fuse where we wanted to make sure rouge/malfunctining fuse server
could not affect processes on system which are not dealing with
fuse. But in case of virtiofs, guest is trusting file server. I
had tried to get rid of this for virtiofs but ran into some
other issues which I could not resolve easily at the time and
then I got distracted in other things.

Anyway, irrespective of that, we probably need a way to flush
out all pending writes with fuse and then send FUSE_SYNCFS. (And
lost make sure writes coming after call to fuse_sync_fs(), continue
to be queued and we don't livelock.

BTW, in the context of virtiofs, this probably is problem only with
mmaped writes. otherwise cache=auto and cache=none are basically
writethrough caches. So write is sent to server immediately. So there
is nothing to be written back when syncfs() comes along. But mmaped()
writes are different and even with cache=auto there can be dirty pages.
(cache=none does not support mmap() at all).

> 
> I am not familiar enough with FUSE internals so there may already
> be a mechanism to track/wait for all pending requests?

fuse_sync_writes() does it for inode. I am not aware of anything
which can do it for the whole filesystem (all the inodes).

> 
> >
> > Note that such an operation allows the file server to DoS sync().
> > Since a typical FUSE file server is an untrusted piece of software
> > running in userspace, this is disabled by default.  Only enable it
> > with virtiofs for now since virtiofsd is supposedly trusted by the
> > guest kernel.
> 
> Isn't there already a similar risk of DoS to sync() from the ability of any
> untrusted (or malfunctioning) server to block writes?

I think fuse has some safeguards for this. Fuse signals completion
of writeback immediately so that vfs/mm/fs does not blocking trying
to writeback and if server is not finishing WRITES fast enough, the
there will be enough dirty pages in bdi that it will create back
pressure and block process dirtying pages.

Thanks
Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
