Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 328DF2272B
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:18:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F220B9E;
	Sun, 19 May 2019 16:17:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 010211B32
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 21:54:05 +0000 (UTC)
X-Greylist: delayed 00:06:27 by SQLgrey-1.7.6
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E3DD2608
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 21:54:03 +0000 (UTC)
Received: from [0.0.0.0] (unknown [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.heh.ee (Postfix) with ESMTPSA id 79E5616B812;
	Wed,  1 May 2019 00:47:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
	t=1556660841; bh=T76a1Dk98YYogo9O5wgz+hBg+6blvEbuZs2GwD/dZpg=;
	h=From:Subject:To:Date;
	b=DOeYvMK82wBf1yuw8If6MKRduwOsS+/G5N+PxkMXvOCuMp+k0cXou4EmXTYCMwesy
	pBLgD7VDB2c+LR6+bTzuQYG6TLgMqnUo2KEvtR9slm8QkgVR1gITUWUQgKYIH8seZ1
	1yUqSJWWtyNgs0NQBB2cQ3rErwQwhNrWaoyWtq34=
From: Jaak Ristioja <jaak@ristioja.ee>
Subject: Xorg hangs in kernelspace with qxl
Openpgp: preference=signencrypt
Autocrypt: addr=jaak@ristioja.ee; prefer-encrypt=mutual; keydata=
	mDMEWyjlXBYJKwYBBAHaRw8BAQdABEPNmQfWmwZZXSl5vKnpI1UVtS4l2N9kv7KqyFYtfLe0
	IEphYWsgUmlzdGlvamEgPGphYWtAcmlzdGlvamEuZWU+iJYEExYIAD4WIQTjaPCMFhRItZ2p
	iV/uxscoTrbt3AUCWyjlXAIbIwUJA8OZNAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDu
	xscoTrbt3OYPAP9l6ZjLh4qK2r/H1b+7a7qZIAjwf0o4AX6qvtX1WERxywEAhhtOHg+G8idL
	FR08XPW7nlobl2qEHMnqBTqteSsz1gG4OARbKOVcEgorBgEEAZdVAQUBAQdAU6y3a2gcxTI+
	bZgPkJjPXxr0tvuLpCqkIb/envF5ajADAQgHiH4EGBYIACYWIQTjaPCMFhRItZ2piV/uxsco
	Trbt3AUCWyjlXAIbDAUJA8OZNAAKCRDuxscoTrbt3OG5AP0cd6gLbKVSBvSEgRNQ+BNk/1a5
	lSQtocXAcwUx0X9h0gEAqIZ9u7pCWBlRTL+rij97VWWkB/jb1deZ2gExNhd6RAU=
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	virtualization@lists.linux-foundation.org
Message-ID: <20e78e41-ed6a-a8ea-07e5-f83f353b8eaa@ristioja.ee>
Date: Wed, 1 May 2019 00:47:48 +0300
User-Agent: undefined
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
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

Hello!

I'm experiencing the following task hangs at least 2-3 times a day when
using a Kubuntu desktop in KVM via a SPICE client. This has occurred
with the stock kernels in Kubuntu since Kubuntu 18.04. This makes the VM
unusable as a graphical remote desktop and the hung task prevents
Kubuntu from gracefully rebooting (e.g. "reboot" via SSH). Any ideas?

INFO: task Xorg:879 blocked for more than 120 seconds.
      Not tainted 5.0.0-13-generic #14-Ubuntu
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Xorg            D    0   879    790 0x00400004
Call Trace:
 __schedule+0x2d0/0x840
 schedule+0x2c/0x70
 schedule_preempt_disabled+0xe/0x10
 __ww_mutex_lock.isra.11+0x3e0/0x750
 __ww_mutex_lock_slowpath+0x16/0x20
 ww_mutex_lock+0x34/0x50
 ttm_eu_reserve_buffers+0x1f9/0x2e0 [ttm]
 qxl_release_reserve_list+0x67/0x150 [qxl]
 ? qxl_bo_pin+0x11d/0x200 [qxl]
 qxl_cursor_atomic_update+0x1b0/0x2e0 [qxl]
 drm_atomic_helper_commit_planes+0xb9/0x220 [drm_kms_helper]
 drm_atomic_helper_commit_tail+0x2b/0x70 [drm_kms_helper]
 commit_tail+0x67/0x70 [drm_kms_helper]
 drm_atomic_helper_commit+0x113/0x120 [drm_kms_helper]
 drm_atomic_commit+0x4a/0x50 [drm]
 drm_atomic_helper_update_plane+0xe9/0x100 [drm_kms_helper]
 __setplane_atomic+0xd6/0x120 [drm]
 drm_mode_cursor_universal+0x145/0x270 [drm]
 drm_mode_cursor_common+0x18f/0x200 [drm]
 ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
 drm_mode_cursor2_ioctl+0xe/0x10 [drm]
 drm_ioctl_kernel+0xad/0xf0 [drm]
 ? ___sys_recvmsg+0x16c/0x200
 drm_ioctl+0x233/0x410 [drm]
 ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
 ? ep_scan_ready_list.constprop.23+0x1f0/0x200
 do_vfs_ioctl+0xa9/0x640
 ? __sys_recvmsg+0x88/0xa0
 ksys_ioctl+0x67/0x90
 __x64_sys_ioctl+0x1a/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f3a80734417
Code: Bad RIP value.
RSP: 002b:00007ffcae8e3488 EFLAGS: 00003246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000055aaa657c610 RCX: 00007f3a80734417
RDX: 00007ffcae8e34c0 RSI: 00000000c02464bb RDI: 000000000000000e
RBP: 00007ffcae8e34c0 R08: 0000000000000040 R09: 0000000000000010
R10: 000000000000003f R11: 0000000000003246 R12: 00000000c02464bb
R13: 000000000000000e R14: 0000000000000000 R15: 000055aaa657a450

I originally filed a bug-report with more details about this to
Launchpad, but it got no activity for months:

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1813620

Please let me know if I can help to debug this further or if more
information is needed. I'm not subscribed to the virtualization mailing
list, so please add me to the address line if required.


Best regards,
Jaak Ristioja
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
