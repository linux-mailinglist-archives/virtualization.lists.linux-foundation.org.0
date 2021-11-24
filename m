Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD445B94E
	for <lists.virtualization@lfdr.de>; Wed, 24 Nov 2021 12:39:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E06814019D;
	Wed, 24 Nov 2021 11:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Adtn5ylo1gzd; Wed, 24 Nov 2021 11:39:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A8F33401DA;
	Wed, 24 Nov 2021 11:39:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EDA7C0012;
	Wed, 24 Nov 2021 11:39:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6781C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A62E040197
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wWOyTlNGSQJ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:39:35 +0000 (UTC)
X-Greylist: delayed 00:05:08 by SQLgrey-1.8.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A5544019D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vQDl3mdmA1En5CvP0uWx5PMM4Duf3hQWi+uoJkI1zBo=; b=gDBlttai/MvnO2Jnc8JXk3q8LQ
 rMO0EWrsuGJEhyWFh5BXTWwmCWoOddFvvXm/uA/gQq9hSsOZ1o9D+VPqSXvEAV9jEOeeK6xOQoAfx
 tjfKXRUCykdrVvQQOebb36UhhDBYbcR8GTzFWcOIwXnv56/7hCrLbe4ahkw03/fU/vp1NS94IDB8L
 9xTMR6VRrUC76UcPFITy0RureR/fRfYGDWGiSXDL3f/b0al0+xtoCK+Kslp3o0A1xc55vkSBV2TTs
 7tYaSdyUq+Qtf3tCvsLcPvb7bHQ/QleMz8BihlcLg5ntxmbTrf8H+huZ+XlO1zgQsHJGqfEvu71Rw
 a6VGqrLw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55846)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mpqcF-0000YR-B8; Wed, 24 Nov 2021 11:39:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mpqcD-00019y-KO; Wed, 24 Nov 2021 11:39:05 +0000
Date: Wed, 24 Nov 2021 11:39:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Subject: Re: [PATCH v2 net-next 07/26] mvneta: add .ndo_get_xdp_stats()
 callback
Message-ID: <YZ4kWXnqZQhSu+mw@shell.armlinux.org.uk>
References: <20211123163955.154512-1-alexandr.lobakin@intel.com>
 <20211123163955.154512-8-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123163955.154512-8-alexandr.lobakin@intel.com>
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

On Tue, Nov 23, 2021 at 05:39:36PM +0100, Alexander Lobakin wrote:
> +	for_each_possible_cpu(cpu) {
> +		const struct mvneta_pcpu_stats *stats;
> +		const struct mvneta_stats *ps;
> +		u64 xdp_xmit_err;
> +		u64 xdp_redirect;
> +		u64 xdp_tx_err;
> +		u64 xdp_pass;
> +		u64 xdp_drop;
> +		u64 xdp_xmit;
> +		u64 xdp_tx;
> +		u32 start;
> +
> +		stats = per_cpu_ptr(pp->stats, cpu);
> +		ps = &stats->es.ps;
> +
> +		do {
> +			start = u64_stats_fetch_begin_irq(&stats->syncp);
> +
> +			xdp_drop = ps->xdp_drop;
> +			xdp_pass = ps->xdp_pass;
> +			xdp_redirect = ps->xdp_redirect;
> +			xdp_tx = ps->xdp_tx;
> +			xdp_tx_err = ps->xdp_tx_err;
> +			xdp_xmit = ps->xdp_xmit;
> +			xdp_xmit_err = ps->xdp_xmit_err;
> +		} while (u64_stats_fetch_retry_irq(&stats->syncp, start));
> +
> +		xdp_stats->drop += xdp_drop;
> +		xdp_stats->pass += xdp_pass;
> +		xdp_stats->redirect += xdp_redirect;
> +		xdp_stats->tx += xdp_tx;
> +		xdp_stats->tx_errors += xdp_tx_err;
> +		xdp_stats->xmit_packets += xdp_xmit;
> +		xdp_stats->xmit_errors += xdp_xmit_err;

Same comment as for mvpp2 - this could share a lot of code from
mvneta_ethtool_update_pcpu_stats() (although it means we end up
calculating a little more for the alloc error and refill error
that this API doesn't need) but I think sharing that code would be
a good idea.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
