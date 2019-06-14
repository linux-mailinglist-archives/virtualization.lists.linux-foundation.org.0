Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B073752
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:06:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A40DC1401;
	Wed, 24 Jul 2019 18:59:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 79E1CE3D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 03:04:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D449CE5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 03:04:01 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id m1so1083817iop.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 20:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=PHxaNNA+u/QED5OOo6diZIR8nbgzxac97BJz2T2vBYM=;
	b=hDKtlrtMpqGrj3tIeMuvvyO0f8HgoqjvYU8AU0/THiHyNzi1wzjZo7LPprYBKdK4vm
	jXC9hH2oKXDk7X6b0eFivTuGyPwQV/cA7Rbrmxeqo9/j+FojWNPX21S0Iuji9fGzzfu3
	BJi6o1p4i+YklwqFLWLzEBasEdakU/I5vsZ3KM/wabvMEzici6NtxjBYNvDvmb8qMBRP
	xXh0Cc3qTvIwURpBsbtE+xDba25m3pDneo3pjtNtJJ0GID9x8A9b8av2gJ5Lwpws3qAc
	eqMlijcxQaAnbNkTwhOsXyjIQzPbc8+Loywc9PKU1Mr+visyjzorS9WAR70iW9MP/mjJ
	nW3w==
X-Gm-Message-State: APjAAAX5bWQaTwyltteupPrA/sQD3PwcOnR9KJWLnUvwy8UvjZaqUbWe
	Ygi7IfOzahdo59HwZqsB5/RQrSEBTwMAdegXyU2EGsHpIT9g
X-Google-Smtp-Source: APXvYqx8b/cV+6qlNoRhaqUH0N8de515QwPf+Xv2nvU80JzlYAFYIaaW3fH3gbCXLbR9A4dtUXyuVwMGtTtkuP3r7VbjVUy8BlzK
MIME-Version: 1.0
X-Received: by 2002:a5d:9613:: with SMTP id w19mr35036580iol.140.1560481441104;
	Thu, 13 Jun 2019 20:04:01 -0700 (PDT)
Date: Thu, 13 Jun 2019 20:04:01 -0700
In-Reply-To: <20190614024519.6224-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f9d056058b3fe507@google.com>
Subject: Re: memory leak in vhost_net_ioctl
From: syzbot <syzbot+0789f0c7e45efd7bb643@syzkaller.appspotmail.com>
To: ast@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, dvyukov@google.com, hawk@kernel.org,
	hdanton@sina.com, jakub.kicinski@netronome.com, jasowang@redhat.com,
	john.fastabend@gmail.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, mst@redhat.com, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	virtualization@lists.linux-foundation.org, xdp-newbies@vger.kernel.org
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	RCVD_IN_DNSWL_NONE,SORTED_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
memory leak in batadv_tvlv_handler_register

   484.626788][  T156] bond0 (unregistering): Releasing backup interface  
