Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D85FFBD1
	for <lists.virtualization@lfdr.de>; Sat, 15 Oct 2022 21:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FDC410A4;
	Sat, 15 Oct 2022 19:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9FDC410A4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsk65+es
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VprrgTA3TIVX; Sat, 15 Oct 2022 19:51:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 896A7409BE;
	Sat, 15 Oct 2022 19:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896A7409BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C44E7C0078;
	Sat, 15 Oct 2022 19:51:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8617FC002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Oct 2022 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9A240647
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Oct 2022 19:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F9A240647
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsk65+es
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIod4EZLjJNl
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Oct 2022 19:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80A5B405E8
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80A5B405E8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Oct 2022 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665863460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3dmRoCAbvHyB4s1yUnRmBVS7aeUXJ2qzFIadydzCF9Q=;
 b=hsk65+es2cF9qwbk8nIOfWbGcmPqIr7Blo7BEybT38iUfZ6llSPhIosoOk4/KSJt9lTII0
 ryhGxr4n19XKqapuxnJ4tbWB5E78Nh5hGtN9qwpydo25GwHFxZqQKFyNufWy/WpnhLcxk3
 R7SiHtaS9+VLi9fZtqdasFEF1iN9Ly4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-bRF56sIpMwmJMCrtBfYGpQ-1; Sat, 15 Oct 2022 15:50:59 -0400
X-MC-Unique: bRF56sIpMwmJMCrtBfYGpQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso6496807edd.1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Oct 2022 12:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dmRoCAbvHyB4s1yUnRmBVS7aeUXJ2qzFIadydzCF9Q=;
 b=FdR58E8pG/mwV52HbDfI1XLiVJq2oHEHLcQOhfo0KOSWmYYoWOPWOEOCafEI6g7Qju
 38zl8cIppjfvcF1VmJXxa0//gAqaSbYMhkvBL+Pisx/5eT4xAryHchvZZ1bh7f7LAsdU
 V2iAp3aPI6zOgRJnKyt3GrqXXH3D0Jkx7JXj3KRovpy+wXyd5UT16koayXfnGLEre3Y3
 GhfLqYiLHBeXDPlExbbY6G/zXeh1k16qqwMH0PBgVChDtMt1mmolAtwut4vAAUPoate/
 UOX2D5CNjQ9XKSPHPwze7gZUArSHibT6pvUPSTpo2RRhO7IsksSVEZ5pYIk0+WkBjR4j
 JTMw==
X-Gm-Message-State: ACrzQf2Q6eCfOPNjZKNTV2Qiny7nChmPkgwe6qJgc2/992VVg7eEk02b
 P/O82ksnz6Q4wzXS5C5MeqAfKTQ3l7wkWi6jOJhlEfrGQ7PIih64AW2TMxbZcJW2tftvYYvu1Gy
 d/LOpA+JGuDG9dbLTMyuhBA+S9Z3pg1qGCjNxHD94OQ==
X-Received: by 2002:a17:907:a073:b0:78d:51c4:5b8c with SMTP id
 ia19-20020a170907a07300b0078d51c45b8cmr2977997ejc.355.1665863458234; 
 Sat, 15 Oct 2022 12:50:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zlYvw9Wjs/reSHlqd3kKSBJ/ieaWY3Yf6XVCWg5t5vNB1U7SZKx76+1tHWkWJzFWg+DDkuQ==
X-Received: by 2002:a17:907:a073:b0:78d:51c4:5b8c with SMTP id
 ia19-20020a170907a07300b0078d51c45b8cmr2977972ejc.355.1665863457880; 
 Sat, 15 Oct 2022 12:50:57 -0700 (PDT)
Received: from redhat.com ([2.54.171.110]) by smtp.gmail.com with ESMTPSA id
 m3-20020a17090679c300b0077909095acasm3564039ejo.143.2022.10.15.12.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 12:50:57 -0700 (PDT)
Date: Sat, 15 Oct 2022 15:50:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: syzbot <syzbot+4d0c5794bff07852726c@syzkaller.appspotmail.com>
Subject: Re: [syzbot] net boot error: WARNING in cpumask_next_wrap
Message-ID: <20221015154817-mutt-send-email-mst@kernel.org>
References: <000000000000f4b06105eb17a6c8@google.com>
MIME-Version: 1.0
In-Reply-To: <000000000000f4b06105eb17a6c8@google.com>
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

