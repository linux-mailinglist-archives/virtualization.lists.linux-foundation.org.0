Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FD45B96C
	for <lists.virtualization@lfdr.de>; Wed, 24 Nov 2021 12:44:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047B0403C5;
	Wed, 24 Nov 2021 11:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49b8gOpRgKHY; Wed, 24 Nov 2021 11:44:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8D7EE4028A;
	Wed, 24 Nov 2021 11:44:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 098B5C0036;
	Wed, 24 Nov 2021 11:44:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F113C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 668AF60C30
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=armlinux.org.uk
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyDV7rHU8w6X
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:44:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 861DB60619
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9r7x0IMWPmEtkjUXiisRloX817MmWgYVCedn25iGv8=; b=w/wR+72JeuJ57uMWc+lEqLMRIN
 QqwfVuwY9Q2LY/2s/5Q34+re64hnCOaW7M7+7kgu0rkRM1Hy6eMyeIo801dnOunA5LH/f0jXpMPAQ
 dE5JOy5oGnVGLU4JzTxkBbkMY20uqu4ITG1UDhKkz4izGMecdwP6hjT3JAg71aZNVAQZ7y+Ve6ZJp
 i7VVrGTfz7W64gZ/Ywth3o/9VV+6vio3gXON/V8GmJxalH5+rOp2YHKJHFixiovh6KkPPbSbr5ZG9
 ++LhT0b9FxGioRWnvIPQnLTejOTvQ4E6mHQgmZ81LbPBrcVaszP5U6YoytWP+damJDcQs4pYGckJj
 dQps1lFA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55844)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mpqZa-0000Xd-4o; Wed, 24 Nov 2021 11:36:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mpqZY-00019p-3W; Wed, 24 Nov 2021 11:36:20 +0000
Date: Wed, 24 Nov 2021 11:36:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Subject: Re: [PATCH v2 net-next 08/26] mvpp2: provide .ndo_get_xdp_stats()
 callback
Message-ID: <YZ4jtImZvOVihtv1@shell.armlinux.org.uk>
References: <20211123163955.154512-1-alexandr.lobakin@intel.com>
 <20211123163955.154512-9-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123163955.154512-9-alexandr.lobakin@intel.com>
Cc: Song Liu <songliubraving@fb.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Yonghong Song <yhs@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Andrei Vagin <avagin@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Noam Dagan <ndagan@amazon.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Cong Wang <cong.wang@bytedance.com>,
 Jakub Kicinski <kuba@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, KP Singh <kpsingh@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Shay Agroskin <shayagr@amazon.com>,
 Marcin Wojtas <mw@semihalf.com>, Leon Romanovsky <leon@kernel.org>,
 David Arinzon <darinzon@amazon.com>, David Ahern <dsahern@kernel.org>,
 Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, Edward Cree <ecree.xilinx@gmail.com>,
 Yajun Deng <yajun.deng@linux.dev>, netdev@vger.kernel.org,
 Saeed Bishara <saeedb@amazon.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, bpf@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
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

On Tue, Nov 23, 2021 at 05:39:37PM +0100, Alexander Lobakin wrote:
> Same as mvneta, mvpp2 stores 7 XDP counters in per-cpu containers.
> Expose them via generic XDP stats infra.
> 
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
> ---
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> index 97bd2ee8a010..58203cde3b60 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> @@ -5131,6 +5131,56 @@ mvpp2_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
>  	stats->tx_dropped	= dev->stats.tx_dropped;
>  }
> 
> +static int mvpp2_get_xdp_stats_ndo(const struct net_device *dev, u32 attr_id,
> +				   void *attr_data)
> +{
> +	const struct mvpp2_port *port = netdev_priv(dev);
> +	struct ifla_xdp_stats *xdp_stats = attr_data;
> +	u32 cpu, start;
> +
> +	switch (attr_id) {
> +	case IFLA_XDP_XSTATS_TYPE_XDP:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	for_each_possible_cpu(cpu) {
> +		const struct mvpp2_pcpu_stats *ps;
> +		u64 xdp_xmit_err;
> +		u64 xdp_redirect;
> +		u64 xdp_tx_err;
> +		u64 xdp_pass;
> +		u64 xdp_drop;
> +		u64 xdp_xmit;
> +		u64 xdp_tx;
> +
> +		ps = per_cpu_ptr(port->stats, cpu);
> +
> +		do {
> +			start = u64_stats_fetch_begin_irq(&ps->syncp);
> +
> +			xdp_redirect = ps->xdp_redirect;
> +			xdp_pass = ps->xdp_pass;
> +			xdp_drop = ps->xdp_drop;
> +			xdp_xmit = ps->xdp_xmit;
> +			xdp_xmit_err = ps->xdp_xmit_err;
> +			xdp_tx = ps->xdp_tx;
> +			xdp_tx_err = ps->xdp_tx_err;
> +		} while (u64_stats_fetch_retry_irq(&ps->syncp, start));
> +
> +		xdp_stats->redirect += xdp_redirect;
> +		xdp_stats->pass += xdp_pass;
> +		xdp_stats->drop += xdp_drop;
> +		xdp_stats->xmit_packets += xdp_xmit;
> +		xdp_stats->xmit_errors += xdp_xmit_err;
> +		xdp_stats->tx += xdp_tx;
> +		xdp_stats->tx_errors  += xdp_tx_err;
> +	}

Actually, the only concern I have here is the duplication between this
function and mvpp2_get_xdp_stats(). It looks to me like these two
functions could share a lot of their code. Please submit a patch to
make that happen. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
