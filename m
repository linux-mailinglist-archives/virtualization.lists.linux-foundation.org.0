Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484F19F607
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 14:47:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41E3D87A5A;
	Mon,  6 Apr 2020 12:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmmidmYcu011; Mon,  6 Apr 2020 12:47:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9513787774;
	Mon,  6 Apr 2020 12:47:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8611FC0177;
	Mon,  6 Apr 2020 12:47:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAC0BC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 92EB82324E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTWpVJ+Dt1-v
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:47:02 +0000 (UTC)
X-Greylist: delayed 00:05:29 by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 9381D23086
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 12:47:02 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z5so15104715oth.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sr72t4r7lxhc/Q3B1vivttix8afMzynpg5rTdMjQSoY=;
 b=entol2rHnqykEsDN6YkZxSuwSctDqAnKsid7hRR+PoqC5lMipLmtfJhXeba6wjsCWm
 rfaehblGx+Me4JYjbyW4WDcJeNAIw072KujfJUYa5Ld5UR+7o3ji9LNAJu4QZHm7mDfm
 U9KG1jjMrh/5skPTpZMtN9W1LtYTC7V9W6cd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sr72t4r7lxhc/Q3B1vivttix8afMzynpg5rTdMjQSoY=;
 b=c42E82q9PDynPKKqslPG/AFYyhEmAqEDiCJlkMH1VzwKZ7bis1gUBeXwvy1IG7z5HL
 K6ahO+kUTTTz5QnYADL242y4smO11MRf9OGf4kw0DKXPjgQwqBhAKjMiYtdJogjncEX4
 UXbM9398oxZ1AC81o1pJ0Tam8L6V6dUhrc3QERWV90NsY9Y5vbDDV+79mS/Wov09cobX
 Z0BhziKOiEe7MztAcXWBPtCDSSrbsPYkoI48/zNZpQMD45Qzsw5Kng2OoUllrnRWb4Tp
 tp0qkVEO8pqL2OJLqfmt2aHb1xpCRZhOMJvto9ug/4r8fif7XKhIDo57qdupJPjc55Ho
 C2GQ==
X-Gm-Message-State: AGi0PuZ+Gv7pbeu+ZP6HDt2ocWLOz1fOZNfhSagtbt4QHFlHvdjLEG8t
 iNGIzvrwOTmTN/w/BMpDqPUbtLpRfeRAgzE/XSGU5hlw
X-Google-Smtp-Source: APiQypJhwSTomdaZtFjbOnK4dQzBkSIMoNjO/uvTMoS9iCK7mUxexLxDXb1kSUc2EnvnB9OZEl1Z8vmKzFMuNZf8nBs=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr18136881otr.188.1586176891766; 
 Mon, 06 Apr 2020 05:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000091056b05a2999f1e@google.com>
 <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
 <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
In-Reply-To: <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 6 Apr 2020 14:41:20 +0200
Message-ID: <CAKMK7uE9uQ_YCXfDOH9zQBu_ffoz546hqRd1R_r1+L-T072Lew@mail.gmail.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>,
 syzbot <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Dmitry Vyukov <dvyukov@google.com>
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

On Mon, Apr 6, 2020 at 10:06 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Apr 06, 2020 at 09:07:44AM +0200, Dmitry Vyukov wrote:
> > On Mon, Apr 6, 2020 at 8:46 AM syzbot
> > <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    ffc1c20c Merge tag 'for-5.7/dm-changes' of git://git.kerne..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1690471fe00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a1e2f9a9986236
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=d3a7951ed361037407db
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com
> >
> >
> > +drivers/gpu/drm/virtio/virtgpu_object.c maintainers
> > Now we have both mainline and linux-next boot broken (linux-next is
> > broken for the past 40 days).
> > No testing of new code happens.
> >
> > >  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> > >  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230
>
> Ah, that one.
>
> broken patch: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
> fixed by: 0666a8d7f6a4 ("drm/virtio: fix OOB in virtio_gpu_object_create")
>
> Both are in drm-misc-next.  I suspect the fix was added after
> drm-misc-next was closed for the 5.7 merge window and thus should
> have been submitted to drm-misc-next-fixes instead.
>
> So, what to do now?  Should I cherry-pick 0666a8d7f6a4 into
> drm-misc-next-fixes?  Or should it go into drm-misc-fixes instead?

Yup cherry-pick it over, with -x, to drm-misc-next-fixes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
