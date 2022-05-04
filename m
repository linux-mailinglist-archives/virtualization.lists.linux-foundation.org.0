Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC4951A6C9
	for <lists.virtualization@lfdr.de>; Wed,  4 May 2022 18:56:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E5E81441;
	Wed,  4 May 2022 16:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsJnCc9oLXp0; Wed,  4 May 2022 16:56:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3A9D781471;
	Wed,  4 May 2022 16:56:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBDBEC0032;
	Wed,  4 May 2022 16:56:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11214C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 May 2022 16:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1BEB610A2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 May 2022 16:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3wH0ilxeh0Y
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 May 2022 16:56:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DBC160590
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 May 2022 16:56:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB34EB82795;
 Wed,  4 May 2022 16:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3380EC385AA;
 Wed,  4 May 2022 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651683392;
 bh=3vZEKfce7dz2+KyYOFW5awhB/yZI4UFAGOGarSHn2Jw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sMGbWM+UKTAu5grGUjVTohk6SHqY8iRhXXn1pf6ENbYMky58b05xZt8Xsl4+b0GUx
 3JWys1t01TVDm1Y3QrdVpmaEpqhr0g8Bc7dvv65zi/kfc/8imcsl7uqjSz0AQDZTAF
 cM1gfb7k9Rz1MpMjHPUS4NiloQRWnmRGs3wCWzaI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.17 054/225] virtio_net: fix wrong buf address calculation
 when using xdp
Date: Wed,  4 May 2022 18:44:52 +0200
Message-Id: <20220504153114.985196710@linuxfoundation.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504153110.096069935@linuxfoundation.org>
References: <20220504153110.096069935@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Paolo Abeni <pabeni@redhat.com>,
 Nikolay Aleksandrov <razor@blackwall.org>
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

From: Nikolay Aleksandrov <razor@blackwall.org>

commit acb16b395c3f3d7502443e0c799c2b42df645642 upstream.

We received a report[1] of kernel crashes when Cilium is used in XDP
mode with virtio_net after updating to newer kernels. After
investigating the reason it turned out that when using mergeable bufs
with an XDP program which adjusts xdp.data or xdp.data_meta page_to_buf()
calculates the build_skb address wrong because the offset can become less
than the headroom so it gets the address of the previous page (-X bytes
depending on how lower offset is):
 page_to_skb: page addr ffff9eb2923e2000 buf ffff9eb2923e1ffc offset 252 headroom 256

This is a pr_err() I added in the beginning of page_to_skb which clearly
shows offset that is less than headroom by adding 4 bytes of metadata
via an xdp prog. The calculations done are:
 receive_mergeable():
 headroom = VIRTIO_XDP_HEADROOM; // VIRTIO_XDP_HEADROOM == 256 bytes
 offset = xdp.data - page_address(xdp_page) -
          vi->hdr_len - metasize;

 page_to_skb():
 p = page_address(page) + offset;
 ...
 buf = p - headroom;

Now buf goes -4 bytes from the page's starting address as can be seen
above which is set as skb->head and skb->data by build_skb later. Depending
on what's done with the skb (when it's freed most often) we get all kinds
of corruptions and BUG_ON() triggers in mm[2]. We have to recalculate
the new headroom after the xdp program has run, similar to how offset
and len are recalculated. Headroom is directly related to
data_hard_start, data and data_meta, so we use them to get the new size.
The result is correct (similar pr_err() in page_to_skb, one case of
xdp_page and one case of virtnet buf):
 a) Case with 4 bytes of metadata
 [  115.949641] page_to_skb: page addr ffff8b4dcfad2000 offset 252 headroom 252
 [  121.084105] page_to_skb: page addr ffff8b4dcf018000 offset 20732 headroom 252
 b) Case of pushing data +32 bytes
 [  153.181401] page_to_skb: page addr ffff8b4dd0c4d000 offset 288 headroom 288
 [  158.480421] page_to_skb: page addr ffff8b4dd00b0000 offset 24864 headroom 288
 c) Case of pushing data -33 bytes
 [  835.906830] page_to_skb: page addr ffff8b4dd3270000 offset 223 headroom 223
 [  840.839910] page_to_skb: page addr ffff8b4dcdd68000 offset 12511 headroom 223

