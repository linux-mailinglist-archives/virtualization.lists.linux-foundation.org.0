Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 654942272C
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:18:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB170C21;
	Sun, 19 May 2019 16:17:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F26CF25DB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  1 May 2019 00:30:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com
	[209.85.222.74])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2CFC170D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  1 May 2019 00:30:05 +0000 (UTC)
Received: by mail-ua1-f74.google.com with SMTP id i10so2177316uak.20
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 17:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=rvnnbDmsOgJ3xr/PffPc0gbHg8YSZc9QHWS8F5/zrz0=;
	b=ouhDZAWcHKtKyngvM68oiibCChzMbcqbVGPz4YuQdwYUPFM4ynjce1cPHtBKp+HrJh
	SHEg0bopCTTpmijYzKAlX8Hcvt4WTS9mmBRQwZ7OrOC4nW18Hc8PgqA88LbKdWg67BtN
	22pvwxMyiNDPQkTaWYwf3FnpZXnWVlDML2Inls7H2lUgAccqN5vm2Ya7DA8PVn9h21Ui
	zEvGZzs13JPe3YwreavZZvdN4kH5gkrMGNsTmYTqYOKpf1gFMDSlKxTfZvtf/bwAXEBG
	lGz9Vp/KNDxebfL8M2UvekoKUhgIq86pq8LiZF629VUUGzYosazpZdvAB0/NWRarQ9aI
	QFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=rvnnbDmsOgJ3xr/PffPc0gbHg8YSZc9QHWS8F5/zrz0=;
	b=MCnnt6JjKqmIPOt1f+LzAarV7CmxgctPGgtfqCVzh5t2z2u3NfeqKLp98S6SLMFGcj
	DvS8UZKuK0drdv+UAbHoPHl4zPGQZI1dv603ltF6D39ZQK6s0397gIWm/x7yAaRu8r3R
	yEGMsW52wAPs/LTtFpWguZuuqvXZKMWeS5QZWHdq91gcRpp2926/ZXcgqREjo1pcWyER
	Ka3h6o7uEMeqDGGxrGhYk+oaXj0++by8F6OC+xL850NsitvsYrxJrmVaosSNOa7XNEEG
	JVHdS0yqXL6dMVBArJ7e9vGO5pEMg9f10MyK90Hupz3Bkir5B5kj4JrGaMajzPj3NK9I
	DC5w==
X-Gm-Message-State: APjAAAXp412VPDc2TQvS2yFUIs8tPSmt79r0G/jAEYfBgJ3cjv0QG2F/
	zMwEugAsP84NKS7xkcqMW29L6yDq5+JMIfE=
X-Google-Smtp-Source: APXvYqxS/RD69FJkWFky/f1r4LGDC/KcN/ZgqbnWKDp6CV3L9ulYeepm2htYaXuH9V02y1lY6qy0VpnQ+LgxkHE=
X-Received: by 2002:a67:f695:: with SMTP id n21mr2835367vso.19.1556670604001; 
	Tue, 30 Apr 2019 17:30:04 -0700 (PDT)
Date: Tue, 30 Apr 2019 17:30:01 -0700
Message-Id: <20190501003001.186239-1-jemoreira@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH] vsock/virtio: Initialize core virtio vsock before registering
	the driver
To: linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>, kernel-team@android.com,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: "Jorge E. Moreira via Virtualization"
	<virtualization@lists.linux-foundation.org>
Reply-To: "Jorge E. Moreira" <jemoreira@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Avoid a race in which static variables in net/vmw_vsock/af_vsock.c are
accessed (while handling interrupts) before they are initialized.

