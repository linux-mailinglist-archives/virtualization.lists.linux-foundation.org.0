Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C96A4B99E8
	for <lists.virtualization@lfdr.de>; Thu, 17 Feb 2022 08:36:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAEF417CB;
	Thu, 17 Feb 2022 07:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ut-i8SmWLfLY; Thu, 17 Feb 2022 07:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 41044417F1;
	Thu, 17 Feb 2022 07:36:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7387C0073;
	Thu, 17 Feb 2022 07:36:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A2F4C0011
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 07:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55E16417CB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 07:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dHGg4NwHqWq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 07:36:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 617FD4179E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645083390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bq+NHZE+jznU+dhvIHD6fC4B3O2CbnzIw/Hk9O1eGZs=;
 b=KwSN7FMIyHdMZyaZShqrpkqtXDs1+zBB28exA2UhcisTovp8vFTkKGg6gitYHjKC6/M+hA
 mG5VCDCNWqh5egiLKtxaTvLv5yq326dgXJS1wsCp2lYaMMamko/aRmvHkk+0OcGEbJFNvQ
 eGTKdQ17nIs7Lv41KdbaLDsQ+48YfsU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-QdYvE6S0Ohq99y0r1j07kA-1; Thu, 17 Feb 2022 02:36:29 -0500
X-MC-Unique: QdYvE6S0Ohq99y0r1j07kA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k3-20020adfb343000000b001e463e6af20so1919725wrd.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Feb 2022 23:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bq+NHZE+jznU+dhvIHD6fC4B3O2CbnzIw/Hk9O1eGZs=;
 b=AcXOe1jI/Yy6N38TwddtsP1Jn1s2oLqRJTU8/QhZ2GQAwhmxBo78g444BTvaAsdL83
 1s9OMtznRtgjmlZCAjNzVzjOg4E+K5g2Vhj/LmuhZaOFP+pyGcc5qGRHOzGJdU76pBod
 2VR0ULZJ8U8tEjJfYV97tv/1s0Mvt5f56n4OaqIyGFJVa9m5bu7GcJF/8w2lhDTE/wY3
 ykHY4iIf5KVM3qQ1liitOA6TBYMzJ3ZLOpN3FLNC0OlclKP2/5q4c1fmFpP99/n1lWcj
 xdtGFNT7YRSG7rdb4XpoD/xkjHIwqLu1+QWYnumgVumnYaIcqgc5UZgU1hPdRP+YclFM
 Ht2w==
X-Gm-Message-State: AOAM5336xScBXgNFq3fnWVkodejXnX3gDoPzqxF0EfZikEy/VI8H/NEh
 T/tUXXFXSJK0Twc38sTEPsCPBTK1qmEZdWOZzcl7Oe1atkKDup7sOVBZtqapE+CUm0Ih88CmLK2
 wHIHi902a8rghcBWyvrFhqQ/ftXefAqf9FVIVpyk6Ig==
X-Received: by 2002:a5d:6804:0:b0:1e3:23df:c61 with SMTP id
 w4-20020a5d6804000000b001e323df0c61mr1233731wru.245.1645083386975; 
 Wed, 16 Feb 2022 23:36:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdJvGEkdSHkMj5s4SEJt1j2snqB61uskMtGHC9Ap0eJHnsi+IrUan5dSS5T1W6TyU9f5CXhg==
X-Received: by 2002:a5d:6804:0:b0:1e3:23df:c61 with SMTP id
 w4-20020a5d6804000000b001e323df0c61mr1233713wru.245.1645083386756; 
 Wed, 16 Feb 2022 23:36:26 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id r1sm317876wme.3.2022.02.16.23.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 23:36:26 -0800 (PST)
Date: Thu, 17 Feb 2022 02:36:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [syzbot] WARNING in vhost_dev_cleanup (2)
Message-ID: <20220217023550-mutt-send-email-mst@kernel.org>
References: <0000000000006f656005d82d24e2@google.com>
 <CACGkMEsyWBBmx3g613tr97nidHd3-avMyO=WRxS8RpcEk7j2=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsyWBBmx3g613tr97nidHd3-avMyO=WRxS8RpcEk7j2=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: syzbot <syzbot+1e3ea63db39f2b4440e0@syzkaller.appspotmail.com>,
 kvm <kvm@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Thu, Feb 17, 2022 at 03:34:13PM +0800, Jason Wang wrote:
