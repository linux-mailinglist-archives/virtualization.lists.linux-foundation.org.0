Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBA5FBC9F
	for <lists.virtualization@lfdr.de>; Tue, 11 Oct 2022 23:07:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5466940C17;
	Tue, 11 Oct 2022 21:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5466940C17
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aBODQO+D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoEhuibs0oiA; Tue, 11 Oct 2022 21:07:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 075B840C19;
	Tue, 11 Oct 2022 21:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075B840C19
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 332BCC0078;
	Tue, 11 Oct 2022 21:07:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF1E1C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Oct 2022 21:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A466441913
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Oct 2022 21:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A466441913
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aBODQO+D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGm-Qzirofw9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Oct 2022 21:07:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2835F418D8
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2835F418D8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Oct 2022 21:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665522463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7jGNpzs4w/tQinuiify2q30XV9ycyaHinQp2sXJtMUg=;
 b=aBODQO+DcgdK9K1ylDCXmGTZoDFf8FJ9uEsY/Mg4IdH+wSrRG/lw4hKJRtOo6gW+kHQAWT
 94+2AdxM0MQXQmjg2DggmWeAQFf5lfULfQJ2DGariP5QfhMtKqK+Ze0IvPLcYiYAHxw68r
 J1fmP1+Ie81VxCUcOroftTsksupaIAE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-cRmRhY6XOZqfNCNivqehzg-1; Tue, 11 Oct 2022 17:07:42 -0400
X-MC-Unique: cRmRhY6XOZqfNCNivqehzg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h129-20020a1c2187000000b003bf635eac31so5976784wmh.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Oct 2022 14:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jGNpzs4w/tQinuiify2q30XV9ycyaHinQp2sXJtMUg=;
 b=MPrAdXZS8dDtpgg2tY1a/HRPEjJdihdbYkF03e1D7I1pqw80lnzuSDIdnzVdjreQbf
 Z+IjMq3pasmkp9t/Wikx+9ZUiTNrLm29Da48OCRTcNwQn7RntnGGYRKcttA4ktKsuPG0
 z1Ciw+FY+PQtRrMgN2200VORlMd4WvfSo/mLnnRrNOokgoiAM3Hc8glUnipHiPKzA2DA
 k2cdvq0vskjIT5J7jqMzswY1dSugsOyH97qGvneRdB8OQmDOg05H/DDTq7zhva0zOBDz
 uVGUF4mw1neTiry9U2e7j4WM4BR8OrHBUsT72X17JJpGdCvMmVoASJ7Ums0UCtQPIKoM
 L2bQ==
X-Gm-Message-State: ACrzQf1igHmQZZwlqCwKGk+gC7ydyTIY6c/LY0D6fr4+nyBn5NbIkNOL
 M5UERq9sWvOFr7zPZHY6IJvhxwMmgJJYgbkPTsauEcUxs/EMWdxK9xTmbGO417XlppmnywJSmUs
 TbMs8fQKaKrt9D2NEp2f6qX++3EUsigMCfxEisfF7Uw==
X-Received: by 2002:a5d:6442:0:b0:22e:2c71:fdac with SMTP id
 d2-20020a5d6442000000b0022e2c71fdacmr15322420wrw.243.1665522461364; 
 Tue, 11 Oct 2022 14:07:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5hlaRQESxAKcgPId/wDNNbBzvjQNxungfioS7ihICqpzyV8WXhjiMMmv3l/AuMyDpAFEHUTg==
X-Received: by 2002:a5d:6442:0:b0:22e:2c71:fdac with SMTP id
 d2-20020a5d6442000000b0022e2c71fdacmr15322405wrw.243.1665522461093; 
 Tue, 11 Oct 2022 14:07:41 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 q65-20020a1c4344000000b003a8434530bbsm66705wma.13.2022.10.11.14.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:07:40 -0700 (PDT)
Date: Tue, 11 Oct 2022 17:07:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: syzbot <syzbot+51a652e2d24d53e75734@syzkaller.appspotmail.com>
Subject: Re: [syzbot] upstream boot error: WARNING in cpumask_next_wrap
Message-ID: <20221011170435-mutt-send-email-mst@kernel.org>
References: <0000000000003fac9905eabe4964@google.com>
MIME-Version: 1.0
In-Reply-To: <0000000000003fac9905eabe4964@google.com>
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, edumazet@google.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com,
 virtualization@lists.linux-foundation.org, davem@davemloft.net
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

On Tue, Oct 11, 2022 at 01:44:37AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e2302539dd4f Merge tag 'xtensa-20221010' of https://github..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=105b851a880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1370a7ded58197a2
> dashboard link: https://syzkaller.appspot.com/bug?extid=51a652e2d24d53e75734
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f6eb85afda26/disk-e2302539.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6091bfed3009/vmlinux-e2302539.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+51a652e2d24d53e75734@syzkaller.appspotmail.com


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git d5c59b2d8ff42128b3e8af65d08c47550af1e9a4


