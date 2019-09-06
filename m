Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE028AB22C
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 07:56:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D6881BE3;
	Fri,  6 Sep 2019 05:56:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2778E165B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:56:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
	[202.108.3.166])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id D78F4756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:55:58 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.254.173.51])
	by sina.com with ESMTP
	id 5D71F45B00013031; Fri, 6 Sep 2019 13:53:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 8930254920337
From: Hillf Danton <hdanton@sina.com>
To: Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: Xorg indefinitely hangs in kernelspace
Date: Fri,  6 Sep 2019 13:53:22 +0800
Message-Id: <20190906055322.17900-1-hdanton@sina.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


On Tue, 6 Aug 2019 21:00:10 +0300 From:   Jaak Ristioja <jaak@ristioja.ee>
> Hello!
> 
> I'm writing to report a crash in the QXL / DRM code in the Linux kernel.
> I originally filed the issue on LaunchPad and more details can be found
> there, although I doubt whether these details are useful.
> 
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1813620
> 
> I first experienced these issues with:
> 
> * Ubuntu 18.04 (probably kernel 4.15.something)
> * Ubuntu 18.10 (kernel 4.18.0-13)
> * Ubuntu 19.04 (kernel 5.0.0-13-generic)
> * Ubuntu 19.04 (mainline kernel 5.1-rc7)
> * Ubuntu 19.04 (mainline kernel 5.2.0-050200rc1-generic)
> 
> Here is the crash output from dmesg:
> 
> [354073.713350] INFO: task Xorg:920 blocked for more than 120 seconds.
> [354073.717755]       Not tainted 5.2.0-050200rc1-generic #201905191930
> [354073.722277] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [354073.738332] Xorg            D    0   920    854 0x00404004
> [354073.738334] Call Trace:
> [354073.738340]  __schedule+0x2ba/0x650
> [354073.738342]  schedule+0x2d/0x90
> [354073.738343]  schedule_preempt_disabled+0xe/0x10
> [354073.738345]  __ww_mutex_lock.isra.11+0x3e0/0x750
> [354073.738346]  __ww_mutex_lock_slowpath+0x16/0x20
> [354073.738347]  ww_mutex_lock+0x34/0x50
> [354073.738352]  ttm_eu_reserve_buffers+0x1f9/0x2e0 [ttm]
> [354073.738356]  qxl_release_reserve_list+0x67/0x150 [qxl]
> [354073.738358]  ? qxl_bo_pin+0xaa/0x190 [qxl]
> [354073.738359]  qxl_cursor_atomic_update+0x1b0/0x2e0 [qxl]
> [354073.738367]  drm_atomic_helper_commit_planes+0xb9/0x220 [drm_kms_helper]
> [354073.738371]  drm_atomic_helper_commit_tail+0x2b/0x70 [drm_kms_helper]
> [354073.738374]  commit_tail+0x67/0x70 [drm_kms_helper]
> [354073.738378]  drm_atomic_helper_commit+0x113/0x120 [drm_kms_helper]
> [354073.738390]  drm_atomic_commit+0x4a/0x50 [drm]
> [354073.738394]  drm_atomic_helper_update_plane+0xe9/0x100 [drm_kms_helper]
> [354073.738402]  __setplane_atomic+0xd3/0x120 [drm]
> [354073.738410]  drm_mode_cursor_universal+0x142/0x270 [drm]
> [354073.738418]  drm_mode_cursor_common+0xcb/0x220 [drm]
> [354073.738425]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
> [354073.738432]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
> [354073.738438]  drm_ioctl_kernel+0xb0/0x100 [drm]
> [354073.738440]  ? ___sys_recvmsg+0x16c/0x200
> [354073.738445]  drm_ioctl+0x233/0x410 [drm]
> [354073.738452]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
> [354073.738454]  ? timerqueue_add+0x57/0x90
> [354073.738456]  ? enqueue_hrtimer+0x3c/0x90
> [354073.738458]  do_vfs_ioctl+0xa9/0x640
> [354073.738459]  ? fput+0x13/0x20
> [354073.738461]  ? __sys_recvmsg+0x88/0xa0
> [354073.738462]  ksys_ioctl+0x67/0x90
> [354073.738463]  __x64_sys_ioctl+0x1a/0x20
> [354073.738465]  do_syscall_64+0x5a/0x140
> [354073.738467]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [354073.738468] RIP: 0033:0x7ffad14d3417
> [354073.738472] Code: Bad RIP value.
> [354073.738472] RSP: 002b:00007ffdd5679978 EFLAGS: 00003246 ORIG_RAX:
> 0000000000000010
> [354073.738473] RAX: ffffffffffffffda RBX: 000056428a474610 RCX:
> 00007ffad14d3417
> [354073.738474] RDX: 00007ffdd56799b0 RSI: 00000000c02464bb RDI:
> 000000000000000e
> [354073.738474] RBP: 00007ffdd56799b0 R08: 0000000000000040 R09:
> 0000000000000010
> [354073.738475] R10: 000000000000003f R11: 0000000000003246 R12:
> 00000000c02464bb
> [354073.738475] R13: 000000000000000e R14: 0000000000000000 R15:
> 000056428a4721d0
> [354073.738511] INFO: task kworker/1:0:27625 blocked for more than 120 seconds.
> [354073.745154]       Not tainted 5.2.0-050200rc1-generic #201905191930
> [354073.751900] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [354073.762197] kworker/1:0     D    0 27625      2 0x80004000
> [354073.762205] Workqueue: events qxl_client_monitors_config_work_func [qxl]
> [354073.762206] Call Trace:
> [354073.762211]  __schedule+0x2ba/0x650
> [354073.762214]  schedule+0x2d/0x90
> [354073.762215]  schedule_preempt_disabled+0xe/0x10
> [354073.762216]  __ww_mutex_lock.isra.11+0x3e0/0x750
> [354073.762217]  ? __switch_to_asm+0x34/0x70
> [354073.762218]  ? __switch_to_asm+0x40/0x70
> [354073.762219]  ? __switch_to_asm+0x40/0x70
> [354073.762220]  __ww_mutex_lock_slowpath+0x16/0x20
> [354073.762221]  ww_mutex_lock+0x34/0x50
> [354073.762235]  drm_modeset_lock+0x35/0xb0 [drm]
> [354073.762243]  drm_modeset_lock_all_ctx+0x5d/0xe0 [drm]
> [354073.762251]  drm_modeset_lock_all+0x5e/0xb0 [drm]
> [354073.762252]  qxl_display_read_client_monitors_config+0x1e1/0x370 [qxl]
> [354073.762254]  qxl_client_monitors_config_work_func+0x15/0x20 [qxl]
> [354073.762256]  process_one_work+0x20f/0x410
> [354073.762257]  worker_thread+0x34/0x400
> [354073.762259]  kthread+0x120/0x140
> [354073.762260]  ? process_one_work+0x410/0x410
> [354073.762261]  ? __kthread_parkme+0x70/0x70
> [354073.762262]  ret_from_fork+0x35/0x40
> 

