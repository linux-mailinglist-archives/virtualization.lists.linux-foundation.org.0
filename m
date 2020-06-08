Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 952401F1A16
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 15:30:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A3E586084;
	Mon,  8 Jun 2020 13:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODeyPI2OxPS0; Mon,  8 Jun 2020 13:30:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DFD5850DC;
	Mon,  8 Jun 2020 13:30:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EB50C016F;
	Mon,  8 Jun 2020 13:30:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3686CC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2995820456
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZPx6aVRfAn2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:30:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 378B420133
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591623047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gb88/02YmS9YtUx19YCEMGvgGVki3Ib3eUuUkCjJy+U=;
 b=FaP83EQ5UgNOcvq7fSohYP60eM+Fg5yJjKPcwjwqtObvrVjvNGkTFAUa1r7cuIpHN3f0w3
 wMdFcLs5rcme/aDPnVc0uPEb9vg9WZWSQNg6ykF9Owie1xo5ayrIttNRfmQQJ4x893Rrp4
 pXypK2A1vghHIdZM+ZXXIFNGje95qYE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-REWfuPGCPfWXj8LuAXRNUw-1; Mon, 08 Jun 2020 09:30:43 -0400
X-MC-Unique: REWfuPGCPfWXj8LuAXRNUw-1
Received: by mail-wr1-f71.google.com with SMTP id r5so7174226wrt.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 06:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gb88/02YmS9YtUx19YCEMGvgGVki3Ib3eUuUkCjJy+U=;
 b=nKUz4OzfViR9IlSkewngeIlhlCY24V/6tqeLTZVkrndWPa4UyDvWZsfudimEhuODqo
 fi03tISsXENTdaCG7a44G2M4QsNRA7tqnCtwwg4tXlIXBlwKVK7fqbdhLEYujytoFkX5
 hnaydUORE3PYdwAjWqwlw5cuOM/bwbvoX3YZbOKQswW5NgDV4X80qepf+EYlkfKO4cA3
 tcrLSUsMg8v/7SF7z0H3q0m9SduRHkUvDJZcVlj0O6+TNW4hDgGllxaw+OoJJP8DCaXZ
 UYTP3Awyq0XYfPLPJOAjYTiSxd2PKjkZvJ5ZzIG34BCS9TyDylmcWD3F3MwE2hvJRtlo
 SqYQ==
X-Gm-Message-State: AOAM533GJUdvwYYrhQhd5fOMyY9EuoeqVSwCDsyMSv/kgnvUpx2mr4KE
 t3RGS3+9O00h+45zhDIuQTKSrD7WwRawkIEPvmZ6H/uzLAoIlxS3zGoUU6uACpekQUy+YuNP7Ki
 LCEN5frQZR1pNV7XigZAL94pFbT/rndEEWwB4a8PH2Q==
X-Received: by 2002:adf:ec03:: with SMTP id x3mr23586214wrn.297.1591623041921; 
 Mon, 08 Jun 2020 06:30:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz62tJA6E64oEIZnfe39XFv8r0W7nilgUKIntVO4j0UrGBnVrvqs8Lk+4LFru+2gi/RHZ/CMw==
X-Received: by 2002:adf:ec03:: with SMTP id x3mr23586189wrn.297.1591623041702; 
 Mon, 08 Jun 2020 06:30:41 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 a81sm24080582wmd.25.2020.06.08.06.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:30:41 -0700 (PDT)
Date: Mon, 8 Jun 2020 09:30:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH RFC v5 12/13] vhost/vsock: switch to the buf API
Message-ID: <20200608092953-mutt-send-email-mst@kernel.org>
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-13-mst@redhat.com>
 <20200608101746.xnxtwwygolsk7yol@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200608101746.xnxtwwygolsk7yol@steredhat>
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