[    4.201410] BUG: unable to handle kernel paging request at ffffffffffffffe8
[    4.207829] IP: vsock_addr_equals_addr+0x3/0x20
[    4.211379] PGD 28210067 P4D 28210067 PUD 28212067 PMD 0
[    4.211379] Oops: 0000 [#1] PREEMPT SMP PTI
[    4.211379] Modules linked in:
[    4.211379] CPU: 1 PID: 30 Comm: kworker/1:1 Not tainted 4.14.106-419297-gd7e28cc1f241 #1
[    4.211379] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
[    4.211379] Workqueue: virtio_vsock virtio_transport_rx_work
[    4.211379] task: ffffa3273d175280 task.stack: ffffaea1800e8000
[    4.211379] RIP: 0010:vsock_addr_equals_addr+0x3/0x20
[    4.211379] RSP: 0000:ffffaea1800ebd28 EFLAGS: 00010286
[    4.211379] RAX: 0000000000000002 RBX: 0000000000000000 RCX: ffffffffb94e42f0
[    4.211379] RDX: 0000000000000400 RSI: ffffffffffffffe0 RDI: ffffaea1800ebdd0
[    4.211379] RBP: ffffaea1800ebd58 R08: 0000000000000001 R09: 0000000000000001
[    4.211379] R10: 0000000000000000 R11: ffffffffb89d5d60 R12: ffffaea1800ebdd0
[    4.211379] R13: 00000000828cbfbf R14: 0000000000000000 R15: ffffaea1800ebdc0
[    4.211379] FS:  0000000000000000(0000) GS:ffffa3273fd00000(0000) knlGS:0000000000000000
[    4.211379] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.211379] CR2: ffffffffffffffe8 CR3: 000000002820e001 CR4: 00000000001606e0
[    4.211379] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    4.211379] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    4.211379] Call Trace:
[    4.211379]  ? vsock_find_connected_socket+0x6c/0xe0
[    4.211379]  virtio_transport_recv_pkt+0x15f/0x740
[    4.211379]  ? detach_buf+0x1b5/0x210
[    4.211379]  virtio_transport_rx_work+0xb7/0x140
[    4.211379]  process_one_work+0x1ef/0x480
[    4.211379]  worker_thread+0x312/0x460
[    4.211379]  kthread+0x132/0x140
[    4.211379]  ? process_one_work+0x480/0x480
[    4.211379]  ? kthread_destroy_worker+0xd0/0xd0
[    4.211379]  ret_from_fork+0x35/0x40
[    4.211379] Code: c7 47 08 00 00 00 00 66 c7 07 28 00 c7 47 08 ff ff ff ff c7 47 04 ff ff ff ff c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 8b 47 08 <3b> 46 08 75 0a 8b 47 04 3b 46 04 0f 94 c0 c3 31 c0 c3 90 66 2e
[    4.211379] RIP: vsock_addr_equals_addr+0x3/0x20 RSP: ffffaea1800ebd28
[    4.211379] CR2: ffffffffffffffe8
[    4.211379] ---[ end trace f31cc4a2e6df3689 ]---
[    4.211379] Kernel panic - not syncing: Fatal exception in interrupt
[    4.211379] Kernel Offset: 0x37000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[    4.211379] Rebooting in 5 seconds..

Fixes: 22b5c0b63f32 ("vsock/virtio: fix kernel panic after device hot-unplug")
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: netdev@vger.kernel.org
Cc: kernel-team@android.com
Cc: stable@vger.kernel.org [4.9+]
Signed-off-by: Jorge E. Moreira <jemoreira@google.com>
---
 net/vmw_vsock/virtio_transport.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 15eb5d3d4750..96ab344f17bb 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -702,28 +702,27 @@ static int __init virtio_vsock_init(void)
 	if (!virtio_vsock_workqueue)
 		return -ENOMEM;
 
-	ret = register_virtio_driver(&virtio_vsock_driver);
+	ret = vsock_core_init(&virtio_transport.transport);
 	if (ret)
 		goto out_wq;
 
-	ret = vsock_core_init(&virtio_transport.transport);
+	ret = register_virtio_driver(&virtio_vsock_driver);
 	if (ret)
-		goto out_vdr;
+		goto out_vci;
 
 	return 0;
 
-out_vdr:
-	unregister_virtio_driver(&virtio_vsock_driver);
+out_vci:
+	vsock_core_exit();
 out_wq:
 	destroy_workqueue(virtio_vsock_workqueue);
 	return ret;
-
 }
 
 static void __exit virtio_vsock_exit(void)
 {
-	vsock_core_exit();
 	unregister_virtio_driver(&virtio_vsock_driver);
+	vsock_core_exit();
 	destroy_workqueue(virtio_vsock_workqueue);
 }
 
-- 
2.21.0.593.g511ec345e18-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
