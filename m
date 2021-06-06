Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F739CD3C
	for <lists.virtualization@lfdr.de>; Sun,  6 Jun 2021 06:48:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2006606F0;
	Sun,  6 Jun 2021 04:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfPfLkjrwKbP; Sun,  6 Jun 2021 04:48:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8839607BB;
	Sun,  6 Jun 2021 04:48:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5952FC0001;
	Sun,  6 Jun 2021 04:48:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8967C0001
 for <virtualization@lists.linux-foundation.org>;
 Sun,  6 Jun 2021 04:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F4A54041B
 for <virtualization@lists.linux-foundation.org>;
 Sun,  6 Jun 2021 04:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5c48fXs9CUw
 for <virtualization@lists.linux-foundation.org>;
 Sun,  6 Jun 2021 04:48:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D11414041A
 for <virtualization@lists.linux-foundation.org>;
 Sun,  6 Jun 2021 04:48:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BBA66136D;
 Sun,  6 Jun 2021 04:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622954901;
 bh=xaAcrglNijmjCFRiE7xF8pepjMBrLn/aQY5rCt+Ggk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WrpMwiDMuvUaTuOHiy5T1Dr5GHq+5lJmfe5CN0f5E+Rqn3yieIB4CQjUopy6FhUfd
 B3i9xpfbkVXtEX6Fhpr7G/wtQlTQGTnUxhCootQP3vzTyce6cFtwhTdpSGkV66KesB
 oZ7ON8SdBgHhaC6mS4jrXZKfPQM7bo/rkK5OLDtpL4b16t1ZYrnezkgt7lo9g4EgfK
 BXiFgQ/0ep4eoYeSkCikWa61Z163AuRBH7P3oZWezN1QB+PEejE1a2Dm738QBDUzuS
 OonzJrQo2e5xR1GMbLT0Ctev/hmxAAIfAhDNYPF0RSU9Dg9AwfyKMBgcatV+11SqrC
 MDpcM2J405MXA==
Date: Sun, 6 Jun 2021 07:48:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Xianting Tian <xianting_tian@126.com>
Subject: Re: [PATCH] [v2] virtio_net: Remove BUG() to avoid machine dead
Message-ID: <YLxTkVmD3AD9pVX6@unreal>
References: <1622907060-8417-1-git-send-email-xianting_tian@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622907060-8417-1-git-send-email-xianting_tian@126.com>
Cc: mst@redhat.com, Xianting Tian <xianting.tian@linux.alibaba.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sat, Jun 05, 2021 at 11:31:00AM -0400, Xianting Tian wrote:
> From: Xianting Tian <xianting.tian@linux.alibaba.com>
> 
> We should not directly BUG() when there is hdr error, it is
> better to output a print when such error happens. Currently,
> the caller of xmit_skb() already did it.
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  drivers/net/virtio_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 9b6a4a8..7f11ea4 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -1623,7 +1623,7 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
>  	if (virtio_net_hdr_from_skb(skb, &hdr->hdr,
>  				    virtio_is_little_endian(vi->vdev), false,
>  				    0))
> -		BUG();
> +		return -EPROTO;

Yeah, as we discussed, BUG*() macros in non-core code that checks
in-kernel API better to be deleted.

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
