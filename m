Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 344801F1E26
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 19:09:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C2BEF862AC;
	Mon,  8 Jun 2020 17:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_ALOLUCIX4l; Mon,  8 Jun 2020 17:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 494EA862AB;
	Mon,  8 Jun 2020 17:08:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B67FC016F;
	Mon,  8 Jun 2020 17:08:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA870C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D3125862A9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6Gp-CP02n99
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 08E1985478
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591636135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sI72Ms6GymnWW5IgfsQfm5B7QZQFkpb/EFt5z5NFsqI=;
 b=ILrdMXY7VyUV77Xbdh+HTzXB0Fkgsn+bKnVpuKJuAdR5BvVRg/LDvVlq2dAZ7zxap6aqfg
 zdy9lKsA7oYyJ09Hc7/44HsGaowUUidL3XWPdXby3NIQUh4b5yPN+9snrRoUitvKmKGZXV
 Uc+N6jvw8/2YGAtghYQzw0+uB0pZ7c8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-dHpTRnM3OmquFmbLkqDBVw-1; Mon, 08 Jun 2020 13:08:54 -0400
X-MC-Unique: dHpTRnM3OmquFmbLkqDBVw-1
Received: by mail-wr1-f69.google.com with SMTP id t5so7400893wro.20
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 10:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sI72Ms6GymnWW5IgfsQfm5B7QZQFkpb/EFt5z5NFsqI=;
 b=Rh752fu37t4U3DI899Z67UP40QBgl0WJkxp4vRocDx4+12NwgAnWrU2k1pzRq+F6FA
 UWcuNGAvATkjHRM+5gPw8Y9GwuuFpYuVx2Tmhi/qjbPHYqV7SBHWFHt+9e3TU2hooNy2
 0YpqLJqawbmMScISB3p3i7fYtak4Oc3Sb8wgyCWSbxlDMwLrAOklN45NjyANNqHJi5EN
 pdLF+1Ftibtka60iFHBgqYyT3u7Es3Ka9wnWKd6rYrclCxaq10g6rz277zy2qyV/TMMK
 oOHsS04FGa1c9YmXpOWpdWTc49YqfKrJb/gzX19v1A1O9VxohcwnbghnazCy7efFRBVV
 IkIQ==
X-Gm-Message-State: AOAM533J2Jr2Dyw/jm3S6W/7U7RPbfc6YVZ59kQxLse2YvkVLMCMgUgz
 JdcIMC7MKqmNHlbmXSA6EhnBhQPbx3jFVG/2UoPhSIAx5gyElXz3VPJo4wta9PIuJn+lzLWH9Gj
 UskkIaB0ROS5BOwnXD73r4vQE5MZQ0zdxmB7O24yU7g==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr339438wma.112.1591636132899; 
 Mon, 08 Jun 2020 10:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4dUf9x3rgVZHJRvrEuMPKhxm/lCre/+sG86XOaArTyYsFZli8wP4z+s74imLE54MU9CeoNw==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr339413wma.112.1591636132598; 
 Mon, 08 Jun 2020 10:08:52 -0700 (PDT)
Received: from steredhat ([79.49.207.108])
 by smtp.gmail.com with ESMTPSA id l2sm342741wru.58.2020.06.08.10.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 10:08:51 -0700 (PDT)
Date: Mon, 8 Jun 2020 19:08:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC v6 10/11] vhost/vsock: switch to the buf API
Message-ID: <20200608170849.udaxzmfzmhbonoi7@steredhat>
References: <20200608125238.728563-1-mst@redhat.com>
 <20200608125238.728563-11-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608125238.728563-11-mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Mon, Jun 08, 2020 at 08:53:13AM -0400, Michael S. Tsirkin wrote:
> A straight-forward conversion.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

I ran the vsock tests again with this new series and everything seems
to go well:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index a483cec31d5c..61c6d3dd2ae3 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -103,7 +103,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		unsigned out, in;
>  		size_t nbytes;
>  		size_t iov_len, payload_len;
> -		int head;
> +		struct vhost_buf buf;
> +		int ret;
>  
>  		spin_lock_bh(&vsock->send_pkt_list_lock);
>  		if (list_empty(&vsock->send_pkt_list)) {
> @@ -117,16 +118,17 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		list_del_init(&pkt->list);
>  		spin_unlock_bh(&vsock->send_pkt_list_lock);
>  
> -		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> -					 &out, &in, NULL, NULL);
> -		if (head < 0) {
> +		ret = vhost_get_avail_buf(vq, &buf,
> +					  vq->iov, ARRAY_SIZE(vq->iov),
> +					  &out, &in, NULL, NULL);
> +		if (ret < 0) {
>  			spin_lock_bh(&vsock->send_pkt_list_lock);
>  			list_add(&pkt->list, &vsock->send_pkt_list);
>  			spin_unlock_bh(&vsock->send_pkt_list_lock);
>  			break;
>  		}
>  
> -		if (head == vq->num) {
> +		if (!ret) {
>  			spin_lock_bh(&vsock->send_pkt_list_lock);
>  			list_add(&pkt->list, &vsock->send_pkt_list);
>  			spin_unlock_bh(&vsock->send_pkt_list_lock);
> @@ -186,7 +188,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		 */
>  		virtio_transport_deliver_tap_pkt(pkt);
>  
> -		vhost_add_used(vq, head, sizeof(pkt->hdr) + payload_len);
> +		buf.in_len = sizeof(pkt->hdr) + payload_len;
> +		vhost_put_used_buf(vq, &buf);
>  		added = true;
>  
>  		pkt->off += payload_len;
> @@ -440,7 +443,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  	struct vhost_vsock *vsock = container_of(vq->dev, struct vhost_vsock,
>  						 dev);
>  	struct virtio_vsock_pkt *pkt;
> -	int head, pkts = 0, total_len = 0;
> +	int ret, pkts = 0, total_len = 0;
> +	struct vhost_buf buf;
>  	unsigned int out, in;
>  	bool added = false;
>  
> @@ -461,12 +465,13 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  			goto no_more_replies;
>  		}
>  
> -		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> -					 &out, &in, NULL, NULL);
> -		if (head < 0)
> +		ret = vhost_get_avail_buf(vq, &buf,
> +					  vq->iov, ARRAY_SIZE(vq->iov),
> +					  &out, &in, NULL, NULL);
> +		if (ret < 0)
>  			break;
>  
> -		if (head == vq->num) {
> +		if (!ret) {
>  			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
>  				vhost_disable_notify(&vsock->dev, vq);
>  				continue;
> @@ -494,7 +499,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  			virtio_transport_free_pkt(pkt);
>  
>  		len += sizeof(pkt->hdr);
> -		vhost_add_used(vq, head, len);
> +		buf.in_len = len;
> +		vhost_put_used_buf(vq, &buf);
>  		total_len += len;
>  		added = true;
>  	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> -- 
> MST
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
