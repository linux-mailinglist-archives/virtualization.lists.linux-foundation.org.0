Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A61A8A12
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 20:47:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C91A421546;
	Tue, 14 Apr 2020 18:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TLDNmlxTcn2; Tue, 14 Apr 2020 18:47:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 88DD1204D8;
	Tue, 14 Apr 2020 18:47:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D08FC0172;
	Tue, 14 Apr 2020 18:47:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4E02C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 18:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B017086B0E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 18:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHJt-kZv+rfs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 18:47:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 820EE8646F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 18:47:53 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z26so911120ljz.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyOL12OCCuEtnIYwyab7jevzcvgkgia9hHwlqC2b/cU=;
 b=PZAoOw3NbV+FJtp3dr1j+nlatrdGdulU5pItNLclPyjrhf7CyG6zlAVQxY50b0EpDU
 ebHHUI0nLMYLiUaEy8qSIayJglSY+JSBhsG0RoJFCif1nbPg6XUYMtIPrzwEd6L21B6D
 eMiaPOblgIGOqBJWeooWrfL6SvkGQAaOTSNNO6Lp9XtIHez2UrZ1ZWIaNMyXBhnjPbaL
 lLFX2CPaZzf0IfFjObpAbweT8dY+tjxm0VLbPnMFpyGtwNx+9HjbD/0dWLjUqNnUuI1u
 tiv9RMd+lEZFWKv+bI4SS+IkGpaqRpALLHCWMd+xjGN1t+ibMC4JzxMkPXthqEoK9N5E
 2Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OyOL12OCCuEtnIYwyab7jevzcvgkgia9hHwlqC2b/cU=;
 b=dMyygoVjzrHNNXUeSTvfpB+QD1j90Y3/61XcGldF1asbaYiIb2qWba7cH6FBx7wFGG
 ltLqV0GlDSEHuXeejqEymIO7IswhgGUn6YJxUiLna0GTnTDvVD4Wq07+pMzkaQb0ywTD
 zF+6wkFqXPrO3wcvmweZes8mMjtIgM4XFLeG90IIetmsp6xUDCdLT6lBhILEwqduIA3b
 uZzoHxC1JMn2Xfg0Sz2KXwlErDjtSElwcyIvHqDGOLx8lcOa98vCjmfvP1Bnwa1eAomR
 BrNHORaQYnDUkDb8CcAnYJm8fISLPAobQxtIs9YNZdBsM9m68EkO3ok1pzuWt4+NnLj/
 NfYQ==
X-Gm-Message-State: AGi0PuYxll3/gN2RBb6xZNS95vvDW7iQAiDqXsyTrMEpzh2DnqgL8yZh
 xmZYOxyMUCBcQPDVJlaW9oq/xpbUoK1Mjg==
X-Google-Smtp-Source: APiQypIU0nDoVIJ/vdOxOcyArNCl8ozzP3P/YWU0FeKyu7KGGin9pZl2KpekHTeHZOvoDagifSazJQ==
X-Received: by 2002:a2e:a308:: with SMTP id l8mr917166lje.282.1586890070861;
 Tue, 14 Apr 2020 11:47:50 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id p2sm2029433lji.40.2020.04.14.11.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:47:50 -0700 (PDT)
From: andrew@daynix.com
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2] Fix: buffer overflow during hvc_alloc().
Date: Tue, 14 Apr 2020 22:15:03 +0300
Message-Id: <20200414191503.3471783-1-andrew@daynix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jslaby@suse.com
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

From: Andrew Melnychenko <andrew@daynix.com>

If there is a lot(more then 16) of virtio-console devices
or virtio_console module is reloaded
- buffers 'vtermnos' and 'cons_ops' are overflowed.
In older kernels it overruns spinlock which leads to kernel freezing:
https://bugzilla.redhat.com/show_bug.cgi?id=1786239

