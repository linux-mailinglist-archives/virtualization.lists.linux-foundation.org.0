Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5850D15B
	for <lists.virtualization@lfdr.de>; Sun, 24 Apr 2022 12:56:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3F560E8F;
	Sun, 24 Apr 2022 10:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMbUP7-boO5q; Sun, 24 Apr 2022 10:56:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A354F60BD1;
	Sun, 24 Apr 2022 10:56:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22939C007C;
	Sun, 24 Apr 2022 10:56:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46EBCC002D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 10:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DE244010D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 10:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=blackwall-org.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNIDgddZ4FMA
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 10:56:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1BB240104
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 10:56:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z99so15327105ede.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 03:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rwTAxF+TlsYslwDRQ26vKwoA6C2L5/1VzJtHCpW23Ic=;
 b=CxgZHWm90BqSuf+Od50XrDilxu7AIFxTxkUs50mos3FclpL7BYAklm6iAeyyroTwg2
 NgPWgn1sK4MfL+R+njeFBSPPRpr2cVq5kBanNkdMwfZs/5GqsfX7KyErbwj0x+/pG+lh
 m9jUoxmxr7YXaaI6BdKGdW/wcBuNdZzH1mH8lmwYysXrd5ij1OLkG1F+oudUp+mmAf2j
 GDY8YCSD+VhrnuH+K2axBrt24apcRshbvCl8g9lnZUGdpkf6yH+CzqyzmphafebD2qpy
 N1MfHM917lthkCQJ2avIQGSuqEJDIYSlGBFl1Hvr7mpVl2WexJ8WIjf4yL+2tZJmIyfj
 8wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rwTAxF+TlsYslwDRQ26vKwoA6C2L5/1VzJtHCpW23Ic=;
 b=GsF+pGEAstRvsz3qvn8oK00tnUwNZ+paNp6uil8gpYdYwwuP4d/LenAK5vdf+PqM9m
 cJZdh0x0ZOujLGamalvplB0eh1HIAPbFg3XZGZDpS/IN7XvPWIpC7JP2RapyQsUtmj2H
 netcu1D59eqJuUbBipG4KYPW2Vu5SJtbTAcuYf8wXOtqJszRGk8PXu5fPLiRwYv7UHb/
 uo78O/ykIa1LlBuCLCAepiavCHMSjdz1PGnQzRfPMKOeB33ve8vbxtKV/ZCZfOID4rnm
 tUanQD2LDgr7nw1t7feRF69qQA+kyjjv5wsNZ3cCj/gxp+Hgbu7enzD4plP0VDoprUAr
 Mltg==
X-Gm-Message-State: AOAM532O0S6sywfdFoiGFjy9QcRa7NsnudKNCjWCkFlNQT8+VcVngimx
 NoBkoWimGWadeE/ieLh31IxsbQ==
X-Google-Smtp-Source: ABdhPJxkC0E3SIETyIvbkV1D7wHWz9TXUSHPUH7bMWpVnN14P++4GxxNEDSBruqZTlt4bor2FS9hmg==
X-Received: by 2002:a05:6402:4022:b0:425:e1b5:bc0b with SMTP id
 d34-20020a056402402200b00425e1b5bc0bmr1784434eda.139.1650797779612; 
 Sun, 24 Apr 2022 03:56:19 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a056402238200b0041f351a8b83sm3196810eda.43.2022.04.24.03.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 03:56:19 -0700 (PDT)
Message-ID: <94172c53-2919-9eab-7933-91a78bdb87f0@blackwall.org>
Date: Sun, 24 Apr 2022 13:56:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH net v2] virtio_net: fix wrong buf address calculation when
 using xdp
Content-Language: en-US
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20220423112612.2292774-1-razor@blackwall.org>
 <1650720683.8168066-1-xuanzhuo@linux.alibaba.com>
 <8d511a16-8d69-82b1-48a1-24de3a592aef@blackwall.org>
 <a58bfd2c-4f83-11fe-08d1-19c1d6497fc2@blackwall.org>
 <1650724608.256497-2-xuanzhuo@linux.alibaba.com>
 <c206c147-ad7e-b615-2e96-572482335563@blackwall.org>
 <1650726113.2334588-1-xuanzhuo@linux.alibaba.com>
 <ff95db6e-5a0a-7e63-080f-c719ac434c34@blackwall.org>
 <c7e49737-c5f8-5164-88ad-599c828c5d23@blackwall.org>
 <20220424102121.2686893-1-razor@blackwall.org>
 <1650796959.4611728-1-xuanzhuo@linux.alibaba.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <1650796959.4611728-1-xuanzhuo@linux.alibaba.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 kuba@kernel.org, davem@davemloft.net
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