--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -97,8 +97,9 @@ int ttm_eu_reserve_buffers(struct ww_acq
 			   struct list_head *dups, bool del_lru)
 {
 	struct ttm_bo_global *glob;
-	struct ttm_validate_buffer *entry;
+	struct ttm_validate_buffer *entry, *last_entry;
 	int ret;
+	bool locked = false;
 
 	if (list_empty(list))
 		return 0;
@@ -112,7 +113,10 @@ int ttm_eu_reserve_buffers(struct ww_acq
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
 
+		last_entry = entry;
 		ret = __ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
+		if (!ret)
+			locked = true;
 		if (!ret && unlikely(atomic_read(&bo->cpu_writers) > 0)) {
 			reservation_object_unlock(bo->resv);
 
@@ -151,6 +155,10 @@ int ttm_eu_reserve_buffers(struct ww_acq
 				ret = 0;
 			}
 		}
+		if (!ret)
+			locked = true;
+		else
+			locked = false;
 
 		if (!ret && entry->num_shared)
 			ret = reservation_object_reserve_shared(bo->resv,
@@ -163,6 +171,8 @@ int ttm_eu_reserve_buffers(struct ww_acq
 				ww_acquire_done(ticket);
 				ww_acquire_fini(ticket);
 			}
+			if (locked)
+				ttm_eu_backoff_reservation_reverse(list, entry);
 			return ret;
 		}
 
@@ -172,6 +182,8 @@ int ttm_eu_reserve_buffers(struct ww_acq
 		list_del(&entry->head);
 		list_add(&entry->head, list);
 	}
+	if (locked)
+		ttm_eu_backoff_reservation_reverse(list, last_entry);
 
 	if (del_lru) {
 		spin_lock(&glob->lru_lock);
--

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
