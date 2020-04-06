Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6419F14D
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 10:06:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6B0F92313B;
	Mon,  6 Apr 2020 08:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHiRVS4vc0-1; Mon,  6 Apr 2020 08:06:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 67CDF23109;
	Mon,  6 Apr 2020 08:06:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB675C0177;
	Mon,  6 Apr 2020 08:06:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B88BDC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 08:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9AC8685AE9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 08:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eHgnj0tnq5g
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 08:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F5A685ABE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586160380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ylWquo2AGzDmVpZOhmgLdkn6LoBRG8fV5dTAEgjmlbU=;
 b=Ng3w+qReOcloNLQQ0JPixuxXMMKOae1akRXoEb2J01muWWI1pZigQkmQdobhDAyjIQaY+6
 uUsZhC5i6116oLiiPJLKkzBHm1MSGmkSamSleusL9x0jUwAMTv7meZEn0OXmbzF5nG3VGZ
 pYjkZO23FUzhzr9uuBgFFoCJK8WLZpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-G1bArSXsOne7i05MQ5n15w-1; Mon, 06 Apr 2020 04:06:15 -0400
X-MC-Unique: G1bArSXsOne7i05MQ5n15w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0650D14E3;
 Mon,  6 Apr 2020 08:06:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BA4E5DA81;
 Mon,  6 Apr 2020 08:06:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69F1816E2C; Mon,  6 Apr 2020 10:06:12 +0200 (CEST)
Date: Mon, 6 Apr 2020 10:06:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
Message-ID: <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
References: <00000000000091056b05a2999f1e@google.com>
 <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: David Airlie <airlied@linux.ie>,
 syzbot <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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

On Mon, Apr 06, 2020 at 09:07:44AM +0200, Dmitry Vyukov wrote:
> On Mon, Apr 6, 2020 at 8:46 AM syzbot
> <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    ffc1c20c Merge tag 'for-5.7/dm-changes' of git://git.kerne..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1690471fe00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a1e2f9a9986236
> > dashboard link: https://syzkaller.appspot.com/bug?extid=d3a7951ed361037407db
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Unfortunately, I don't have any reproducer for this crash yet.
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com
> 
> 
> +drivers/gpu/drm/virtio/virtgpu_object.c maintainers
> Now we have both mainline and linux-next boot broken (linux-next is
> broken for the past 40 days).
> No testing of new code happens.
> 
> >  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> >  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230

Ah, that one.

broken patch: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
fixed by: 0666a8d7f6a4 ("drm/virtio: fix OOB in virtio_gpu_object_create")

Both are in drm-misc-next.  I suspect the fix was added after
drm-misc-next was closed for the 5.7 merge window and thus should
have been submitted to drm-misc-next-fixes instead.

So, what to do now?  Should I cherry-pick 0666a8d7f6a4 into
drm-misc-next-fixes?  Or should it go into drm-misc-fixes instead?

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
