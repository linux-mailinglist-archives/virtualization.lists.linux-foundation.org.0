Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43E38C1CF
	for <lists.virtualization@lfdr.de>; Fri, 21 May 2021 10:29:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F36A5400CA;
	Fri, 21 May 2021 08:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mo7hlSxUzWj7; Fri, 21 May 2021 08:29:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B956A40207;
	Fri, 21 May 2021 08:29:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A3A9C0001;
	Fri, 21 May 2021 08:29:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6894CC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 425DF4010B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHp9Wb5XzkTv
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:28:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16B95400C3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:28:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-IzwURQWAMn2VOcSgFBBl0Q-1; Fri, 21 May 2021 04:28:45 -0400
X-MC-Unique: IzwURQWAMn2VOcSgFBBl0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B08B48042A8;
 Fri, 21 May 2021 08:28:44 +0000 (UTC)
Received: from bahia.lan (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 610C25D764;
 Fri, 21 May 2021 08:28:35 +0000 (UTC)
Date: Fri, 21 May 2021 10:28:33 +0200
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v4 2/5] fuse: Call vfs_get_tree() for submounts
Message-ID: <20210521102833.4a7595b7@bahia.lan>
In-Reply-To: <YKdtJCo/06q594pM@miu.piliscsaba.redhat.com>
References: <20210520154654.1791183-1-groug@kaod.org>
 <20210520154654.1791183-3-groug@kaod.org>
 <YKdtJCo/06q594pM@miu.piliscsaba.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Cc: linux-kernel@vger.kernel.org, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Vivek Goyal <vgoyal@redhat.com>
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

On Fri, 21 May 2021 10:19:48 +0200
Miklos Szeredi <miklos@szeredi.hu> wrote:

> On Thu, May 20, 2021 at 05:46:51PM +0200, Greg Kurz wrote:
> > We don't set the SB_BORN flag on submounts superblocks. This is wrong
> > as these superblocks are then considered as partially constructed or
> > dying in the rest of the code and can break some assumptions.
> > 
> > One such case is when you have a virtiofs filesystem and you try to
> > mount it again : virtio_fs_get_tree() tries to obtain a superblock
> > with sget_fc(). The matching criteria in virtio_fs_test_super() is
> > the pointer of the underlying virtiofs device, which is shared by
> > the root mount and its submounts. This means that any submount can
> > be picked up instead of the root mount. This is itself a bug :
> > submounts should be ignored in this case. But, most importantly, it
> > then triggers an infinite loop in sget_fc() because it fails to grab
> > the superblock (very easy to reproduce).
> > 
> > The only viable solution is to set SB_BORN at some point. This
> > must be done with vfs_get_tree() because setting SB_BORN requires
> > special care, i.e. a memory barrier for super_cache_count() which
> > can check SB_BORN without taking any lock.
> 
> Looks correct, but...
> 
> as an easily backportable and verifiable bugfix I'd still go with the
> simple two liner:
> 
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -351,6 +351,9 @@ static struct vfsmount *fuse_dentry_automount(struct path *path)
>  	list_add_tail(&fm->fc_entry, &fc->mounts);
>  	up_write(&fc->killsb);
>  
> +	smp_wmb();
> +	sb->s_flags |= SB_BORN;
> +

plus the mandatory comment one must put to justify the
need for a memory barrier.

>  	/* Create the submount */
>  	mnt = vfs_create_mount(fsc);
>  	if (IS_ERR(mnt)) {
> 
> And have this patch be the cleanup.
> 

Fair enough.

> Also we need Fixes: and a Cc: stable@... tags on that one.
> 

Oops, I'll add these in the next round.

> Thanks,
> Miklos

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