On 24/04/2022 13:42, Xuan Zhuo wrote:
> On Sun, 24 Apr 2022 13:21:21 +0300, Nikolay Aleksandrov <razor@blackwall.org> wrote:
>> We received a report[1] of kernel crashes when Cilium is used in XDP
>> mode with virtio_net after updating to newer kernels. After
>> investigating the reason it turned out that when using mergeable bufs
>> with an XDP program which adjusts xdp.data or xdp.data_meta page_to_buf()
>> calculates the build_skb address wrong because the offset can become less
>> than the headroom so it gets the address of the previous page (-X bytes
>> depending on how lower offset is):
>>  page_to_skb: page addr ffff9eb2923e2000 buf ffff9eb2923e1ffc offset 252 headroom 256
>>
>> This is a pr_err() I added in the beginning of page_to_skb which clearly
>> shows offset that is less than headroom by adding 4 bytes of metadata
>> via an xdp prog. The calculations done are:
>>  receive_mergeable():
>>  headroom = VIRTIO_XDP_HEADROOM; // VIRTIO_XDP_HEADROOM == 256 bytes
>>  offset = xdp.data - page_address(xdp_page) -
>>           vi->hdr_len - metasize;
>>
>>  page_to_skb():
>>  p = page_address(page) + offset;
>>  ...
>>  buf = p - headroom;
>>
>> Now buf goes -4 bytes from the page's starting address as can be seen
>> above which is set as skb->head and skb->data by build_skb later. Depending
>> on what's done with the skb (when it's freed most often) we get all kinds
>> of corruptions and BUG_ON() triggers in mm[2]. We have to recalculate
>> the new headroom after the xdp program has run, similar to how offset
>> and len are recalculated. Headroom is directly related to
>> data_hard_start, data and data_meta, so we use them to get the new size.
>> The result is correct (similar pr_err() in page_to_skb, one case of
>> xdp_page and one case of virtnet buf):
>>  a) Case with 4 bytes of metadata
>>  [  115.949641] page_to_skb: page addr ffff8b4dcfad2000 offset 252 headroom 252
>>  [  121.084105] page_to_skb: page addr ffff8b4dcf018000 offset 20732 headroom 252
>>  b) Case of pushing data +32 bytes
>>  [  153.181401] page_to_skb: page addr ffff8b4dd0c4d000 offset 288 headroom 288
>>  [  158.480421] page_to_skb: page addr ffff8b4dd00b0000 offset 24864 headroom 288
>>  c) Case of pushing data -33 bytes
>>  [  835.906830] page_to_skb: page addr ffff8b4dd3270000 offset 223 headroom 223
>>  [  840.839910] page_to_skb: page addr ffff8b4dcdd68000 offset 12511 headroom 223
>>
>> An example reproducer xdp prog[3] is below.
>>
>> [1] https://github.com/cilium/cilium/issues/19453
>>
>> [2] Two of the many traces:
>>  [   40.437400] BUG: Bad page state in process swapper/0  pfn:14940
>>  [   40.916726] BUG: Bad page state in process systemd-resolve  pfn:053b7
>>  [   41.300891] kernel BUG at include/linux/mm.h:720!
>>  [   41.301801] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>>  [   41.302784] CPU: 1 PID: 1181 Comm: kubelet Kdump: loaded Tainted: G    B   W         5.18.0-rc1+ #37
>>  [   41.304458] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1.fc35 04/01/2014
>>  [   41.306018] RIP: 0010:page_frag_free+0x79/0xe0
>>  [   41.306836] Code: 00 00 75 ea 48 8b 07 a9 00 00 01 00 74 e0 48 8b 47 48 48 8d 50 ff a8 01 48 0f 45 fa eb d0 48 c7 c6 18 b8 30 a6 e8 d7 f8 fc ff <0f> 0b 48 8d 78 ff eb bc 48 8b 07 a9 00 00 01 00 74 3a 66 90 0f b6
>>  [   41.310235] RSP: 0018:ffffac05c2a6bc78 EFLAGS: 00010292
>>  [   41.311201] RAX: 000000000000003e RBX: 0000000000000000 RCX: 0000000000000000
>>  [   41.312502] RDX: 0000000000000001 RSI: ffffffffa6423004 RDI: 00000000ffffffff
>>  [   41.313794] RBP: ffff993c98823600 R08: 0000000000000000 R09: 00000000ffffdfff
>>  [   41.315089] R10: ffffac05c2a6ba68 R11: ffffffffa698ca28 R12: ffff993c98823600
>>  [   41.316398] R13: ffff993c86311ebc R14: 0000000000000000 R15: 000000000000005c
>>  [   41.317700] FS:  00007fe13fc56740(0000) GS:ffff993cdd900000(0000) knlGS:0000000000000000
>>  [   41.319150] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  [   41.320152] CR2: 000000c00008a000 CR3: 0000000014908000 CR4: 0000000000350ee0
>>  [   41.321387] Call Trace:
>>  [   41.321819]  <TASK>
>>  [   41.322193]  skb_release_data+0x13f/0x1c0
>>  [   41.322902]  __kfree_skb+0x20/0x30
>>  [   41.343870]  tcp_recvmsg_locked+0x671/0x880
>>  [   41.363764]  tcp_recvmsg+0x5e/0x1c0
>>  [   41.384102]  inet_recvmsg+0x42/0x100
>>  [   41.406783]  ? sock_recvmsg+0x1d/0x70
>>  [   41.428201]  sock_read_iter+0x84/0xd0
>>  [   41.445592]  ? 0xffffffffa3000000
>>  [   41.462442]  new_sync_read+0x148/0x160
>>  [   41.479314]  ? 0xffffffffa3000000
>>  [   41.496937]  vfs_read+0x138/0x190
>>  [   41.517198]  ksys_read+0x87/0xc0
>>  [   41.535336]  do_syscall_64+0x3b/0x90
>>  [   41.551637]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>  [   41.568050] RIP: 0033:0x48765b
>>  [   41.583955] Code: e8 4a 35 fe ff eb 88 cc cc cc cc cc cc cc cc e8 fb 7a fe ff 48 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44 24 30
>>  [   41.632818] RSP: 002b:000000c000a2f5b8 EFLAGS: 00000212 ORIG_RAX: 0000000000000000
>>  [   41.664588] RAX: ffffffffffffffda RBX: 000000c000062000 RCX: 000000000048765b
>>  [   41.681205] RDX: 0000000000005e54 RSI: 000000c000e66000 RDI: 0000000000000016
>>  [   41.697164] RBP: 000000c000a2f608 R08: 0000000000000001 R09: 00000000000001b4
>>  [   41.713034] R10: 00000000000000b6 R11: 0000000000000212 R12: 00000000000000e9
>>  [   41.728755] R13: 0000000000000001 R14: 000000c000a92000 R15: ffffffffffffffff
>>  [   41.744254]  </TASK>
>>  [   41.758585] Modules linked in: br_netfilter bridge veth netconsole virtio_net
>>
>>  and
>>
>>  [   33.524802] BUG: Bad page state in process systemd-network  pfn:11e60
>>  [   33.528617] page ffffe05dc0147b00 ffffe05dc04e7a00 ffff8ae9851ec000 (1) len 82 offset 252 metasize 4 hroom 0 hdr_len 12 data ffff8ae9851ec10c data_meta ffff8ae9851ec108 data_end ffff8ae9851ec14e
>>  [   33.529764] page:000000003792b5ba refcount:0 mapcount:-512 mapping:0000000000000000 index:0x0 pfn:0x11e60
>>  [   33.532463] flags: 0xfffffc0000000(node=0|zone=1|lastcpupid=0x1fffff)
>>  [   33.532468] raw: 000fffffc0000000 0000000000000000 dead000000000122 0000000000000000
>>  [   33.532470] raw: 0000000000000000 0000000000000000 00000000fffffdff 0000000000000000
>>  [   33.532471] page dumped because: nonzero mapcount
>>  [   33.532472] Modules linked in: br_netfilter bridge veth netconsole virtio_net
>>  [   33.532479] CPU: 0 PID: 791 Comm: systemd-network Kdump: loaded Not tainted 5.18.0-rc1+ #37
>>  [   33.532482] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1.fc35 04/01/2014
>>  [   33.532484] Call Trace:
>>  [   33.532496]  <TASK>
>>  [   33.532500]  dump_stack_lvl+0x45/0x5a
>>  [   33.532506]  bad_page.cold+0x63/0x94
>>  [   33.532510]  free_pcp_prepare+0x290/0x420
>>  [   33.532515]  free_unref_page+0x1b/0x100
>>  [   33.532518]  skb_release_data+0x13f/0x1c0
>>  [   33.532524]  kfree_skb_reason+0x3e/0xc0
>>  [   33.532527]  ip6_mc_input+0x23c/0x2b0
>>  [   33.532531]  ip6_sublist_rcv_finish+0x83/0x90
>>  [   33.532534]  ip6_sublist_rcv+0x22b/0x2b0
>>
>> [3] XDP program to reproduce(xdp_pass.c):
>>  #include <linux/bpf.h>
>>  #include <bpf/bpf_helpers.h>
>>
>>  SEC("xdp_pass")
>>  int xdp_pkt_pass(struct xdp_md *ctx)
>>  {
>>           bpf_xdp_adjust_head(ctx, -(int)32);
>>           return XDP_PASS;
>>  }
>>
>>  char _license[] SEC("license") = "GPL";
>>
>>  compile: clang -O2 -g -Wall -target bpf -c xdp_pass.c -o xdp_pass.o
>>  load on virtio_net: ip link set enp1s0 xdpdrv obj xdp_pass.o sec xdp_pass
>>
>> CC: stable@vger.kernel.org
>> CC: Jason Wang <jasowang@redhat.com>
>> CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>> CC: Daniel Borkmann <daniel@iogearbox.net>
>> CC: "Michael S. Tsirkin" <mst@redhat.com>
>> CC: virtualization@lists.linux-foundation.org
>> Fixes: 8fb7da9e9907 ("virtio_net: get build_skb() buf by data ptr")
>> Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
>> ---
>> v2: Recalculate headroom based on data, data_hard_start and data_meta
>>
>>  drivers/net/virtio_net.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
>> index 87838cbe38cf..a12338de7ef1 100644
>> --- a/drivers/net/virtio_net.c
>> +++ b/drivers/net/virtio_net.c
>> @@ -1005,6 +1005,12 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>>  			 * xdp.data_meta were adjusted
>>  			 */
>>  			len = xdp.data_end - xdp.data + vi->hdr_len + metasize;
>> +
>> +			/* recalculate headroom if xdp.data or xdp.data_meta
>> +			 * were adjusted
>> +			 */
>> +			headroom = xdp.data - xdp.data_hard_start - metasize;
> 
> 
> This is incorrect.
> 
> 
> 		data = page_address(xdp_page) + offset;
> 		xdp_init_buff(&xdp, frame_sz - vi->hdr_len, &rq->xdp_rxq);
> 		xdp_prepare_buff(&xdp, data - VIRTIO_XDP_HEADROOM + vi->hdr_len,
> 				 VIRTIO_XDP_HEADROOM, len - vi->hdr_len, true);
> 
> so: xdp.data_hard_start = page_address(xdp_page) + offset - VIRTIO_XDP_HEADROOM + vi->hdr_len
> 
> (page_address(xdp_page) + offset) points to virtio-net hdr.
> (page_address(xdp_page) + offset - VIRTIO_XDP_HEADROOM) points to the allocated buf.
> 
> xdp.data_hard_start points to buf + vi->hdr_len
> 
> Thanks.
> 

xdp.data points to buf + vi->hdr_len + VIRTIO_XDP_HEADROOM, so we calculate
xdp.data - xdp.data_hard_start, i.e. buf + vi->hdr_len + VIRTIO_XDP_HEADROOM - (buf + vi->hdr_len)

You can see the headrooms from my tests above, they are correct and they match exactly
the values from the headroom calculations that you suggested earlier.

> 
>> +
>>  			/* We can only create skb based on xdp_page. */
>>  			if (unlikely(xdp_page != page)) {
>>  				rcu_read_unlock();
>> @@ -1012,7 +1018,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>>  				head_skb = page_to_skb(vi, rq, xdp_page, offset,
>>  						       len, PAGE_SIZE, false,
>>  						       metasize,
>> -						       VIRTIO_XDP_HEADROOM);
>> +						       headroom);
>>  				return head_skb;
>>  			}
>>  			break;
>> --
>> 2.35.1
>>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
