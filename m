Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806038C183
	for <lists.virtualization@lfdr.de>; Fri, 21 May 2021 10:15:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B45D260DFF;
	Fri, 21 May 2021 08:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-4zO-OVJORG; Fri, 21 May 2021 08:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 945D860DD0;
	Fri, 21 May 2021 08:15:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE41C0001;
	Fri, 21 May 2021 08:15:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17FFFC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2AD96073D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zwYjwebquFw
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:15:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51D876072D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 08:15:40 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-P7MMZ4skNEasB_Ci5O7ioQ-1; Fri, 21 May 2021 04:15:35 -0400
X-MC-Unique: P7MMZ4skNEasB_Ci5O7ioQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FD3F107ACCD;
 Fri, 21 May 2021 08:15:34 +0000 (UTC)
Received: from bahia.lan (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B74C65C8A8;
 Fri, 21 May 2021 08:15:24 +0000 (UTC)
Date: Fri, 21 May 2021 10:15:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v4 1/5] fuse: Fix leak in fuse_dentry_automount() error
 path
Message-ID: <20210521101523.4f276dac@bahia.lan>
In-Reply-To: <CAJfpegvFUasy_8djyvo-fpyboOLGwRV9k_CL-e1nqxcXHkvzOg@mail.gmail.com>
References: <20210520154654.1791183-1-groug@kaod.org>
 <20210520154654.1791183-2-groug@kaod.org>
 <YKa8SZ8s6QeKZ4XP@zeniv-ca.linux.org.uk>
 <CAJfpegvFUasy_8djyvo-fpyboOLGwRV9k_CL-e1nqxcXHkvzOg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 virtio-fs-list <virtio-fs@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Max Reitz <mreitz@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
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

On Fri, 21 May 2021 09:54:19 +0200
Miklos Szeredi <miklos@szeredi.hu> wrote:

> On Thu, 20 May 2021 at 21:45, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > On Thu, May 20, 2021 at 05:46:50PM +0200, Greg Kurz wrote:
> > > Some rollback was forgotten during the addition of crossmounts.
> >
> > Have you actually tested that?  Because I strongly suspect that
> > by that point the ownership of fc and fm is with sb and those
> > should be taken care of by deactivate_locked_super().
> 
> Not quite.  Patch looks correct because destruction of fm is done in
> fuse_put_super(), which only gets called if the sb initialization gets
> as far as setting up sb->s_root, which only happens after the
> successful fuse_fill_super_submount() call in this case.
> 
> Doing the destruction from the various ->kill_sb() instances instead
> of from ->put_super() would also fix this, but I'm not quite sure that
> that would be any cleaner.
> 

As saying in the answer I've just posted, a failure in
fuse_fill_super_submount() causes an actual crash because
fuse_mount_remove() logically assumes fm to already be in
fc->mounts, which isn't the case at this point.

In the root mount case, this is handled by taking back
the ownership on fm, i.e. do the rollback *and* clear
sb->s_fs_info. It seems that the same should be done
for submounts.

> Thanks,
> Miklos

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
