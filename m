Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B692272D
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:19:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 495F9AAE;
	Sun, 19 May 2019 16:17:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7DC6C3E8C
	for <virtualization@lists.linux-foundation.org>;
	Sat,  4 May 2019 07:34:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.heh.ee (heh.ee [213.35.143.160])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4412679
	for <virtualization@lists.linux-foundation.org>;
	Sat,  4 May 2019 07:34:08 +0000 (UTC)
Received: from [0.0.0.0] (unknown [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.heh.ee (Postfix) with ESMTPSA id 50758161327;
	Sat,  4 May 2019 10:34:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ristioja.ee; s=mail;
	t=1556955241; bh=7vpQxdPHgWBy5KVTrvrPWkYeqpjQIPfFEJnfw4hhRAg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=g+RQO6jIZLc2wKhmrjH7dz2M06vNVgSyJY9aB6yrnKbaxy5AH4jYE7Sh+hdc8WYcA
	GmeqIlZaVTBUNjlJebh94mNbcVGSb6zKAtm+wFiVAPt9V+kxYJUhTNPSLa7r9Dyvtb
	ENqj3+wcuj5Suq2yQMQ2ZLZWdJ/yYqr85b6OpYyE=
Subject: Re: Xorg hangs in kernelspace with qxl
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20e78e41-ed6a-a8ea-07e5-f83f353b8eaa@ristioja.ee>
	<20190502052630.ombyxjhvx2hskxgv@sirius.home.kraxel.org>
From: Jaak Ristioja <jaak@ristioja.ee>
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
Message-ID: <78ef74f8-19d6-463e-8534-3a54953b8144@ristioja.ee>
Date: Sat, 4 May 2019 10:34:23 +0300
User-Agent: undefined
MIME-Version: 1.0
In-Reply-To: <20190502052630.ombyxjhvx2hskxgv@sirius.home.kraxel.org>
Content-Language: et-EE
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Dave Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org
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

On 02.05.19 08:26, Gerd Hoffmann wrote:
> On Wed, May 01, 2019 at 12:47:48AM +0300, Jaak Ristioja wrote:
>> Hello!
>>
>> I'm experiencing the following task hangs at least 2-3 times a day when
>> using a Kubuntu desktop in KVM via a SPICE client. This has occurred
>> with the stock kernels in Kubuntu since Kubuntu 18.04. This makes the VM
>> unusable as a graphical remote desktop and the hung task prevents
>> Kubuntu from gracefully rebooting (e.g. "reboot" via SSH). Any ideas?
>>
>> INFO: task Xorg:879 blocked for more than 120 seconds.
>>       Not tainted 5.0.0-13-generic #14-Ubuntu
> 
> Does it happen with 5.1-rc kernels too?
> 
> cheers,
>   Gerd
> 

Yes it does:

[175938.066756] INFO: task Xorg:903 blocked for more than 120 seconds.
[175938.074630]       Not tainted 5.1.0-050100rc7-generic #201904282131
[175938.094726] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[175938.100947] Xorg            D    0   903    806 0x00400004
[175938.100955] Call Trace:
[175938.100961]  __schedule+0x2d3/0x840
[175938.100963]  schedule+0x2c/0x70
[175938.100964]  schedule_preempt_disabled+0xe/0x10
[175938.100966]  __ww_mutex_lock.isra.11+0x3e0/0x750
[175938.100968]  __ww_mutex_lock_slowpath+0x16/0x20
[175938.100969]  ww_mutex_lock+0x34/0x50
[175938.100974]  ttm_eu_reserve_buffers+0x1f9/0x2e0 [ttm]
[175938.100978]  qxl_release_reserve_list+0x67/0x150 [qxl]
[175938.100980]  ? qxl_bo_pin+0xaa/0x190 [qxl]
[175938.100982]  qxl_cursor_atomic_update+0x1b0/0x2e0 [qxl]
[175938.100990]  drm_atomic_helper_commit_planes+0xb9/0x220 [drm_kms_helper]
[175938.100994]  drm_atomic_helper_commit_tail+0x2b/0x70 [drm_kms_helper]
[175938.100998]  commit_tail+0x67/0x70 [drm_kms_helper]
[175938.101006]  drm_atomic_helper_commit+0x113/0x120 [drm_kms_helper]
[175938.101019]  drm_atomic_commit+0x4a/0x50 [drm]
[175938.101023]  drm_atomic_helper_update_plane+0xe9/0x100 [drm_kms_helper]
[175938.101031]  __setplane_atomic+0xd3/0x120 [drm]
[175938.101039]  drm_mode_cursor_universal+0x142/0x270 [drm]
[175938.101047]  drm_mode_cursor_common+0x18e/0x200 [drm]
[175938.101072]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
[175938.101079]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
[175938.101085]  drm_ioctl_kernel+0xb0/0x100 [drm]
[175938.101088]  ? ___sys_recvmsg+0x16c/0x200
[175938.101094]  drm_ioctl+0x233/0x410 [drm]
[175938.101101]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
[175938.101103]  ? timerqueue_add+0x57/0x90
[175938.101105]  ? enqueue_hrtimer+0x3c/0x90
[175938.101107]  do_vfs_ioctl+0xa9/0x640
[175938.101109]  ? fput+0x13/0x20
[175938.101110]  ? __sys_recvmsg+0x88/0xa0
[175938.101111]  ksys_ioctl+0x67/0x90
[175938.101112]  __x64_sys_ioctl+0x1a/0x20
[175938.101114]  do_syscall_64+0x5a/0x110
[175938.101115]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[175938.101117] RIP: 0033:0x7fb8ae27b417
[175938.101120] Code: Bad RIP value.
[175938.101121] RSP: 002b:00007ffefbee6878 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[175938.101122] RAX: ffffffffffffffda RBX: 0000557c8e388610 RCX:
00007fb8ae27b417
[175938.101122] RDX: 00007ffefbee68b0 RSI: 00000000c02464bb RDI:
000000000000000e
[175938.101123] RBP: 00007ffefbee68b0 R08: 0000000000000040 R09:
0000000000000004
[175938.101123] R10: 000000000000003f R11: 0000000000003246 R12:
00000000c02464bb
[175938.101124] R13: 000000000000000e R14: 0000000000000000 R15:
0000557c8e386450
[176058.902467] INFO: task Xorg:903 blocked for more than 241 seconds.
[176058.903489]       Not tainted 5.1.0-050100rc7-generic #201904282131
[176058.904502] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[176058.905747] Xorg            D    0   903    806 0x00400004
[176058.905749] Call Trace:
[176058.905754]  __schedule+0x2d3/0x840
[176058.905756]  schedule+0x2c/0x70
[176058.905757]  schedule_preempt_disabled+0xe/0x10
[176058.905759]  __ww_mutex_lock.isra.11+0x3e0/0x750
[176058.905760]  __ww_mutex_lock_slowpath+0x16/0x20
[176058.905762]  ww_mutex_lock+0x34/0x50
[176058.905767]  ttm_eu_reserve_buffers+0x1f9/0x2e0 [ttm]
[176058.905770]  qxl_release_reserve_list+0x67/0x150 [qxl]
[176058.905772]  ? qxl_bo_pin+0xaa/0x190 [qxl]
[176058.905774]  qxl_cursor_atomic_update+0x1b0/0x2e0 [qxl]
[176058.905781]  drm_atomic_helper_commit_planes+0xb9/0x220 [drm_kms_helper]
[176058.905785]  drm_atomic_helper_commit_tail+0x2b/0x70 [drm_kms_helper]
[176058.905789]  commit_tail+0x67/0x70 [drm_kms_helper]
[176058.905792]  drm_atomic_helper_commit+0x113/0x120 [drm_kms_helper]
[176058.905804]  drm_atomic_commit+0x4a/0x50 [drm]
[176058.905808]  drm_atomic_helper_update_plane+0xe9/0x100 [drm_kms_helper]
[176058.905815]  __setplane_atomic+0xd3/0x120 [drm]
[176058.905822]  drm_mode_cursor_universal+0x142/0x270 [drm]
[176058.905838]  drm_mode_cursor_common+0x18e/0x200 [drm]
[176058.905845]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
[176058.905851]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
[176058.905857]  drm_ioctl_kernel+0xb0/0x100 [drm]
[176058.905859]  ? ___sys_recvmsg+0x16c/0x200
[176058.905864]  drm_ioctl+0x233/0x410 [drm]
[176058.905871]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
[176058.905872]  ? timerqueue_add+0x57/0x90
[176058.905874]  ? enqueue_hrtimer+0x3c/0x90
[176058.905876]  do_vfs_ioctl+0xa9/0x640
[176058.905877]  ? fput+0x13/0x20
[176058.905879]  ? __sys_recvmsg+0x88/0xa0
[176058.905879]  ksys_ioctl+0x67/0x90
[176058.905880]  __x64_sys_ioctl+0x1a/0x20
[176058.905882]  do_syscall_64+0x5a/0x110
[176058.905883]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[176058.905884] RIP: 0033:0x7fb8ae27b417
[176058.905888] Code: Bad RIP value.
[176058.905889] RSP: 002b:00007ffefbee6878 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[176058.905890] RAX: ffffffffffffffda RBX: 0000557c8e388610 RCX:
00007fb8ae27b417
[176058.905890] RDX: 00007ffefbee68b0 RSI: 00000000c02464bb RDI:
000000000000000e
[176058.905891] RBP: 00007ffefbee68b0 R08: 0000000000000040 R09:
0000000000000004
[176058.905891] R10: 000000000000003f R11: 0000000000003246 R12:
00000000c02464bb
[176058.905892] R13: 000000000000000e R14: 0000000000000000 R15:
0000557c8e386450

I attached the full dmesg output to Launchpad if required:

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1813620


Best regards,
Jaak Ristioja
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
