Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAD01F1690
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 12:17:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 45FFD86508;
	Mon,  8 Jun 2020 10:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugPE68gTNqBX; Mon,  8 Jun 2020 10:17:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F4718663C;
	Mon,  8 Jun 2020 10:17:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DF5DC016F;
	Mon,  8 Jun 2020 10:17:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83E08C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F49B87EBF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ArvKuuhouzZ0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:17:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E161874E0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591611472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8qWrXG5uSNE9Dzp6V1sYS5ofw86anDpXXrPKXmMCdEo=;
 b=L3JTHtrb2uLBgEnqW7kuKLKOcZVUjAhQJPkGkeUahooxPA7L9RwDQ1kfN4Rgg6PYhGIhir
 SQ8wdVG5ojRhkUVGcAIFQAFH4252Xw9Kk27Q0cEkQu24mlc0bKYWG6f3RDizeMf7nCUNVK
 exYPur8mACV8FeruZVtGYDQuWMiQtrU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-K9tfksReMv-RLugqvXg3Iw-1; Mon, 08 Jun 2020 06:17:50 -0400
X-MC-Unique: K9tfksReMv-RLugqvXg3Iw-1
Received: by mail-wm1-f71.google.com with SMTP id b65so5073918wmb.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 03:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8qWrXG5uSNE9Dzp6V1sYS5ofw86anDpXXrPKXmMCdEo=;
 b=XJX1PUjSSqd8Iw6gy7cUwh0EEsgQDOe4/0HjtoAdxyf7p/qKmOaKQuzhz2/92e3gG4
 CgCasA+kMf/2yOKGo5I2pfgpNGoUr0p0nCQDtzDOPTmaGJt1YO5DCw2OAq/UeUaOQEHe
 MH5YDbV7rKPin9dX9OprboYiQWkkOssgaAwJ+a91G9e7gHhQiPtDP9wQmRMfbGVSH2JJ
 mG8cZnlm7X1LZrhkZ7AFoy8NzwJdq7NEpqizINi+C1xNsD8h/kw8pboLwKm4Nlg5ce7F
 N8NxJsZ6UE+cOgter0Y6q6KoLgiu8pv867b4qbN1QanlKihCIdioahroEtJPu4+GAMjg
 VyaQ==
X-Gm-Message-State: AOAM5317WesGmhGFc3gF18d0fnt94h02MVx9E+iXW5/ho0pmpWIOU7c0
 8IxkIna40jHhZS3n9nnJ9ryutR4ao4xmTEXQfNyUBjckY1dX/XRAJNCeV2vhT0OwhoPPsGy7m3q
 4/83GCX2v0IwOtwS9LrIMoxMPkUfZUTmBT8EWW6HMig==
X-Received: by 2002:a1c:4105:: with SMTP id o5mr15395857wma.168.1591611469371; 
 Mon, 08 Jun 2020 03:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw01MpQfAn3zflPb7GVdN7FLLZh1HetB9oB+KWr4r5voKTa+SLtxH/AzT7wvjwZnQiGg0J+Pw==
X-Received: by 2002:a1c:4105:: with SMTP id o5mr15395824wma.168.1591611469097; 
 Mon, 08 Jun 2020 03:17:49 -0700 (PDT)
Received: from steredhat ([79.49.207.108])
 by smtp.gmail.com with ESMTPSA id a3sm22199003wrp.91.2020.06.08.03.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 03:17:48 -0700 (PDT)
Date: Mon, 8 Jun 2020 12:17:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC v5 12/13] vhost/vsock: switch to the buf API
Message-ID: <20200608101746.xnxtwwygolsk7yol@steredhat>
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-13-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-13-mst@redhat.com>
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

On Sun, Jun 07, 2020 at 10:11:49AM -0400, Michael S. Tsirkin wrote:
> A straight-forward conversion.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

The changes for vsock part LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


I also did some tests with vhost-vsock (tools/testing/vsock/vsock_test
and iperf-vsock), so for vsock:

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
