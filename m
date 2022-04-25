Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE550E13A
	for <lists.virtualization@lfdr.de>; Mon, 25 Apr 2022 15:11:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55EAB4109E;
	Mon, 25 Apr 2022 13:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KM8BPW5Ywor1; Mon, 25 Apr 2022 13:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3F75B409F5;
	Mon, 25 Apr 2022 13:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3D33C007C;
	Mon, 25 Apr 2022 13:11:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E84FC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 13:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C344409F5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 13:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElCwodY__Z3H
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 13:11:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EAC1409D3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 13:10:59 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1niyU8-0000Nh-Gz; Mon, 25 Apr 2022 15:10:36 +0200
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1niyU8-000QLz-8p; Mon, 25 Apr 2022 15:10:36 +0200
Subject: Re: [PATCH net v3] virtio_net: fix wrong buf address calculation when
 using xdp
To: Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org
References: <20220425103703.3067292-1-razor@blackwall.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <00a5d84e-298e-3ca4-c6da-826e6fe586de@iogearbox.net>
Date: Mon, 25 Apr 2022 15:10:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20220425103703.3067292-1-razor@blackwall.org>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.5/26523/Mon Apr 25 10:20:35 2022)
Cc: "Michael S. Tsirkin" <mst@redhat.com>, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kuba@kernel.org,
 davem@davemloft.net
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 4/25/22 12:37 PM, Nikolay Aleksandrov wrote:
> We received a report[1] of kernel crashes when Cilium is used in XDP
> mode with virtio_net after updating to newer kernels. After
> investigating the reason it turned out that when using mergeable bufs
> with an XDP program which adjusts xdp.data or xdp.data_meta page_to_buf()
> calculates the build_skb address wrong because the offset can become less
> than the headroom so it gets the address of the previous page (-X bytes
> depending on how lower offset is):
>   page_to_skb: page addr ffff9eb2923e2000 buf ffff9eb2923e1ffc offset 252 headroom 256
[...]
> CC: stable@vger.kernel.org
> CC: Jason Wang <jasowang@redhat.com>
> CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> CC: Daniel Borkmann <daniel@iogearbox.net>
> CC: "Michael S. Tsirkin" <mst@redhat.com>
> CC: virtualization@lists.linux-foundation.org
> Fixes: 8fb7da9e9907 ("virtio_net: get build_skb() buf by data ptr")
> Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>

Thanks everyone!

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
