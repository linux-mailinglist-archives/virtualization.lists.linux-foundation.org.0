Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D889128530
	for <lists.virtualization@lfdr.de>; Fri, 20 Dec 2019 23:47:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C9A4F88AE8;
	Fri, 20 Dec 2019 22:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqAD-UGoMcAv; Fri, 20 Dec 2019 22:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC1A588ADF;
	Fri, 20 Dec 2019 22:47:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFD0AC077D;
	Fri, 20 Dec 2019 22:47:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEEAEC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 22:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AA9DF88325
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 22:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEWk5Py273uK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 22:47:01 +0000 (UTC)
X-Greylist: delayed 00:06:36 by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A25ED8831A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 22:47:01 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id g15so7079719vsf.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNPn3jTBrwGAUgkWhsaau0xZPRg7/357uMDLAycFnt4=;
 b=NRffTbo6m1RIaJKI7R6fU+906J19eVbTcd5zBSITIfQw73ZidBHN8zq0Zev66pG9y1
 zVmQDh3NbHhRC929EbqFFVfCOHF92mqG3H9ru76/2dTD9eFSxOHNGbsbwzakLjbeVFdw
 k2VLJgL2OLyRX7yrwRur4fywqFpq2Dq6GVjfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNPn3jTBrwGAUgkWhsaau0xZPRg7/357uMDLAycFnt4=;
 b=Ge6ehKu69Jp6U3f2UVYXtwHLCUJHsl7whJ/xNMyB4LnK0zwiOv8Iix3ztf3+2xa0Ze
 BjC/k/ALVJU/+GYwyQa71cnl8KWSrs2sPo0G7p7LrY7tUw0BhsE3V+myvh/W+6VfCp/m
 ICEXRrwGrhfABWcOPxSkcAkzIE09IXAKiZFLb6LOVAkP2hSHkoOAaJXbOi38wr1hQ1+L
 I71oUYjOVxWw2MOYU1p49G3zIYU2LdSmOtFLaPGWZdjzk4GjHalVYPJBrb0kSgrW/DTo
 F7vWSPNEq39oP57mn/jccSMxU0fCfooNsWXS5YZvYVrDPsuBeekaStG2U2R5Ziv3S+77
 TnOA==
X-Gm-Message-State: APjAAAWNAKQ7mycFp6WQPsFTImwBdpZbIYR30e1cRv9mnysAK17VR6T3
 HyYhuZ2SwxjGxGx+5384GB8n371+qA2KgQ==
X-Google-Smtp-Source: APXvYqw7LBy5sMOYz9nfQJpr5VTGRq8tywsbiv0K0f/cx7U+eyj5XgEDymyZDjtdYdhBxtcM7jANdQ==
X-Received: by 2002:a05:6102:2327:: with SMTP id
 b7mr6498762vsa.48.1576881624687; 
 Fri, 20 Dec 2019 14:40:24 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id o6sm2657389vsr.21.2019.12.20.14.40.24
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 14:40:24 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id 1so3826896uao.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 14:40:24 -0800 (PST)
X-Received: by 2002:ab0:94:: with SMTP id 20mr10805511uaj.71.1576881623480;
 Fri, 20 Dec 2019 14:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20191220212207.76726-1-adelva@google.com>
In-Reply-To: <20191220212207.76726-1-adelva@google.com>
From: Stephen Barber <smbarber@chromium.org>
Date: Fri, 20 Dec 2019 14:40:12 -0800
X-Gmail-Original-Message-ID: <CADR9n4__Tjev_q+-f=GqPWs4_bo3dnBe7htnbogCQbqWArQV6g@mail.gmail.com>
Message-ID: <CADR9n4__Tjev_q+-f=GqPWs4_bo3dnBe7htnbogCQbqWArQV6g@mail.gmail.com>
Subject: Re: [PATCH net] virtio-net: Skip set_features on non-cvq devices
To: Alistair Delva <adelva@google.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kernel-team@android.com,
 "David S . Miller" <davem@davemloft.net>
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

