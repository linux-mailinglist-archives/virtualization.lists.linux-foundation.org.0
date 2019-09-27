Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951EC0191
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 10:55:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F34EED39;
	Fri, 27 Sep 2019 08:55:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51D88D09
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E0582B0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:55:18 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 327C683F3B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:55:18 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id a4so732280wrg.8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 01:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kQTiVTZ4Mq/mW2Kd0TK632A8br3BLFa78jUrRSmJlNc=;
	b=IDPjbqaMsUC6cD5kam2krChqI0Qzm5Jnyp/A0AksrVPJDse0S1XPluvMyUtegK8UFK
	tA4WH8QzvosmyLjDnMtnTqKTFX3SFrDt8WYbZQNzr1idWxOe/U2xK0pBKAITq4EGhz8O
	m44cJ2c2/UnhBlY/dmFri+MOrENyqmVCAsnMeRCwvSbs9S4nJUp9DEe2nOJvv+bf+dJs
	MZz8NLy8neZ8wH19RHdJdVnnmpSesoBXan/IKTL8yaCdYDzHbgAKriQWgs1NhIGCqQ4t
	2q+YJgEhEMluLVuw2oQ3ioykmf+COmPgAf7rXUVFMXaWptSaMVF6nYxOQ4Cn3HF6BjK3
	EZOQ==
X-Gm-Message-State: APjAAAWV+tAzB1ov/zmkLvOkGWpYJ7tHgQUz3aJT0F8z8h1I/gRbnWAb
	AXtAJh2jiHo2JbFMRAIzPAGOI5Bbg8nGR4+4Sa47PTRWghy6CQNRw6kWXPtHIL40NakyaBBieCT
	jIDaOwTBgSSvPnSNLBqdKiC7fFmUwIAtbBObpsx1YIQ==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr1850860wrq.139.1569574516915; 
	Fri, 27 Sep 2019 01:55:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKqarGeS37HsOdE4S4EFyv/G/LShaICk0WfDh7NPQYyW6JT3JqAigce82jij5WGe+7i863hg==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr1850844wrq.139.1569574516698; 
	Fri, 27 Sep 2019 01:55:16 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	d10sm5875238wma.42.2019.09.27.01.55.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 01:55:16 -0700 (PDT)
Date: Fri, 27 Sep 2019 10:55:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eric Dumazet <eric.dumazet@gmail.com>,
	Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Subject: Re: [PATCH] vsock/virtio: add support for MSG_PEEK
Message-ID: <20190927085513.tdiofiisrpyehfe5@steredhat.homenet.telecomitalia.it>
References: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
	<f069a65d-33b9-1fa8-d26e-b76cc51fc7cb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f069a65d-33b9-1fa8-d26e-b76cc51fc7cb@gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	davem@davemloft.net
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

On Thu, Sep 26, 2019 at 12:33:36PM -0700, Eric Dumazet wrote:
> 
> 
> On 9/26/19 11:23 AM, Matias Ezequiel Vara Larsen wrote:
> > This patch adds support for MSG_PEEK. In such a case, packets are not
> > removed from the rx_queue and credit updates are not sent.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
> > ---
> >  net/vmw_vsock/virtio_transport_common.c | 50 +++++++++++++++++++++++++++++++--
> >  1 file changed, 47 insertions(+), 3 deletions(-)
> > 
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> > index 94cc0fa..938f2ed 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> > @@ -264,6 +264,50 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
> >  }
> >  
> >  static ssize_t
> > +virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> > +				struct msghdr *msg,
> > +				size_t len)
> > +{
> > +	struct virtio_vsock_sock *vvs = vsk->trans;
> > +	struct virtio_vsock_pkt *pkt;
> > +	size_t bytes, total = 0;
> > +	int err = -EFAULT;
> > +
> > +	spin_lock_bh(&vvs->rx_lock);
> > +
> > +	list_for_each_entry(pkt, &vvs->rx_queue, list) {
> > +		if (total == len)
> > +			break;
> > +
> > +		bytes = len - total;
> > +		if (bytes > pkt->len - pkt->off)
> > +			bytes = pkt->len - pkt->off;
> > +
> > +		/* sk_lock is held by caller so no one else can dequeue.
> > +		 * Unlock rx_lock since memcpy_to_msg() may sleep.
> > +		 */
> > +		spin_unlock_bh(&vvs->rx_lock);
> > +
> > +		err = memcpy_to_msg(msg, pkt->buf + pkt->off, bytes);
> > +		if (err)
> > +			goto out;
> > +
> > +		spin_lock_bh(&vvs->rx_lock);
> > +
> > +		total += bytes;
> > +	}
> > +
> > +	spin_unlock_bh(&vvs->rx_lock);
> > +
> > +	return total;
> > +
> > +out:
> > +	if (total)
> > +		err = total;
> > +	return err;
> > +}
> >
> 
> This seems buggy to me.
> 
> virtio_transport_recv_enqueue() seems to be able to add payload to the last packet in the queue.
> 
> The loop you wrote here would miss newly added chunks while the vvs->rx_lock spinlock has been released.
> 
> virtio_transport_stream_do_dequeue() is ok, because it makes sure pkt->off == pkt->len
> before cleaning the packet from the queue.

Good catch!

Maybe we can solve in this way:

	list_for_each_entry(pkt, &vvs->rx_queue, list) {
		size_t off = pkt->off;

		if (total == len)
			break;

		while (total < len && off < pkt->len) {
			/* using 'off' instead of 'pkt->off' */
			...

			total += bytes;
			off += bytes;
		}
	}

What do you think?

Cheers,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
