Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5071F1D39
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 18:26:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4E2D86970;
	Mon,  8 Jun 2020 16:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sNb2Ar6+uRY; Mon,  8 Jun 2020 16:26:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87CAF86CD7;
	Mon,  8 Jun 2020 16:26:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C2C9C016F;
	Mon,  8 Jun 2020 16:26:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44129C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 16:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3FD7C87EA0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 16:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqePsey2yCON
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 16:26:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3C09F87D98
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591633574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PfesJHBEui5hetw3RxW9+nGTdupwdIhkqQYIwcx4mZo=;
 b=Jk1cwy+QA7WBbsrg7tkJkNAAQ3EL7kkAY17+JidtW0iGNrQ4DxEoq94DCT/pXRF5e9qyZ5
 ArWa2k0nW5pP7+7r+JzGdl9z+F2pP1A5hlxSweBoljlhLjmI/8HDKwMK0JHqEVQPCOWTuJ
 UoPBNlc+QCVcaaVFZ/1yjR/tuu0O+0Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-QPIGdfx8MPyWLqF4G9bu3Q-1; Mon, 08 Jun 2020 12:26:12 -0400
X-MC-Unique: QPIGdfx8MPyWLqF4G9bu3Q-1
Received: by mail-wr1-f72.google.com with SMTP id e1so7394755wrm.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 09:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PfesJHBEui5hetw3RxW9+nGTdupwdIhkqQYIwcx4mZo=;
 b=JXVhi6Dph4Iwc3tEpacd+BBv/l4QjkTFD399sWLSpNOrxciU1udhKVF/GtD6Di3JWZ
 4wj8Eul6mcHg8349mOa7ybSprT4PuucXbBGhvbo1LW+mWlfIwr7daMUgMSzRBHY0QhXX
 USKu7Zw5qDUPiGzKgkHNyTxiC9LuiTneb8hjt3C7xBZiaV5TKAx4L4l1UzztoWqqrAkB
 ACS68gUWJJMJKnRyyQf4DNRX3nSMruJuKvjLxDcMYrB4OTkO5Dk1//kp2b3VS2qagY6M
 SKGhLrh4Sxh9kLU7IORtlqingHQy2eI9QRiLL4DAqpcd0GhOqZBscB6WYcpDUkOSkBL3
 eCBw==
X-Gm-Message-State: AOAM531CY3e8XB3QgkXpGrUJMRoDp82rXAz//3i6BWGrvs6owkliLaiR
 vY7hDzUX+5gyG0O65++bVRmHjpqcsYw3nAOYInQAQsX51/CQJN5iiF+7YNOGTW6nIWzi70Mwy7Q
 QwqvkvQlFTTUHtEMir4eWY27tdxWzVSqYvgg8sO+/Fw==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr151287wma.158.1591633571882;
 Mon, 08 Jun 2020 09:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMODrjwl3uJvjfo1A6dRDqHo2iDzOMSyj2EtMN5BDt+YBK8zUVruK6nz7/OV+XRdPj9GQbLA==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr151258wma.158.1591633571606;
 Mon, 08 Jun 2020 09:26:11 -0700 (PDT)
Received: from steredhat ([79.49.207.108])
 by smtp.gmail.com with ESMTPSA id k21sm270313wrd.24.2020.06.08.09.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:26:10 -0700 (PDT)
Date: Mon, 8 Jun 2020 18:26:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC v5 12/13] vhost/vsock: switch to the buf API
Message-ID: <20200608162608.gk2fpebujpvmkzpc@steredhat>
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-13-mst@redhat.com>
 <20200608101746.xnxtwwygolsk7yol@steredhat>
 <20200608092953-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200608092953-mutt-send-email-mst@kernel.org>
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

On Mon, Jun 08, 2020 at 09:30:38AM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 08, 2020 at 12:17:46PM +0200, Stefano Garzarella wrote:
> > On Sun, Jun 07, 2020 at 10:11:49AM -0400, Michael S. Tsirkin wrote:
> > > A straight-forward conversion.
> > > 
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  drivers/vhost/vsock.c | 30 ++++++++++++++++++------------
> > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > The changes for vsock part LGTM:
> > 
> > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > 
> > I also did some tests with vhost-vsock (tools/testing/vsock/vsock_test
> > and iperf-vsock), so for vsock:
> > 
> > Tested-by: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > Thanks,
> > Stefano
> 
> Re-testing v6 would be very much appreciated.