On Sat, Oct 15, 2022 at 12:21:41PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a1b6b102df03 Merge branch 'phylink_set_mac_pm'
> git tree:       net
> console output: https://syzkaller.appspot.com/x/log.txt?x=179af0c2880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=85495c44a2c25446
> dashboard link: https://syzkaller.appspot.com/bug?extid=4d0c5794bff07852726c
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/d67c9cef7c77/disk-a1b6b102.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/708d1f638584/vmlinux-a1b6b102.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+4d0c5794bff07852726c@syzkaller.appspotmail.com
> 
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
> VMCI host device registered (name=vmci, major=10, minor=119)
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
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpu_max_bits_warn include/linux/cpumask.h:110 [inline]
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpumask_check include/linux/cpumask.h:117 [inline]
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpumask_next include/linux/cpumask.h:178 [inline]
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 cpumask_next_wrap+0x139/0x1d0 lib/cpumask.c:27
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-syzkaller-11847-ga1b6b102df03 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
> RIP: 0010:cpu_max_bits_warn include/linux/cpumask.h:110 [inline]
> RIP: 0010:cpumask_check include/linux/cpumask.h:117 [inline]
> RIP: 0010:cpumask_next include/linux/cpumask.h:178 [inline]
> RIP: 0010:cpumask_next_wrap+0x139/0x1d0 lib/cpumask.c:27
> Code: df e8 8b 4a 3d f8 39 eb 77 64 e8 32 4e 3d f8 41 8d 6c 24 01 89 de 89 ef e8 74 4a 3d f8 39 dd 0f 82 54 ff ff ff e8 17 4e 3d f8 <0f> 0b e9 48 ff ff ff e8 0b 4e 3d f8 48 c7 c2 00 02 e2 8d 48 b8 00
> RSP: 0000:ffffc90000067920 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
> RDX: ffff88813fe50000 RSI: ffffffff893f1c59 RDI: 0000000000000004
> RBP: 0000000000000002 R08: 0000000000000004 R09: 0000000000000002
> R10: 0000000000000002 R11: 0000000000000000 R12: 0000000000000001
> R13: 0000000000000000 R14: 0000000000000002 R15: ffffffff8de20010
> FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff88823ffff000 CR3: 000000000bc8e000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  virtnet_set_affinity+0x35a/0x750 drivers/net/virtio_net.c:2303
>  init_vqs drivers/net/virtio_net.c:3581 [inline]
>  init_vqs drivers/net/virtio_net.c:3567 [inline]
>  virtnet_probe+0x12ae/0x31e0 drivers/net/virtio_net.c:3884
>  virtio_dev_probe+0x577/0x870 drivers/virtio/virtio.c:305
>  call_driver_probe drivers/base/dd.c:560 [inline]
>  really_probe+0x249/0xb90 drivers/base/dd.c:639
>  __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:778
>  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:808
>  __driver_attach+0x1d0/0x550 drivers/base/dd.c:1190
>  bus_for_each_dev+0x147/0x1d0 drivers/base/bus.c:301
>  bus_add_driver+0x4c9/0x640 drivers/base/bus.c:618
>  driver_register+0x220/0x3a0 drivers/base/driver.c:246
>  virtio_net_driver_init+0x93/0xd2 drivers/net/virtio_net.c:4090
>  do_one_initcall+0x13d/0x780 init/main.c:1303
>  do_initcall_level init/main.c:1376 [inline]
>  do_initcalls init/main.c:1392 [inline]
>  do_basic_setup init/main.c:1411 [inline]
>  kernel_init_freeable+0x6ff/0x788 init/main.c:1631
>  kernel_init+0x1a/0x1d0 init/main.c:1519
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
>  </TASK>


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git net


figure out why is syzbot triggering warnings

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/net/virtio_net.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 7106932c6f88..3c1c16b43bbd 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2295,13 +2295,20 @@ static void virtnet_set_affinity(struct virtnet_info *vi)
 			0;
 	cpu = cpumask_first(cpu_online_mask);
 
+	printk(KERN_ERR "%s +%d : %s cpu %d num %d stride %d stragglers %d\n",
+	       __FILE__, __LINE__, __func__, cpu, num_cpu, stride, stragglers);
+
 	for (i = 0; i < vi->curr_queue_pairs; i++) {
 		group_size = stride + (i < stragglers ? 1 : 0);
+		printk(KERN_ERR "%s +%d : %s vq %d group_size %d",
+		       __FILE__, __LINE__, __func__, i, group_size);
 
 		for (j = 0; j < group_size; j++) {
 			cpumask_set_cpu(cpu, mask);
 			cpu = cpumask_next_wrap(cpu, cpu_online_mask,
 						nr_cpu_ids, false);
+			printk(KERN_ERR "%s +%d : %s groupindex %d cpu %d",
+			       __FILE__, __LINE__, __func__, j, group_size);
 		}
 		virtqueue_set_affinity(vi->rq[i].vq, mask);
 		virtqueue_set_affinity(vi->sq[i].vq, mask);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