bond_slave_1
Warning: Permanently added '10.128.0.87' (ECDSA) to the list of known hosts.
BUG: memory leak
unreferenced object 0xffff88811d25c4c0 (size 64):
   comm "softirq", pid 0, jiffies 4294943668 (age 434.830s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 e0 fc 5b 20 81 88 ff ff  ..........[ ....
     00 00 00 00 00 00 00 00 20 91 15 83 ff ff ff ff  ........ .......
   backtrace:
     [<000000000045bc9d>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000000045bc9d>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<000000000045bc9d>] slab_alloc mm/slab.c:3326 [inline]
     [<000000000045bc9d>] kmem_cache_alloc_trace+0x13d/0x280 mm/slab.c:3553
     [<00000000197d773e>] kmalloc include/linux/slab.h:547 [inline]
     [<00000000197d773e>] kzalloc include/linux/slab.h:742 [inline]
     [<00000000197d773e>] batadv_tvlv_handler_register+0xae/0x140  
net/batman-adv/tvlv.c:529
     [<00000000fa9f11af>] batadv_tt_init+0x78/0x180  
net/batman-adv/translation-table.c:4411
     [<000000008c50839d>] batadv_mesh_init+0x196/0x230  
net/batman-adv/main.c:208
     [<000000001c5a74a3>] batadv_softif_init_late+0x1ca/0x220  
net/batman-adv/soft-interface.c:861
     [<000000004e676cd1>] register_netdevice+0xbf/0x600 net/core/dev.c:8635
     [<000000005601497b>] __rtnl_newlink+0xaca/0xb30  
net/core/rtnetlink.c:3199
     [<00000000ad02cf5e>] rtnl_newlink+0x4e/0x80 net/core/rtnetlink.c:3245
     [<00000000eceb53af>] rtnetlink_rcv_msg+0x178/0x4b0  
net/core/rtnetlink.c:5214
     [<00000000140451f6>] netlink_rcv_skb+0x61/0x170  
net/netlink/af_netlink.c:2482
     [<00000000237e38f7>] rtnetlink_rcv+0x1d/0x30 net/core/rtnetlink.c:5232
     [<000000000d47c000>] netlink_unicast_kernel  
net/netlink/af_netlink.c:1307 [inline]
     [<000000000d47c000>] netlink_unicast+0x1ec/0x2d0  
net/netlink/af_netlink.c:1333
     [<0000000098503d79>] netlink_sendmsg+0x26a/0x480  
net/netlink/af_netlink.c:1922
     [<000000009263e868>] sock_sendmsg_nosec net/socket.c:646 [inline]
     [<000000009263e868>] sock_sendmsg+0x54/0x70 net/socket.c:665
     [<000000007791ad47>] __sys_sendto+0x148/0x1f0 net/socket.c:1958
     [<00000000d6f3807d>] __do_sys_sendto net/socket.c:1970 [inline]
     [<00000000d6f3807d>] __se_sys_sendto net/socket.c:1966 [inline]
     [<00000000d6f3807d>] __x64_sys_sendto+0x2a/0x30 net/socket.c:1966

BUG: memory leak
unreferenced object 0xffff8881024a3340 (size 64):
   comm "softirq", pid 0, jiffies 4294943678 (age 434.730s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 e0 2c 66 04 81 88 ff ff  .........,f.....
     00 00 00 00 00 00 00 00 20 91 15 83 ff ff ff ff  ........ .......
   backtrace:
     [<000000000045bc9d>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000000045bc9d>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<000000000045bc9d>] slab_alloc mm/slab.c:3326 [inline]
     [<000000000045bc9d>] kmem_cache_alloc_trace+0x13d/0x280 mm/slab.c:3553
     [<00000000197d773e>] kmalloc include/linux/slab.h:547 [inline]
     [<00000000197d773e>] kzalloc include/linux/slab.h:742 [inline]
     [<00000000197d773e>] batadv_tvlv_handler_register+0xae/0x140  
net/batman-adv/tvlv.c:529
     [<00000000fa9f11af>] batadv_tt_init+0x78/0x180  
net/batman-adv/translation-table.c:4411
     [<000000008c50839d>] batadv_mesh_init+0x196/0x230  
net/batman-adv/main.c:208
     [<000000001c5a74a3>] batadv_softif_init_late+0x1ca/0x220  
net/batman-adv/soft-interface.c:861
     [<000000004e676cd1>] register_netdevice+0xbf/0x600 net/core/dev.c:8635
     [<000000005601497b>] __rtnl_newlink+0xaca/0xb30  
net/core/rtnetlink.c:3199
     [<00000000ad02cf5e>] rtnl_newlink+0x4e/0x80 net/core/rtnetlink.c:3245
     [<00000000eceb53af>] rtnetlink_rcv_msg+0x178/0x4b0  
net/core/rtnetlink.c:5214
     [<00000000140451f6>] netlink_rcv_skb+0x61/0x170  
net/netlink/af_netlink.c:2482
     [<00000000237e38f7>] rtnetlink_rcv+0x1d/0x30 net/core/rtnetlink.c:5232
     [<000000000d47c000>] netlink_unicast_kernel  
net/netlink/af_netlink.c:1307 [inline]
     [<000000000d47c000>] netlink_unicast+0x1ec/0x2d0  
net/netlink/af_netlink.c:1333
     [<0000000098503d79>] netlink_sendmsg+0x26a/0x480  
net/netlink/af_netlink.c:1922
     [<000000009263e868>] sock_sendmsg_nosec net/socket.c:646 [inline]
     [<000000009263e868>] sock_sendmsg+0x54/0x70 net/socket.c:665
     [<000000007791ad47>] __sys_sendto+0x148/0x1f0 net/socket.c:1958
     [<00000000d6f3807d>] __do_sys_sendto net/socket.c:1970 [inline]
     [<00000000d6f3807d>] __se_sys_sendto net/socket.c:1966 [inline]
     [<00000000d6f3807d>] __x64_sys_sendto+0x2a/0x30 net/socket.c:1966

BUG: memory leak
unreferenced object 0xffff888108a71b80 (size 128):
   comm "syz-executor.3", pid 7367, jiffies 4294943696 (age 434.550s)
   hex dump (first 32 bytes):
     f0 f8 bf 02 81 88 ff ff f0 f8 bf 02 81 88 ff ff  ................
     1a dc 77 da 54 a0 be 41 64 20 e9 56 ff ff ff ff  ..w.T..Ad .V....
   backtrace:
     [<000000000045bc9d>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000000045bc9d>] slab_post_alloc_hook mm/slab.h:439 [inline]
     [<000000000045bc9d>] slab_alloc mm/slab.c:3326 [inline]
     [<000000000045bc9d>] kmem_cache_alloc_trace+0x13d/0x280 mm/slab.c:3553
     [<00000000cc6863ae>] kmalloc include/linux/slab.h:547 [inline]
     [<00000000cc6863ae>] hsr_create_self_node+0x42/0x150  
net/hsr/hsr_framereg.c:84
     [<000000000e2bb6b0>] hsr_dev_finalize+0xa4/0x233  
net/hsr/hsr_device.c:441
     [<000000003b100a4a>] hsr_newlink+0xf3/0x140 net/hsr/hsr_netlink.c:69
     [<00000000b5efb0eb>] __rtnl_newlink+0x892/0xb30  
net/core/rtnetlink.c:3187
     [<00000000ad02cf5e>] rtnl_newlink+0x4e/0x80 net/core/rtnetlink.c:3245
     [<00000000eceb53af>] rtnetlink_rcv_msg+0x178/0x4b0  
net/core/rtnetlink.c:5214
     [<00000000140451f6>] netlink_rcv_skb+0x61/0x170  
net/netlink/af_netlink.c:2482
     [<00000000237e38f7>] rtnetlink_rcv+0x1d/0x30 net/core/rtnetlink.c:5232
     [<000000000d47c000>] netlink_unicast_kernel  
net/netlink/af_netlink.c:1307 [inline]
     [<000000000d47c000>] netlink_unicast+0x1ec/0x2d0  
net/netlink/af_netlink.c:1333
     [<0000000098503d79>] netlink_sendmsg+0x26a/0x480  
net/netlink/af_netlink.c:1922
     [<000000009263e868>] sock_sendmsg_nosec net/socket.c:646 [inline]
     [<000000009263e868>] sock_sendmsg+0x54/0x70 net/socket.c:665
     [<000000007791ad47>] __sys_sendto+0x148/0x1f0 net/socket.c:1958
     [<00000000d6f3807d>] __do_sys_sendto net/socket.c:1970 [inline]
     [<00000000d6f3807d>] __se_sys_sendto net/socket.c:1966 [inline]
     [<00000000d6f3807d>] __x64_sys_sendto+0x2a/0x30 net/socket.c:1966
     [<000000003ba31db7>] do_syscall_64+0x76/0x1a0  
arch/x86/entry/common.c:301
     [<0000000075c8daad>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



Tested on:

commit:         c11fb13a Merge branch 'for-linus' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c8f3b6a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb38d33cd06d8d48
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12477101a00000

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
