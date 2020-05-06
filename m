Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A2B1C6B7C
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:21:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD8068818D;
	Wed,  6 May 2020 08:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74FGtjDRLpzx; Wed,  6 May 2020 08:21:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4152388271;
	Wed,  6 May 2020 08:21:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15423C0859;
	Wed,  6 May 2020 08:21:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36A59C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EF57E24B59
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bo5AqWwOhCQk
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id D14C323115
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588753298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsgh1dLxGFSdxuzsdLh/uv8qhBvMPuP+xGju+ifbTRc=;
 b=NWEa01dEOuNXKUAtTbC/ml9lYFlRt3WOwRzf76lU094CJchbryohoqsKQc8xAKzeAtdzlW
 FrrIbxNtDlCw14o06ExRoW7vKP/KLAOqA7mC2Glgvjh15M7maIelN6YjbJOFlD3HK8YYdB
 xFVvOmEAj7857xDDlZYZAX2htykz4G0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-fsNNCIaXOyCRvQJwUVOw2A-1; Wed, 06 May 2020 04:21:34 -0400
X-MC-Unique: fsNNCIaXOyCRvQJwUVOw2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962E718FE866;
 Wed,  6 May 2020 08:21:33 +0000 (UTC)
Received: from carbon (unknown [10.40.208.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4A7919C4F;
 Wed,  6 May 2020 08:21:25 +0000 (UTC)
Date: Wed, 6 May 2020 10:21:23 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
Message-ID: <20200506102123.739f1233@carbon>
In-Reply-To: <20200506061633.16327-1-jasowang@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, brouer@redhat.com, "Jubran,
 Samih" <sameehj@amazon.com>, bpf@vger.kernel.org
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

On Wed,  6 May 2020 14:16:32 +0800
Jason Wang <jasowang@redhat.com> wrote:

> We tried to reserve space for vnet header before
> xdp.data_hard_start. But this is useless since the packet could be
> modified by XDP which may invalidate the information stored in the
> header and

IMHO above statements are wrong. XDP cannot access memory before
xdp.data_hard_start. Thus, it is safe to store a vnet headers before
xdp.data_hard_start. (The sfc driver also use this "before" area).

> there's no way for XDP to know the existence of the vnet header currently.

It is true that XDP is unaware of this area, which is the way it
should be.  Currently the area will survive after calling BPF/XDP.
After your change it will be overwritten in xdp_frame cases.


> So let's just not reserve space for vnet header in this case.

I think this is a wrong approach!

We are working on supporting GRO multi-buffer for XDP.  The vnet header
contains GRO information (see pahole below sign). It is currently not
used in the XDP case, but we will be working towards using it.  There
are a lot of unanswered questions on how this will be implemented.
Thus, I cannot layout how we are going to leverage this info yet, but
your patch are killing this info, which IHMO is going in the wrong
direction.


> Cc: Jesper Dangaard Brouer <brouer@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/net/virtio_net.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 11f722460513..98dd75b665a5 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -684,8 +684,8 @@ static struct sk_buff *receive_small(struct net_device *dev,
>  			page = xdp_page;
>  		}
>  
> -		xdp.data_hard_start = buf + VIRTNET_RX_PAD + vi->hdr_len;
> -		xdp.data = xdp.data_hard_start + xdp_headroom;
> +		xdp.data_hard_start = buf + VIRTNET_RX_PAD;
> +		xdp.data = xdp.data_hard_start + xdp_headroom + vi->hdr_len;
>  		xdp.data_end = xdp.data + len;
>  		xdp.data_meta = xdp.data;
>  		xdp.rxq = &rq->xdp_rxq;
> @@ -845,7 +845,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
>  		 * the descriptor on if we get an XDP_TX return code.
>  		 */
>  		data = page_address(xdp_page) + offset;
> -		xdp.data_hard_start = data - VIRTIO_XDP_HEADROOM + vi->hdr_len;
> +		xdp.data_hard_start = data - VIRTIO_XDP_HEADROOM;
>  		xdp.data = data + vi->hdr_len;
>  		xdp.data_end = xdp.data + (len - vi->hdr_len);
>  		xdp.data_meta = xdp.data;



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer



$ pahole -C virtio_net_hdr_mrg_rxbuf drivers/net/virtio_net.o
struct virtio_net_hdr_mrg_rxbuf {
	struct virtio_net_hdr hdr;                       /*     0    10 */
	__virtio16                 num_buffers;          /*    10     2 */

	/* size: 12, cachelines: 1, members: 2 */
	/* last cacheline: 12 bytes */
};


$ pahole -C virtio_net_hdr drivers/net/virtio_net.o
struct virtio_net_hdr {
	__u8                       flags;                /*     0     1 */
	__u8                       gso_type;             /*     1     1 */
	__virtio16                 hdr_len;              /*     2     2 */
	__virtio16                 gso_size;             /*     4     2 */
	__virtio16                 csum_start;           /*     6     2 */
	__virtio16                 csum_offset;          /*     8     2 */

	/* size: 10, cachelines: 1, members: 6 */
	/* last cacheline: 10 bytes */
};

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
