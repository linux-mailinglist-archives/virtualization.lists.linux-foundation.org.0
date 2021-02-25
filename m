Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6E32484C
	for <lists.virtualization@lfdr.de>; Thu, 25 Feb 2021 02:07:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA10B4ED05;
	Thu, 25 Feb 2021 01:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIwl6Y-rhGGj; Thu, 25 Feb 2021 01:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949F04ED08;
	Thu, 25 Feb 2021 01:07:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E2F1C0001;
	Thu, 25 Feb 2021 01:07:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 843ACC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 01:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DAC14ECF3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 01:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbqlW42ddEsJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 01:07:38 +0000 (UTC)
X-Greylist: delayed 00:20:53 by SQLgrey-1.8.0
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F4564ECF9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 01:07:38 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1lF4nT-0000J2-K3; Thu, 25 Feb 2021 01:46:27 +0100
Received: from [85.7.101.30] (helo=pc-9.home)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1lF4nT-000Mzt-72; Thu, 25 Feb 2021 01:46:27 +0100
Subject: Re: [PATCH v8 bpf-next 0/5] xsk: build skb by page (aka generic
 zerocopy xmit)
To: Alexander Lobakin <alobakin@pm.me>,
 Magnus Karlsson <magnus.karlsson@intel.com>
References: <20210218204908.5455-1-alobakin@pm.me>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <925e70eb-3cc6-a135-decc-22167f2ecaf0@iogearbox.net>
Date: Thu, 25 Feb 2021 01:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20210218204908.5455-1-alobakin@pm.me>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.4/26090/Wed Feb 24 13:09:42 2021)
Cc: Song Liu <songliubraving@fb.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eric Dumazet <eric.dumazet@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Dust Li <dust.li@linux.alibaba.com>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>
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

On 2/18/21 9:49 PM, Alexander Lobakin wrote:
> This series introduces XSK generic zerocopy xmit by adding XSK umem
> pages as skb frags instead of copying data to linear space.
> The only requirement for this for drivers is to be able to xmit skbs
> with skb_headlen(skb) == 0, i.e. all data including hard headers
> starts from frag 0.
> To indicate whether a particular driver supports this, a new netdev
> priv flag, IFF_TX_SKB_NO_LINEAR, is added (and declared in virtio_net
> as it's already capable of doing it). So consider implementing this
> in your drivers to greatly speed-up generic XSK xmit.
[...]

Applied, thanks!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