Offset and headroom are equal because offset points to the start of
reserved bytes for the virtio_net header which are at buf start +
headroom, while data points at buf start + vnet hdr size + headroom so
when data or data_meta are adjusted by the xdp prog both the headroom size
and the offset change equally. We can use data_hard_start to compute the
new headroom after the xdp prog (linearized / page start case, the
virtnet buf case is similar just with bigger base offset):
 xdp.data_hard_start = page_address + vnet_hdr
 xdp.data = page_address + vnet_hdr + headroom
 new headroom after xdp prog = xdp.data - xdp.data_hard_start - metasize

An example reproducer xdp prog[3] is below.

[1] https://github.com/cilium/cilium/issues/19453

[2] Two of the many traces:
 [   40.437400] BUG: Bad page state in process swapper/0  pfn:14940
 [   40.916726] BUG: Bad page state in process systemd-resolve  pfn:053b7
 [   41.300891] kernel BUG at include/linux/mm.h:720!
 [   41.301801] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
 [   41.302784] CPU: 1 PID: 1181 Comm: kubelet Kdump: loaded Tainted: G    B   W         5.18.0-rc1+ #37
 [   41.304458] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1.fc35 04/01/2014
 [   41.306018] RIP: 0010:page_frag_free+0x79/0xe0
 [   41.306836] Code: 00 00 75 ea 48 8b 07 a9 00 00 01 00 74 e0 48 8b 47 48 48 8d 50 ff a8 01 48 0f 45 fa eb d0 48 c7 c6 18 b8 30 a6 e8 d7 f8 fc ff <0f> 0b 48 8d 78 ff eb bc 48 8b 07 a9 00 00 01 00 74 3a 66 90 0f b6
 [   41.310235] RSP: 0018:ffffac05c2a6bc78 EFLAGS: 00010292
 [   41.311201] RAX: 000000000000003e RBX: 0000000000000000 RCX: 0000000000000000
 [   41.312502] RDX: 0000000000000001 RSI: ffffffffa6423004 RDI: 00000000ffffffff
 [   41.313794] RBP: ffff993c98823600 R08: 0000000000000000 R09: 00000000ffffdfff
 [   41.315089] R10: ffffac05c2a6ba68 R11: ffffffffa698ca28 R12: ffff993c98823600
 [   41.316398] R13: ffff993c86311ebc R14: 0000000000000000 R15: 000000000000005c
 [   41.317700] FS:  00007fe13fc56740(0000) GS:ffff993cdd900000(0000) knlGS:0000000000000000
 [   41.319150] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [   41.320152] CR2: 000000c00008a000 CR3: 0000000014908000 CR4: 0000000000350ee0
 [   41.321387] Call Trace:
 [   41.321819]  <TASK>
 [   41.322193]  skb_release_data+0x13f/0x1c0
 [   41.322902]  __kfree_skb+0x20/0x30
 [   41.343870]  tcp_recvmsg_locked+0x671/0x880
 [   41.363764]  tcp_recvmsg+0x5e/0x1c0
 [   41.384102]  inet_recvmsg+0x42/0x100
 [   41.406783]  ? sock_recvmsg+0x1d/0x70
 [   41.428201]  sock_read_iter+0x84/0xd0
 [   41.445592]  ? 0xffffffffa3000000
 [   41.462442]  new_sync_read+0x148/0x160
 [   41.479314]  ? 0xffffffffa3000000
 [   41.496937]  vfs_read+0x138/0x190
 [   41.517198]  ksys_read+0x87/0xc0
 [   41.535336]  do_syscall_64+0x3b/0x90
 [   41.551637]  entry_SYSCALL_64_after_hwframe+0x44/0xae
 [   41.568050] RIP: 0033:0x48765b
 [   41.583955] Code: e8 4a 35 fe ff eb 88 cc cc cc cc cc cc cc cc e8 fb 7a fe ff 48 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44 24 30
 [   41.632818] RSP: 002b:000000c000a2f5b8 EFLAGS: 00000212 ORIG_RAX: 0000000000000000
 [   41.664588] RAX: ffffffffffffffda RBX: 000000c000062000 RCX: 000000000048765b
 [   41.681205] RDX: 0000000000005e54 RSI: 000000c000e66000 RDI: 0000000000000016
 [   41.697164] RBP: 000000c000a2f608 R08: 0000000000000001 R09: 00000000000001b4
 [   41.713034] R10: 00000000000000b6 R11: 0000000000000212 R12: 00000000000000e9
 [   41.728755] R13: 0000000000000001 R14: 000000c000a92000 R15: ffffffffffffffff
 [   41.744254]  </TASK>
 [   41.758585] Modules linked in: br_netfilter bridge veth netconsole virtio_net

 and

 [   33.524802] BUG: Bad page state in process systemd-network  pfn:11e60
 [   33.528617] page ffffe05dc0147b00 ffffe05dc04e7a00 ffff8ae9851ec000 (1) len 82 offset 252 metasize 4 hroom 0 hdr_len 12 data ffff8ae9851ec10c data_meta ffff8ae9851ec108 data_end ffff8ae9851ec14e
 [   33.529764] page:000000003792b5ba refcount:0 mapcount:-512 mapping:0000000000000000 index:0x0 pfn:0x11e60
 [   33.532463] flags: 0xfffffc0000000(node=0|zone=1|lastcpupid=0x1fffff)
 [   33.532468] raw: 000fffffc0000000 0000000000000000 dead000000000122 0000000000000000
 [   33.532470] raw: 0000000000000000 0000000000000000 00000000fffffdff 0000000000000000
 [   33.532471] page dumped because: nonzero mapcount
 [   33.532472] Modules linked in: br_netfilter bridge veth netconsole virtio_net
 [   33.532479] CPU: 0 PID: 791 Comm: systemd-network Kdump: loaded Not tainted 5.18.0-rc1+ #37
 [   33.532482] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1.fc35 04/01/2014
 [   33.532484] Call Trace:
 [   33.532496]  <TASK>
 [   33.532500]  dump_stack_lvl+0x45/0x5a
 [   33.532506]  bad_page.cold+0x63/0x94
 [   33.532510]  free_pcp_prepare+0x290/0x420
 [   33.532515]  free_unref_page+0x1b/0x100
 [   33.532518]  skb_release_data+0x13f/0x1c0
 [   33.532524]  kfree_skb_reason+0x3e/0xc0
 [   33.532527]  ip6_mc_input+0x23c/0x2b0
 [   33.532531]  ip6_sublist_rcv_finish+0x83/0x90
 [   33.532534]  ip6_sublist_rcv+0x22b/0x2b0