On Fri, Dec 20, 2019 at 1:22 PM Alistair Delva <adelva@google.com> wrote:
>
> On devices without control virtqueue support, such as the virtio_net
> implementation in crosvm[1], attempting to configure LRO will panic the
> kernel:

If you'd like to try using the control virtqueue, I have a WIP patch
at crrev.com/c/1968200

The downside there is that when enabling IP forwarding the guest
successfully disables LRO,
which AFAIK (please correct me if I'm wrong!) is generally safe when
using virtio-net. My iperf
tests showed a ~90% bandwidth reduction, so we'd need to force LRO
back on after enabling
IP forwarding if the control queue offload patch lands.

>
> kernel BUG at drivers/net/virtio_net.c:1591!
> invalid opcode: 0000 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 483 Comm: Binder:330_1 Not tainted 5.4.5-01326-g19463e9acaac #1
> Hardware name: ChromiumOS crosvm, BIOS 0
> RIP: 0010:virtnet_send_command+0x15d/0x170 [virtio_net]
> Code: d8 00 00 00 80 78 02 00 0f 94 c0 65 48 8b 0c 25 28 00 00 00 48 3b 4c 24 70 75 11 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b e8 ec a4 12 c8 66 90 66 2e 0f 1f 84 00 00 00 00 00 55 48 89
> RSP: 0018:ffffb97940e7bb50 EFLAGS: 00010246
> RAX: ffffffffc0596020 RBX: ffffa0e1fc8ea840 RCX: 0000000000000017
> RDX: ffffffffc0596110 RSI: 0000000000000011 RDI: 000000000000000d
> RBP: ffffb97940e7bbf8 R08: ffffa0e1fc8ea0b0 R09: ffffa0e1fc8ea0b0
> R10: ffffffffffffffff R11: ffffffffc0590940 R12: 0000000000000005
> R13: ffffa0e1ffad2c00 R14: ffffb97940e7bc08 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffffa0e1fd100000(006b) knlGS:00000000e5ef7494
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 00000000e5eeb82c CR3: 0000000079b06001 CR4: 0000000000360ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  ? preempt_count_add+0x58/0xb0
>  ? _raw_spin_lock_irqsave+0x36/0x70
>  ? _raw_spin_unlock_irqrestore+0x1a/0x40
>  ? __wake_up+0x70/0x190
>  virtnet_set_features+0x90/0xf0 [virtio_net]
>  __netdev_update_features+0x271/0x980
>  ? nlmsg_notify+0x5b/0xa0
>  dev_disable_lro+0x2b/0x190
>  ? inet_netconf_notify_devconf+0xe2/0x120
>  devinet_sysctl_forward+0x176/0x1e0
>  proc_sys_call_handler+0x1f0/0x250
>  proc_sys_write+0xf/0x20
>  __vfs_write+0x3e/0x190
>  ? __sb_start_write+0x6d/0xd0
>  vfs_write+0xd3/0x190
>  ksys_write+0x68/0xd0
>  __ia32_sys_write+0x14/0x20
>  do_fast_syscall_32+0x86/0xe0
>  entry_SYSENTER_compat+0x7c/0x8e
>
> This happens because virtio_set_features() does not check the presence
> of the control virtqueue feature, which is sanity checked by a BUG_ON
> in virtnet_send_command().
>
> Fix this by skipping any feature processing if the control virtqueue is
> missing. This should be OK for any future feature that is added, as
> presumably all of them would require control virtqueue support to notify
> the endpoint that offload etc. should begin.

This sounds okay to me. This does end up hitting a netdev_WARN later on though:
[    1.885957] ------------[ cut here ]------------
[    1.888398] netdevice: eth0: failed to disable LRO!
[    1.890369] WARNING: CPU: 0 PID: 163 at
/mnt/host/source/src/third_party/kernel/v5.4/net/core/dev.c:1483
dev_disable_lro+0x91/0x95
[    1.894761] CPU: 0 PID: 163 Comm: lxd Not tainted 5.4.5 #2
[    1.896698] Hardware name: ChromiumOS crosvm, BIOS 0
[    1.898387] RIP: 0010:dev_disable_lro+0x91/0x95
[    1.899877] Code: a6 4d 0f 44 f7 eb 07 49 c7 c6 af 78 60 a6 4c 89
ff e8 6a 00 00 00 48 c7 c7 dd 73 60 a6 4c 89 f6 48 89 c2 31 c0 e8 36
e2 a5 ff <0f> 0b eb 8a 53 48 83 ec 18 48 89 fb 65 48 8b 04 25 28 00 00
00 48
[    1.905701] RSP: 0018:ffffae0fc0427d78 EFLAGS: 00010246
[    1.907282] RAX: fe766977dd14fb00 RBX: 0000000000000001 RCX: ffffffffa683aa50
[    1.909391] RDX: fffffffffffffe6d RSI: 0000000000000082 RDI: ffffffffa683aa20
[    1.911503] RBP: ffff990bd3f8e050 R08: ffff0a1000000600 R09: 0000004000000000
[    1.913613] R10: 0000000000000193 R11: ffffffffa5af56a5 R12: ffffffffa6882690
[    1.915729] R13: ffff990bd3ec2248 R14: ffff990bd3f8e000 R15: ffff990bd3f8e000
[    1.918555] FS:  00007ca813fff700(0000) GS:ffff990bd4c00000(0000)
knlGS:0000000000000000
[    1.920648] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.922039] CR2: 00005ba0e1789990 CR3: 00000001d1716003 CR4: 00000000003606b0
[    1.923716] Call Trace:
[    1.924356]  devinet_sysctl_forward+0x15a/0x1b9
[    1.925444]  proc_sys_call_handler+0xc3/0xe0
[    1.926491]  __vfs_write+0x3d/0x19b
[    1.927351]  ? selinux_file_permission+0x8c/0x124
[    1.928482]  vfs_write+0xea/0x17f
[    1.929329]  ksys_write+0x68/0xc9
[    1.930178]  do_syscall_64+0x4a/0x5d
[    1.931063]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    1.932272] RIP: 0033:0x5ba0e10655c0
[    1.933159] Code: 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 49 c7
c2 00 00 00 00 49 c7 c0 00 00 00 00 49 c7 c1 00 00 00 00 48 8b 44 24
08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44
24 30
[    1.937440] RSP: 002b:000000c00041e258 EFLAGS: 00000216 ORIG_RAX:
0000000000000001
[    1.939224] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00005ba0e10655c0
[    1.940897] RDX: 0000000000000001 RSI: 000000c00041e4d8 RDI: 0000000000000018
[    1.942600] RBP: 000000c00041e2a8 R08: 0000000000000000 R09: 0000000000000000
[    1.944310] R10: 0000000000000000 R11: 0000000000000216 R12: 000000000000000c
[    1.946007] R13: 0000000000000032 R14: 00005ba0e0fa01e8 R15: 0000000000000000
[    1.947706] ---[ end trace 9ac0c921383f98c0 ]---


>
> [1] https://chromium.googlesource.com/chromiumos/platform/crosvm/
>
> Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> Cc: stable@vger.kernel.org [4.20+]
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: kernel-team@android.com
> Cc: virtualization@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Alistair Delva <adelva@google.com>

Tested-by: Stephen Barber <smbarber@chromium.org>

> ---
>  drivers/net/virtio_net.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 4d7d5434cc5d..709bcd34e485 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2560,6 +2560,9 @@ static int virtnet_set_features(struct net_device *dev,
>         u64 offloads;
>         int err;
>
> +       if (!vi->has_cvq)
> +               return 0;
> +
>         if ((dev->features ^ features) & NETIF_F_LRO) {
>                 if (vi->xdp_queue_pairs)
>                         return -EBUSY;
> --
> 2.24.1.735.g03f4e72817-goog
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