On Mon, Jun 08, 2020 at 12:17:46PM +0200, Stefano Garzarella wrote:
> On Sun, Jun 07, 2020 at 10:11:49AM -0400, Michael S. Tsirkin wrote:
> > A straight-forward conversion.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> The changes for vsock part LGTM:
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> 
> I also did some tests with vhost-vsock (tools/testing/vsock/vsock_test
> and iperf-vsock), so for vsock:
> 
> Tested-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> Thanks,
> Stefano

Re-testing v6 would be very much appreciated.

> > 
> > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > index a483cec31d5c..61c6d3dd2ae3 100644
> > --- a/drivers/vhost/vsock.c
> > +++ b/drivers/vhost/vsock.c
> > @@ -103,7 +103,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> >  		unsigned out, in;
> >  		size_t nbytes;
> >  		size_t iov_len, payload_len;
> > -		int head;
> > +		struct vhost_buf buf;
> > +		int ret;
> >  
> >  		spin_lock_bh(&vsock->send_pkt_list_lock);
> >  		if (list_empty(&vsock->send_pkt_list)) {
> > @@ -117,16 +118,17 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> >  		list_del_init(&pkt->list);
> >  		spin_unlock_bh(&vsock->send_pkt_list_lock);
> >  
> > -		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> > -					 &out, &in, NULL, NULL);
> > -		if (head < 0) {
> > +		ret = vhost_get_avail_buf(vq, &buf,
> > +					  vq->iov, ARRAY_SIZE(vq->iov),
> > +					  &out, &in, NULL, NULL);
> > +		if (ret < 0) {
> >  			spin_lock_bh(&vsock->send_pkt_list_lock);
> >  			list_add(&pkt->list, &vsock->send_pkt_list);
> >  			spin_unlock_bh(&vsock->send_pkt_list_lock);
> >  			break;
> >  		}
> >  
> > -		if (head == vq->num) {
> > +		if (!ret) {
> >  			spin_lock_bh(&vsock->send_pkt_list_lock);
> >  			list_add(&pkt->list, &vsock->send_pkt_list);
> >  			spin_unlock_bh(&vsock->send_pkt_list_lock);
> > @@ -186,7 +188,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> >  		 */
> >  		virtio_transport_deliver_tap_pkt(pkt);
> >  
> > -		vhost_add_used(vq, head, sizeof(pkt->hdr) + payload_len);
> > +		buf.in_len = sizeof(pkt->hdr) + payload_len;
> > +		vhost_put_used_buf(vq, &buf);
> >  		added = true;
> >  
> >  		pkt->off += payload_len;
> > @@ -440,7 +443,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> >  	struct vhost_vsock *vsock = container_of(vq->dev, struct vhost_vsock,
> >  						 dev);
> >  	struct virtio_vsock_pkt *pkt;
> > -	int head, pkts = 0, total_len = 0;
> > +	int ret, pkts = 0, total_len = 0;
> > +	struct vhost_buf buf;
> >  	unsigned int out, in;
> >  	bool added = false;
> >  
> > @@ -461,12 +465,13 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> >  			goto no_more_replies;
> >  		}
> >  
> > -		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> > -					 &out, &in, NULL, NULL);
> > -		if (head < 0)
> > +		ret = vhost_get_avail_buf(vq, &buf,
> > +					  vq->iov, ARRAY_SIZE(vq->iov),
> > +					  &out, &in, NULL, NULL);
> > +		if (ret < 0)
> >  			break;
> >  
> > -		if (head == vq->num) {
> > +		if (!ret) {
> >  			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
> >  				vhost_disable_notify(&vsock->dev, vq);
> >  				continue;
> > @@ -494,7 +499,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> >  			virtio_transport_free_pkt(pkt);
> >  
> >  		len += sizeof(pkt->hdr);
> > -		vhost_add_used(vq, head, len);
> > +		buf.in_len = len;
> > +		vhost_put_used_buf(vq, &buf);
> >  		total_len += len;
> >  		added = true;
> >  	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> > -- 
> > MST
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