Sure, I'm building v6 now and I'll send you a feedback :-)

Stefano

> 
> > > 
> > > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > > index a483cec31d5c..61c6d3dd2ae3 100644
> > > --- a/drivers/vhost/vsock.c
> > > +++ b/drivers/vhost/vsock.c
> > > @@ -103,7 +103,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> > >  		unsigned out, in;
> > >  		size_t nbytes;
> > >  		size_t iov_len, payload_len;
> > > -		int head;
> > > +		struct vhost_buf buf;
> > > +		int ret;
> > >  
> > >  		spin_lock_bh(&vsock->send_pkt_list_lock);
> > >  		if (list_empty(&vsock->send_pkt_list)) {
> > > @@ -117,16 +118,17 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> > >  		list_del_init(&pkt->list);
> > >  		spin_unlock_bh(&vsock->send_pkt_list_lock);
> > >  
> > > -		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> > > -					 &out, &in, NULL, NULL);
> > > -		if (head < 0) {
> > > +		ret = vhost_get_avail_buf(vq, &buf,
> > > +					  vq->iov, ARRAY_SIZE(vq->iov),
> > > +					  &out, &in, NULL, NULL);
> > > +		if (ret < 0) {
> > >  			spin_lock_bh(&vsock->send_pkt_list_lock);
> > >  			list_add(&pkt->list, &vsock->send_pkt_list);
> > >  			spin_unlock_bh(&vsock->send_pkt_list_lock);
> > >  			break;
> > >  		}
> > >  
> > > -		if (head == vq->num) {
> > > +		if (!ret) {
> > >  			spin_lock_bh(&vsock->send_pkt_list_lock);
> > >  			list_add(&pkt->list, &vsock->send_pkt_list);
> > >  			spin_unlock_bh(&vsock->send_pkt_list_lock);
> > > @@ -186,7 +188,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
> > >  		 */
> > >  		virtio_transport_deliver_tap_pkt(pkt);
> > >  
> > > -		vhost_add_used(vq, head, sizeof(pkt->hdr) + payload_len);
> > > +		buf.in_len = sizeof(pkt->hdr) + payload_len;
> > > +		vhost_put_used_buf(vq, &buf);
> > >  		added = true;
> > >  
> > >  		pkt->off += payload_len;
> > > @@ -440,7 +443,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> > >  	struct vhost_vsock *vsock = container_of(vq->dev, struct vhost_vsock,
> > >  						 dev);
> > >  	struct virtio_vsock_pkt *pkt;
> > > -	int head, pkts = 0, total_len = 0;
> > > +	int ret, pkts = 0, total_len = 0;
> > > +	struct vhost_buf buf;
> > >  	unsigned int out, in;
> > >  	bool added = false;
> > >  
> > > @@ -461,12 +465,13 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> > >  			goto no_more_replies;
> > >  		}
> > >  
> > > -		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
> > > -					 &out, &in, NULL, NULL);
> > > -		if (head < 0)
> > > +		ret = vhost_get_avail_buf(vq, &buf,
> > > +					  vq->iov, ARRAY_SIZE(vq->iov),
> > > +					  &out, &in, NULL, NULL);
> > > +		if (ret < 0)
> > >  			break;
> > >  
> > > -		if (head == vq->num) {
> > > +		if (!ret) {
> > >  			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
> > >  				vhost_disable_notify(&vsock->dev, vq);
> > >  				continue;
> > > @@ -494,7 +499,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> > >  			virtio_transport_free_pkt(pkt);
> > >  
> > >  		len += sizeof(pkt->hdr);
> > > -		vhost_add_used(vq, head, len);
> > > +		buf.in_len = len;
> > > +		vhost_put_used_buf(vq, &buf);
> > >  		total_len += len;
> > >  		added = true;
> > >  	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> > > -- 
> > > MST
> > > 
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