To reproduce the issue, you can try simple script that
loads/unloads module. Something like this:
while [ 1 ]
do
  modprobe virtio_console
  sleep 2
  modprobe -r virtio_console
  sleep 2
done

Description of problem:
Guest get 'Call Trace' when loading module "virtio_console"
and unloading it frequently - clearly reproduced on kernel-4.18.0:

[   81.498208] ------------[ cut here ]------------
[   81.499263] pvqspinlock: lock 0xffffffff92080020 has corrupted value 0xc0774ca0!
[   81.501000] WARNING: CPU: 0 PID: 785 at kernel/locking/qspinlock_paravirt.h:500 __pv_queued_spin_unlock_slowpath+0xc0/0xd0
[   81.503173] Modules linked in: virtio_console fuse xt_CHECKSUM ipt_MASQUERADE xt_conntrack ipt_REJECT nft_counter nf_nat_tftp nft_objref nf_conntrack_tftp tun bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_tables_set nft_chain_nat_ipv6 nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 nft_chain_route_ipv6 nft_chain_nat_ipv4 nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack nft_chain_route_ipv4 ip6_tables nft_compat ip_set nf_tables nfnetlink sunrpc bochs_drm drm_vram_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm i2c_piix4 pcspkr crct10dif_pclmul crc32_pclmul joydev ghash_clmulni_intel ip_tables xfs libcrc32c sd_mod sg ata_generic ata_piix virtio_net libata crc32c_intel net_failover failover serio_raw virtio_scsi dm_mirror dm_region_hash dm_log dm_mod [last unloaded: virtio_console]
[   81.517019] CPU: 0 PID: 785 Comm: kworker/0:2 Kdump: loaded Not tainted 4.18.0-167.el8.x86_64 #1
[   81.518639] Hardware name: Red Hat KVM, BIOS 1.12.0-5.scrmod+el8.2.0+5159+d8aa4d83 04/01/2014
[   81.520205] Workqueue: events control_work_handler [virtio_console]
[   81.521354] RIP: 0010:__pv_queued_spin_unlock_slowpath+0xc0/0xd0
[   81.522450] Code: 07 00 48 63 7a 10 e8 bf 64 f5 ff 66 90 c3 8b 05 e6 cf d6 01 85 c0 74 01 c3 8b 17 48 89 fe 48 c7 c7 38 4b 29 91 e8 3a 6c fa ff <0f> 0b c3 0f 0b 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 48
[   81.525830] RSP: 0018:ffffb51a01ffbd70 EFLAGS: 00010282
[   81.526798] RAX: 0000000000000000 RBX: 0000000000000010 RCX: 0000000000000000
[   81.528110] RDX: ffff9e66f1826480 RSI: ffff9e66f1816a08 RDI: ffff9e66f1816a08
[   81.529437] RBP: ffffffff9153ff10 R08: 000000000000026c R09: 0000000000000053
[   81.530732] R10: 0000000000000000 R11: ffffb51a01ffbc18 R12: ffff9e66cd682200
[   81.532133] R13: ffffffff9153ff10 R14: ffff9e6685569500 R15: ffff9e66cd682000
[   81.533442] FS:  0000000000000000(0000) GS:ffff9e66f1800000(0000) knlGS:0000000000000000
[   81.534914] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   81.535971] CR2: 00005624c55b14d0 CR3: 00000003a023c000 CR4: 00000000003406f0
[   81.537283] Call Trace:
[   81.537763]  __raw_callee_save___pv_queued_spin_unlock_slowpath+0x11/0x20
[   81.539011]  .slowpath+0x9/0xe
[   81.539585]  hvc_alloc+0x25e/0x300
[   81.540237]  init_port_console+0x28/0x100 [virtio_console]
[   81.541251]  handle_control_message.constprop.27+0x1c4/0x310 [virtio_console]
[   81.542546]  control_work_handler+0x70/0x10c [virtio_console]
[   81.543601]  process_one_work+0x1a7/0x3b0
[   81.544356]  worker_thread+0x30/0x390
[   81.545025]  ? create_worker+0x1a0/0x1a0
[   81.545749]  kthread+0x112/0x130
[   81.546358]  ? kthread_flush_work_fn+0x10/0x10
[   81.547183]  ret_from_fork+0x22/0x40
[   81.547842] ---[ end trace aa97649bd16c8655 ]---
[   83.546539] general protection fault: 0000 [#1] SMP NOPTI
[   83.547422] CPU: 5 PID: 3225 Comm: modprobe Kdump: loaded Tainted: G        W        --------- -  - 4.18.0-167.el8.x86_64 #1
[   83.549191] Hardware name: Red Hat KVM, BIOS 1.12.0-5.scrmod+el8.2.0+5159+d8aa4d83 04/01/2014
[   83.550544] RIP: 0010:__pv_queued_spin_lock_slowpath+0x19a/0x2a0
[   83.551504] Code: c4 c1 ea 12 41 be 01 00 00 00 4c 8d 6d 14 41 83 e4 03 8d 42 ff 49 c1 e4 05 48 98 49 81 c4 40 a5 02 00 4c 03 24 c5 60 48 34 91 <49> 89 2c 24 b8 00 80 00 00 eb 15 84 c0 75 0a 41 0f b6 54 24 14 84
[   83.554449] RSP: 0018:ffffb51a0323fdb0 EFLAGS: 00010202
[   83.555290] RAX: 000000000000301c RBX: ffffffff92080020 RCX: 0000000000000001
[   83.556426] RDX: 000000000000301d RSI: 0000000000000000 RDI: 0000000000000000
[   83.557556] RBP: ffff9e66f196a540 R08: 000000000000028a R09: ffff9e66d2757788
[   83.558688] R10: 0000000000000000 R11: 0000000000000000 R12: 646e61725f770b07
[   83.559821] R13: ffff9e66f196a554 R14: 0000000000000001 R15: 0000000000180000
[   83.560958] FS:  00007fd5032e8740(0000) GS:ffff9e66f1940000(0000) knlGS:0000000000000000
[   83.562233] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   83.563149] CR2: 00007fd5022b0da0 CR3: 000000038c334000 CR4: 00000000003406e0

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 drivers/tty/hvc/hvc_console.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 27284a2dcd2b..436cc51c92c3 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -302,10 +302,6 @@ int hvc_instantiate(uint32_t vtermno, int index, const struct hv_ops *ops)
 	vtermnos[index] = vtermno;
 	cons_ops[index] = ops;
 
-	/* reserve all indices up to and including this index */
-	if (last_hvc < index)
-		last_hvc = index;
-
 	/* check if we need to re-register the kernel console */
 	hvc_check_console(index);
 
@@ -960,13 +956,22 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 		    cons_ops[i] == hp->ops)
 			break;
 
-	/* no matching slot, just use a counter */
-	if (i >= MAX_NR_HVC_CONSOLES)
-		i = ++last_hvc;
+	if (i >= MAX_NR_HVC_CONSOLES) {
+
+		/* find 'empty' slot for console */
+		for (i = 0; i < MAX_NR_HVC_CONSOLES && vtermnos[i] != -1; i++) {
+		}
+
+		/* no matching slot, just use a counter */
+		if (i == MAX_NR_HVC_CONSOLES)
+			i = ++last_hvc + MAX_NR_HVC_CONSOLES;
+	}
 
 	hp->index = i;
-	cons_ops[i] = ops;
-	vtermnos[i] = vtermno;
+	if (i < MAX_NR_HVC_CONSOLES) {
+		cons_ops[i] = ops;
+		vtermnos[i] = vtermno;
+	}
 
 	list_add_tail(&(hp->next), &hvc_structs);
 	mutex_unlock(&hvc_structs_mutex);
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
