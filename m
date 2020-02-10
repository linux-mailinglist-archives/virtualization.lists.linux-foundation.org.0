Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6F158040
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 17:55:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D6AA084F48;
	Mon, 10 Feb 2020 16:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p01RAWDWrzdY; Mon, 10 Feb 2020 16:55:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0258384828;
	Mon, 10 Feb 2020 16:55:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5528C0171;
	Mon, 10 Feb 2020 16:55:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42FCDC0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3FA55841E3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kR4F90+pndsB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:55:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1773283C12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:55:49 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j1CLa-0004sq-Iu; Mon, 10 Feb 2020 16:55:46 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j1CLY-0004P0-4b; Mon, 10 Feb 2020 16:55:46 +0000
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: netdev@vger.kernel.org
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
Date: Mon, 10 Feb 2020 16:55:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
Cc: virtualization@lists.linux-foundation.org, linux-um@lists.infradead.org,
 mst@redhat.com
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



On 09/12/2019 10:48, anton.ivanov@cambridgegreys.com wrote:
> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> 
> Some of the frames marked as GSO which arrive at
> virtio_net_hdr_from_skb() have no GSO_TYPE, no
> fragments (data_len = 0) and length significantly shorter
> than the MTU (752 in my experiments).
> 
> This is observed on raw sockets reading off vEth interfaces
> in all 4.x and 5.x kernels I tested.
> 
> These frames are reported as invalid while they are in fact
> gso-less frames.
> 
> This patch marks the vnet header as no-GSO for them instead
> of reporting it as invalid.
> 
> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> ---
>   include/linux/virtio_net.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> index 0d1fe9297ac6..d90d5cff1b9a 100644
> --- a/include/linux/virtio_net.h
> +++ b/include/linux/virtio_net.h
> @@ -112,8 +112,12 @@ static inline int virtio_net_hdr_from_skb(const struct sk_buff *skb,
>   			hdr->gso_type = VIRTIO_NET_HDR_GSO_TCPV4;
>   		else if (sinfo->gso_type & SKB_GSO_TCPV6)
>   			hdr->gso_type = VIRTIO_NET_HDR_GSO_TCPV6;
> -		else
> -			return -EINVAL;
> +		else {
> +			if (skb->data_len == 0)
> +				hdr->gso_type = VIRTIO_NET_HDR_GSO_NONE;
> +			else
> +				return -EINVAL;
> +		}
>   		if (sinfo->gso_type & SKB_GSO_TCP_ECN)
>   			hdr->gso_type |= VIRTIO_NET_HDR_GSO_ECN;
>   	} else
> 

ping.

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
