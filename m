Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 69134371A41
	for <lists.virtualization@lfdr.de>; Mon,  3 May 2021 18:38:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DA660B52;
	Mon,  3 May 2021 16:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hmN8JlnR8AM; Mon,  3 May 2021 16:38:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id E328160B50;
	Mon,  3 May 2021 16:38:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85542C0001;
	Mon,  3 May 2021 16:38:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2239C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E099C40EA2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ux0z9dA_nYV
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:38:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C50C340E9D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 16:38:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F96561436;
 Mon,  3 May 2021 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059913;
 bh=Js9mGIGUIFAU8eXZRYozls/ur99/Bns1dPzL6l4LIvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b3OcdT092H7fG98HvfCbuCADFcA7G7A99SlhvLIKZmP5GylIA6FgoE5VPXE6sW0l3
 F4A+XIXFGl2JQDq6en+2xMq1vF6J/OkazWnmGvczGR8cXKzVGSgLeZhtyx0sFPSy0P
 BDuJjFDBV417dx91C+WzyFNH+0hEk/luxs2vrqyl6+BdcYe18h2O4DY9/haTqQZsP7
 vozoIFwe+REkZZEmaBQzQf10luQ1xGzeoHzYTyF9HLGMHLJSfPXjp/FuAzpV7siF/i
 /dBNbGZoqE1wtBJytuIbj0w1pXGp7UQAhy4bVDnDzP0EznQYo+qX+0yJEw4JTcGgT2
 usupfY4CAwy5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 002/100] drm/qxl: do not run release if qxl
 failed to init
Date: Mon,  3 May 2021 12:36:51 -0400
Message-Id: <20210503163829.2852775-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163829.2852775-1-sashal@kernel.org>
References: <20210503163829.2852775-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Tong Zhang <ztong0001@gmail.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
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

From: Tong Zhang <ztong0001@gmail.com>

[ Upstream commit b91907a6241193465ca92e357adf16822242296d ]

if qxl_device_init() fail, drm device will not be registered,
in this case, do not run qxl_drm_release()

[    5.258534] ==================================================================
[    5.258931] BUG: KASAN: user-memory-access in qxl_destroy_monitors_object+0x42/0xa0 [qxl]
[    5.259388] Write of size 8 at addr 00000000000014dc by task modprobe/95
[    5.259754]
[    5.259842] CPU: 0 PID: 95 Comm: modprobe Not tainted 5.11.0-rc6-00007-g88bb507a74ea #62
[    5.260309] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-48-gd9c812dda54
[    5.260917] Call Trace:
[    5.261056]  dump_stack+0x7d/0xa3
[    5.261245]  kasan_report.cold+0x10c/0x10e
[    5.261475]  ? qxl_destroy_monitors_object+0x42/0xa0 [qxl]
[    5.261789]  check_memory_region+0x17c/0x1e0
[    5.262029]  qxl_destroy_monitors_object+0x42/0xa0 [qxl]
[    5.262332]  qxl_modeset_fini+0x9/0x20 [qxl]
[    5.262595]  qxl_drm_release+0x22/0x30 [qxl]
[    5.262841]  drm_dev_release+0x32/0x50
[    5.263047]  release_nodes+0x39e/0x410
[    5.263253]  ? devres_release+0x40/0x40
[    5.263462]  really_probe+0x2ea/0x420
[    5.263664]  driver_probe_device+0x6d/0xd0
[    5.263888]  device_driver_attach+0x82/0x90
[    5.264116]  ? device_driver_attach+0x90/0x90
[    5.264353]  __driver_attach+0x60/0x100
[    5.264563]  ? device_driver_attach+0x90/0x90
[    5.264801]  bus_for_each_dev+0xe1/0x140
[    5.265014]  ? subsys_dev_iter_exit+0x10/0x10
[    5.265251]  ? klist_node_init+0x61/0x80
[    5.265464]  bus_add_driver+0x254/0x2a0
[    5.265673]  driver_register+0xd3/0x150
[    5.265882]  ? 0xffffffffc0048000
[    5.266064]  do_one_initcall+0x84/0x250
[    5.266274]  ? trace_event_raw_event_initcall_finish+0x150/0x150
[    5.266596]  ? unpoison_range+0xf/0x30
[    5.266801]  ? ____kasan_kmalloc.constprop.0+0x84/0xa0
[    5.267082]  ? unpoison_range+0xf/0x30
[    5.267287]  ? unpoison_range+0xf/0x30
[    5.267491]  do_init_module+0xf8/0x350
[    5.267697]  load_module+0x3fe6/0x4340
[    5.267902]  ? vm_unmap_ram+0x1d0/0x1d0
[    5.268115]  ? module_frob_arch_sections+0x20/0x20
[    5.268375]  ? __do_sys_finit_module+0x108/0x170
[    5.268624]  __do_sys_finit_module+0x108/0x170
[    5.268865]  ? __ia32_sys_init_module+0x40/0x40
[    5.269111]  ? file_open_root+0x200/0x200
[    5.269330]  ? do_sys_open+0x85/0xe0
[    5.269527]  ? filp_open+0x50/0x50
[    5.269714]  ? exit_to_user_mode_prepare+0xfc/0x130
[    5.269978]  do_syscall_64+0x33/0x40
[    5.270176]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    5.270450] RIP: 0033:0x7fa3f685bcf7
[    5.270646] Code: 48 89 57 30 48 8b 04 24 48 89 47 38 e9 1d a0 02 00 48 89 f8 48 89 f7 48 89 d1
[    5.271634] RSP: 002b:00007ffca83048d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    5.272037] RAX: ffffffffffffffda RBX: 0000000001e94a70 RCX: 00007fa3f685bcf7
[    5.272416] RDX: 0000000000000000 RSI: 0000000001e939e0 RDI: 0000000000000003
[    5.272794] RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000001
[    5.273171] R10: 00007fa3f68bf300 R11: 0000000000000246 R12: 0000000001e939e0
[    5.273550] R13: 0000000000000000 R14: 0000000001e93bd0 R15: 0000000000000001
[    5.273928] ==================================================================

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20210203040727.868921-1-ztong0001@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 6e7f16f4cec7..41cdf9d1e59d 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -144,6 +144,8 @@ static void qxl_drm_release(struct drm_device *dev)
 	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
 	 * non-trivial though.
 	 */
+	if (!dev->registered)
+		return;
 	qxl_modeset_fini(qdev);
 	qxl_device_fini(qdev);
 }
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
