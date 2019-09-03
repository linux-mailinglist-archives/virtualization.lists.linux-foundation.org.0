Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA67A6284
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 09:31:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 512EACA8;
	Tue,  3 Sep 2019 07:31:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6A30C9E
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:31:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF2FC709
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:31:26 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C320C369CC
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:31:25 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a17so9958804wrr.10
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 00:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vIdlVo3wzaAg7+E51hvuCmhSjy3lqZ2GvkawXNng+DY=;
	b=YAh+jBfa/DiY64sA3Jxmu5A4dMLj8YKS0W1X7iqlL3LYLUcYl8Ht9qTSP/9HGlxARY
	JxcsO/x/xH/0Zrg1PmC2zWzmOaUz8pk4ZODYd6RHQnMmxGbwWLErPG26lXrzNkv6jnp/
	kzKhz3G67u2wtSMZjuhrj7RnrjJSCXsjUNXupVFov3dlChVSY6X1PZACrbSohAdPuLjy
	ZYb03DJAfkF9H09sTow3RFMEaAqgDWTSCWfO1FzE215IQvASIZH57e552ivW+0VKpAh8
	ABPWq6E9Xjchu89kFLrBXamL6MUH7ZBYjI9+thCUUqKMnWXUYuzuUd67guUwH2zwVnve
	NoIA==
X-Gm-Message-State: APjAAAUseS+p5yRV3txXjCnmE6jSTB1Euc5u2XDT6ntLagx7q1/XgoaP
	wqY7zCsE7e7zgz/jRZj6fdUfEOOtk0kgfMjmErg5Hh3YD7mVBHJfvtRN2VykeJpW+aVqXCDEqgI
	l3xCPstwQBE7bVFlHxhmiyn/yRIQX/QoNZrtraxogCw==
X-Received: by 2002:adf:8043:: with SMTP id 61mr35027590wrk.115.1567495884505; 
	Tue, 03 Sep 2019 00:31:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeFTpVz+dse95eWq0nocs/IG2NKjpvXX30eGt/rJU82VMrZ0Bsyy+QcPwkIDLVpATtIdNOPA==
X-Received: by 2002:adf:8043:: with SMTP id 61mr35027562wrk.115.1567495884199; 
	Tue, 03 Sep 2019 00:31:24 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
	[79.36.61.170]) by smtp.gmail.com with ESMTPSA id
	v8sm34676506wra.79.2019.09.03.00.31.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 00:31:23 -0700 (PDT)
Date: Tue, 3 Sep 2019 09:31:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 2/5] vsock/virtio: reduce credit update messages
Message-ID: <20190903073120.kefllalytkvidcvh@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-3-sgarzare@redhat.com>
	<20190903003050-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903003050-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Sep 03, 2019 at 12:38:02AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 17, 2019 at 01:30:27PM +0200, Stefano Garzarella wrote:
> > In order to reduce the number of credit update messages,
> > we send them only when the space available seen by the
> > transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  include/linux/virtio_vsock.h            |  1 +
> >  net/vmw_vsock/virtio_transport_common.c | 16 +++++++++++++---
> >  2 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> > index 7d973903f52e..49fc9d20bc43 100644
> > --- a/include/linux/virtio_vsock.h
> > +++ b/include/linux/virtio_vsock.h
> > @@ -41,6 +41,7 @@ struct virtio_vsock_sock {
> >  
> >  	/* Protected by rx_lock */
> >  	u32 fwd_cnt;
> > +	u32 last_fwd_cnt;
> >  	u32 rx_bytes;
> >  	struct list_head rx_queue;
> >  };
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> > index 095221f94786..a85559d4d974 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> > @@ -211,6 +211,7 @@ static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
> >  void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt)
> >  {
> >  	spin_lock_bh(&vvs->tx_lock);
> > +	vvs->last_fwd_cnt = vvs->fwd_cnt;
> >  	pkt->hdr.fwd_cnt = cpu_to_le32(vvs->fwd_cnt);
> >  	pkt->hdr.buf_alloc = cpu_to_le32(vvs->buf_alloc);
> >  	spin_unlock_bh(&vvs->tx_lock);
> > @@ -261,6 +262,7 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
> >  	struct virtio_vsock_sock *vvs = vsk->trans;
> >  	struct virtio_vsock_pkt *pkt;
> >  	size_t bytes, total = 0;
> > +	u32 free_space;
> >  	int err = -EFAULT;
> >  
> >  	spin_lock_bh(&vvs->rx_lock);
> > @@ -291,11 +293,19 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
> >  			virtio_transport_free_pkt(pkt);
> >  		}
> >  	}
> > +
> > +	free_space = vvs->buf_alloc - (vvs->fwd_cnt - vvs->last_fwd_cnt);
> > +
> >  	spin_unlock_bh(&vvs->rx_lock);
> >  
> > -	/* Send a credit pkt to peer */
> > -	virtio_transport_send_credit_update(vsk, VIRTIO_VSOCK_TYPE_STREAM,
> > -					    NULL);
> > +	/* We send a credit update only when the space available seen
> > +	 * by the transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE
> 
> This is just repeating what code does though.
> Please include the *reason* for the condition.
> E.g. here's a better comment:
> 
> 	/* To reduce number of credit update messages,
> 	 * don't update credits as long as lots of space is available.
> 	 * Note: the limit chosen here is arbitrary. Setting the limit
> 	 * too high causes extra messages. Too low causes transmitter
> 	 * stalls. As stalls are in theory more expensive than extra
> 	 * messages, we set the limit to a high value. TODO: experiment
> 	 * with different values.
> 	 */
> 

Yes, it is better, sorry for that. I'll try to avoid unnecessary comments,
explaining the reason for certain changes.

Since this patch is already queued in net-next, should I send another
patch to fix the comment?

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