> ACPI: button: Sleep Button [SLPF]
> ACPI: \_SB_.LNKC: Enabled at IRQ 11
> virtio-pci 0000:00:03.0: virtio_pci: leaving for legacy driver
> ACPI: \_SB_.LNKD: Enabled at IRQ 10
> virtio-pci 0000:00:04.0: virtio_pci: leaving for legacy driver
> ACPI: \_SB_.LNKB: Enabled at IRQ 10
> virtio-pci 0000:00:06.0: virtio_pci: leaving for legacy driver
> virtio-pci 0000:00:07.0: virtio_pci: leaving for legacy driver
> N_HDLC line discipline registered with maxframe=4096
> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> 00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> 00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
> 00:05: ttyS2 at I/O 0x3e8 (irq = 6, base_baud = 115200) is a 16550A
> 00:06: ttyS3 at I/O 0x2e8 (irq = 7, base_baud = 115200) is a 16550A
> Non-volatile memory driver v1.3
> Linux agpgart interface v0.103
> ACPI: bus type drm_connector registered
> [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
> [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
> Console: switching to colour frame buffer device 128x48
> platform vkms: [drm] fb0: vkmsdrmfb frame buffer device
> usbcore: registered new interface driver udl
> brd: module loaded
> loop: module loaded
> zram: Added device: zram0
> null_blk: disk nullb0 created
> null_blk: module loaded
> Guest personality initialized and is inactive
> VMCI host device registered (name=vmci, major=10, minor=120)
> Initialized host personality
> usbcore: registered new interface driver rtsx_usb
> usbcore: registered new interface driver viperboard
> usbcore: registered new interface driver dln2
> usbcore: registered new interface driver pn533_usb
> nfcsim 0.2 initialized
> usbcore: registered new interface driver port100
> usbcore: registered new interface driver nfcmrvl
> Loading iSCSI transport class v2.0-870.
> scsi host0: Virtio SCSI HBA
> st: Version 20160209, fixed bufsize 32768, s/g segs 256
> Rounding down aligned max_sectors from 4294967295 to 4294967288
> db_root: cannot open: /etc/target
> slram: not enough parameters.
> ftl_cs: FTL header not found.
> wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
> wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> eql: Equalizer2002: Simon Janes (simon@ncm.com) and David S. Miller (davem@redhat.com)
> MACsec IEEE 802.1AE
> tun: Universal TUN/TAP device driver, 1.6
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpumask_check include/linux/cpumask.h:117 [inline]
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpumask_next include/linux/cpumask.h:178 [inline]
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpumask_next_wrap+0x11c/0x1c0 lib/cpumask.c:27
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-syzkaller-10145-ge2302539dd4f #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
> RIP: 0010:cpu_max_bits_warn include/linux/cpumask.h:110 [inline]
> RIP: 0010:cpumask_check include/linux/cpumask.h:117 [inline]
> RIP: 0010:cpumask_next include/linux/cpumask.h:178 [inline]
> RIP: 0010:cpumask_next_wrap+0x11c/0x1c0 lib/cpumask.c:27
> Code: a6 00 00 00 e8 b5 34 62 f7 48 8b 04 24 41 bd ff ff ff ff 45 31 e4 48 b9 00 00 00 00 00 fc ff df e9 39 ff ff ff e8 94 34 62 f7 <0f> 0b e9 59 ff ff ff 48 c7 c1 b8 f2 0c 8e 80 e1 07 80 c1 03 38 c1
> RSP: 0000:ffffc90000067218 EFLAGS: 00010293
> RAX: ffffffff8a255bdc RBX: 0000000000000002 RCX: ffff888012278000
> RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000002
> RBP: 0000000000000002 R08: ffffffff8a255b2f R09: fffff5200000ce5d
> R10: fffff5200000ce5d R11: 1ffff9200000ce5c R12: 0000000000000001
> R13: 0000000000000001 R14: 1ffffffff1c19e57 R15: 0000000000000002
> FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff88823ffff000 CR3: 000000000c88e000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  virtnet_set_affinity+0x2be/0x6f0 drivers/net/virtio_net.c:2303
>  init_vqs+0x107c/0x11d0 drivers/net/virtio_net.c:3581
>  virtnet_probe+0x198d/0x3120 drivers/net/virtio_net.c:3884
>  virtio_dev_probe+0x8ca/0xb60 drivers/virtio/virtio.c:305
>  call_driver_probe+0x96/0x250
>  really_probe+0x24c/0x9f0 drivers/base/dd.c:639
>  __driver_probe_device+0x1f4/0x3f0 drivers/base/dd.c:778
>  driver_probe_device+0x50/0x240 drivers/base/dd.c:808
>  __driver_attach+0x364/0x5b0 drivers/base/dd.c:1190
>  bus_for_each_dev+0x168/0x1d0 drivers/base/bus.c:301
>  bus_add_driver+0x32f/0x600 drivers/base/bus.c:618
>  driver_register+0x2e9/0x3e0 drivers/base/driver.c:246
>  virtio_net_driver_init+0x8e/0xcb drivers/net/virtio_net.c:4090
>  do_one_initcall+0x1c9/0x400 init/main.c:1295
>  do_initcall_level+0x168/0x218 init/main.c:1368
>  do_initcalls+0x4b/0x8c init/main.c:1384
>  kernel_init_freeable+0x3f1/0x57b init/main.c:1622
>  kernel_init+0x19/0x2b0 init/main.c:1511
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