[3] XDP program to reproduce(xdp_pass.c):
 #include <linux/bpf.h>
 #include <bpf/bpf_helpers.h>

 SEC("xdp_pass")
 int xdp_pkt_pass(struct xdp_md *ctx)
 {
          bpf_xdp_adjust_head(ctx, -(int)32);
          return XDP_PASS;
 }

 char _license[] SEC("license") = "GPL";

 compile: clang -O2 -g -Wall -target bpf -c xdp_pass.c -o xdp_pass.o
 load on virtio_net: ip link set enp1s0 xdpdrv obj xdp_pass.o sec xdp_pass

CC: stable@vger.kernel.org
CC: Jason Wang <jasowang@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: virtualization@lists.linux-foundation.org
Fixes: 8fb7da9e9907 ("virtio_net: get build_skb() buf by data ptr")
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Link: https://lore.kernel.org/r/20220425103703.3067292-1-razor@blackwall.org
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/virtio_net.c |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -978,6 +978,24 @@ static struct sk_buff *receive_mergeable
 			 * xdp.data_meta were adjusted
 			 */
 			len = xdp.data_end - xdp.data + vi->hdr_len + metasize;
+
+			/* recalculate headroom if xdp.data or xdp_data_meta
+			 * were adjusted, note that offset should always point
+			 * to the start of the reserved bytes for virtio_net
+			 * header which are followed by xdp.data, that means
+			 * that offset is equal to the headroom (when buf is
+			 * starting at the beginning of the page, otherwise
+			 * there is a base offset inside the page) but it's used
+			 * with a different starting point (buf start) than
+			 * xdp.data (buf start + vnet hdr size). If xdp.data or
+			 * data_meta were adjusted by the xdp prog then the
+			 * headroom size has changed and so has the offset, we
+			 * can use data_hard_start, which points at buf start +
+			 * vnet hdr size, to calculate the new headroom and use
+			 * it later to compute buf start in page_to_skb()
+			 */
+			headroom = xdp.data - xdp.data_hard_start - metasize;
+
 			/* We can only create skb based on xdp_page. */
 			if (unlikely(xdp_page != page)) {
 				rcu_read_unlock();
@@ -985,7 +1003,7 @@ static struct sk_buff *receive_mergeable
 				head_skb = page_to_skb(vi, rq, xdp_page, offset,
 						       len, PAGE_SIZE, false,
 						       metasize,
-						       VIRTIO_XDP_HEADROOM);
+						       headroom);
 				return head_skb;
 			}
 			break;


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