> On Thu, Feb 17, 2022 at 10:01 AM syzbot
> <syzbot+1e3ea63db39f2b4440e0@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    c5d9ae265b10 Merge tag 'for-linus' of git://git.kernel.org..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=132e687c700000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a78b064590b9f912
> > dashboard link: https://syzkaller.appspot.com/bug?extid=1e3ea63db39f2b4440e0
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+1e3ea63db39f2b4440e0@syzkaller.appspotmail.com
> >
> > WARNING: CPU: 1 PID: 10828 at drivers/vhost/vhost.c:715 vhost_dev_cleanup+0x8b8/0xbc0 drivers/vhost/vhost.c:715
> > Modules linked in:
> > CPU: 0 PID: 10828 Comm: syz-executor.0 Not tainted 5.17.0-rc4-syzkaller-00051-gc5d9ae265b10 #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > RIP: 0010:vhost_dev_cleanup+0x8b8/0xbc0 drivers/vhost/vhost.c:715
> 
> Probably a hint that we are missing a flush.
> 
> Looking at vhost_vsock_stop() that is called by vhost_vsock_dev_release():
> 
> static int vhost_vsock_stop(struct vhost_vsock *vsock)
> {
> size_t i;
>         int ret;
> 
>         mutex_lock(&vsock->dev.mutex);
> 
>         ret = vhost_dev_check_owner(&vsock->dev);
>         if (ret)
>                 goto err;
> 
> Where it could fail so the device is not actually stopped.
> 
> I wonder if this is something related.
> 
> Thanks


But then if that is not the owner then no work should be running, right?


> 
> > Code: c7 85 90 01 00 00 00 00 00 00 e8 53 6e a2 fa 48 89 ef 48 83 c4 20 5b 5d 41 5c 41 5d 41 5e 41 5f e9 7d d6 ff ff e8 38 6e a2 fa <0f> 0b e9 46 ff ff ff 48 8b 7c 24 10 e8 87 00 ea fa e9 75 f7 ff ff
> > RSP: 0018:ffffc9000fe6fa18 EFLAGS: 00010293
> > RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
> > RDX: ffff888021b63a00 RSI: ffffffff86d66fe8 RDI: ffff88801cc200b0
> > RBP: ffff88801cc20000 R08: 0000000000000001 R09: 0000000000000001
> > R10: ffffffff817f1e08 R11: 0000000000000000 R12: ffff88801cc200d0
> > R13: ffff88801cc20120 R14: ffff88801cc200d0 R15: 0000000000000002
> > FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000001b2de25000 CR3: 000000004c9cd000 CR4: 00000000003506f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  vhost_vsock_dev_release+0x36e/0x4b0 drivers/vhost/vsock.c:771
> >  __fput+0x286/0x9f0 fs/file_table.c:313
> >  task_work_run+0xdd/0x1a0 kernel/task_work.c:164
> >  exit_task_work include/linux/task_work.h:32 [inline]
> >  do_exit+0xb29/0x2a30 kernel/exit.c:806
> >  do_group_exit+0xd2/0x2f0 kernel/exit.c:935
> >  get_signal+0x45a/0x2490 kernel/signal.c:2863
> >  arch_do_signal_or_restart+0x2a9/0x1c40 arch/x86/kernel/signal.c:868
> >  handle_signal_work kernel/entry/common.c:148 [inline]
> >  exit_to_user_mode_loop kernel/entry/common.c:172 [inline]
> >  exit_to_user_mode_prepare+0x17d/0x290 kernel/entry/common.c:207
> >  __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
> >  syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
> >  do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > RIP: 0033:0x7f4027a46481
> > Code: Unable to access opcode bytes at RIP 0x7f4027a46457.
> > RSP: 002b:00007f402808ba68 EFLAGS: 00000206 ORIG_RAX: 0000000000000038
> > RAX: fffffffffffffffc RBX: 00007f402622e700 RCX: 00007f4027a46481
> > RDX: 00007f402622e9d0 RSI: 00007f402622e2f0 RDI: 00000000003d0f00
> > RBP: 00007f402808bcb0 R08: 00007f402622e700 R09: 00007f402622e700
> > R10: 00007f402622e9d0 R11: 0000000000000206 R12: 00007f402808bb1e
> > R13: 00007f402808bb1f R14: 00007f402622e300 R15: 0000000000022000
> >  </TASK>
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
