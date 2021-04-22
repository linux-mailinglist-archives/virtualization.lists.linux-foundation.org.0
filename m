Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A916B3680EA
	for <lists.virtualization@lfdr.de>; Thu, 22 Apr 2021 14:56:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0984383CB2;
	Thu, 22 Apr 2021 12:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8G_xmPal8vhc; Thu, 22 Apr 2021 12:56:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3EFC83CCA;
	Thu, 22 Apr 2021 12:56:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86593C000B;
	Thu, 22 Apr 2021 12:56:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B621C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 12:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D29583C89
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 12:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p44x5lCaXWyW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 12:56:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECC2B81C67
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 12:56:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EE97A12D4;
 Thu, 22 Apr 2021 08:55:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 22 Apr 2021 08:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hUnsJZ
 Fx912SJYArMekrpRTZwS0S1MC2Jac58P5q++4=; b=eve03P83F0ISBTb4gv6srU
 awbNzfW+2lwSL2sjSqjLhEdjRE0eXAWjMSVCvbwumpSOxXuW5BKm3ofRd0DUTDM7
 3/vUBgxY4RK+0RLwpbB65mQH8yFnk7ddEq/vTv/kZIN0RNKm2pi2LB8anWBlCwS0
 QpFk1TG1kq76OAetpXSFNOSejgZ7IpBmYkfSgjFahjPD2Ny5xWPXZwMvRV/qQpjX
 AtNWue2rEV3ekOGVoRAKEpWL8pRpqRvDscHtIU1CE/twt6COPt5j++0XIZBylGVH
 fVH0UDN0+RqIg2mjaZvuGbFIzUvdKtrKWMVr2pkK1ECZz39Y3w64vhHMlRsZCmSw
 ==
X-ME-Sender: <xms:XHKBYLOSp5iiCem4v81ARl2kHhpxxS4bigrSvnkGe0ji7grgVegQkg>
 <xme:XHKBYF9kIEwl4a9_ftKqNcSwRvqq_HhC_TwiY8ylOeo8giL5NbojCAdm98Nlu_JiT
 aVhdjCwvxvaiCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefkughoucfu
 tghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrdhorhhgqeenucggtffrrghtth
 gvrhhnpedtffekkeefudffveegueejffejhfetgfeuuefgvedtieehudeuueekhfduheel
 teenucfkphepkeegrddvvdelrdduheefrddukeejnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihguohhstghhsehiughoshgthhdrohhrgh
X-ME-Proxy: <xmx:XHKBYKRu7GRQVIfMu65atxeMRJYH8wUbFpfydDTitx4Ftwu6yakh9g>
 <xmx:XHKBYPvfJeBHQxqojVnSfMvguIGjIzDGU_a__mxsb126tQLDjtZWaQ>
 <xmx:XHKBYDekA9nMJqXWhGdlcGe0mwf4jWxcYuV3h0OjNT1_lKEUyrv-nA>
 <xmx:XXKBYK7cCFfDzqGbINwSqs5_-mlvVZ9R6d2kYmOKaF7Gm5LNmE16-g>
Received: from localhost (igld-84-229-153-187.inter.net.il [84.229.153.187])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4510F240057;
 Thu, 22 Apr 2021 08:55:56 -0400 (EDT)
Date: Thu, 22 Apr 2021 15:55:53 +0300
From: Ido Schimmel <idosch@idosch.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v3] virtio-net: page_to_skb() use build_skb when
 there's sufficient tailroom
Message-ID: <YIFyWbmtnM5IcHl8@shredder.lan>
References: <YIFaYBAryfCEBhln@shredder.lan>
 <1619093551.9680612-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619093551.9680612-1-xuanzhuo@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

On Thu, Apr 22, 2021 at 08:12:31PM +0800, Xuan Zhuo wrote:
> Thank you very much for reporting this problem. Can you try this patch? Of
> course, it also includes two patches from eric.
> 
>  af39c8f72301 virtio-net: fix use-after-free in page_to_skb()
>  f5d7872a8b8a virtio-net: restrict build_skb() use to some arches

Applied your patch on top of net-next, looks good. Feel free to add:

Tested-by: Ido Schimmel <idosch@nvidia.com>

Thanks for the quick fix
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
