Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E40EBBAEC9
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 09:58:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EC8AEC64;
	Mon, 23 Sep 2019 07:58:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CB277C00
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 07:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5CBB38B9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 07:58:36 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82D127BDA5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 07:58:35 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id q10so4508588wro.22
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 00:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9WKA+WhADA6m5tO2INYGO3d/2B7vs6iFqq3kcuFfazA=;
	b=U6qsdLVTfenSW6E6X1MoEOBD9s2itaz0xaj9nvRt6VcyDKmTzFkgUBK4EOF0m7P3aJ
	iJ+d3as9CwTepHWqTiujzkiKGnz4Ejs6zC4NpP4aHQwdqCx7QCu5dFxs6gkAxOWaKHpw
	+cB0G25YYy9Tur6d8p2DMhazc+qYhd7MgISxDFCRq+RS45gN7bU8535NQNDSD5zn0wGO
	rLQ5XjriM1x9TL9x3Fn680IFFiQRR+fFqDF7UMTKL1EhMCMJwHQYUas+vaxCyIESTkPv
	85IMLVdT58YGE8bFeGYAY9Ze/rKhmBfRgRvu5D2x1XBY9C32guf33TpgGESpd4EEtj91
	SxAQ==
X-Gm-Message-State: APjAAAVnm+8Zer3YhFWJ8/TljmGWm8b3n2W06kJJG30jrdG+J+FVjyHf
	6GUb54G7Xv5YmNSzN+sdA41X5Rmx05z8N2ASrvr6ox45Zd1DxAN8SE/EiDaH30WHIEhcN6YSXtk
	RpBfLO9pEUJ6AIJ3g5rjVB40d3jeBkHaGXc/88UXi2g==
X-Received: by 2002:a1c:6508:: with SMTP id z8mr13334119wmb.93.1569225514193; 
	Mon, 23 Sep 2019 00:58:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywRzpbSPc3I/T0HiQ3vLyqomtoGHN75D+xXsibaZU6MPSciXTHKp4KwamMtyvbmdFON3ncxg==
X-Received: by 2002:a1c:6508:: with SMTP id z8mr13334103wmb.93.1569225513884; 
	Mon, 23 Sep 2019 00:58:33 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
	[79.36.61.170]) by smtp.gmail.com with ESMTPSA id
	l18sm11651891wrc.18.2019.09.23.00.58.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 00:58:33 -0700 (PDT)
Date: Mon, 23 Sep 2019 09:58:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Subject: Re: [RFC] VSOCK: add support for MSG_PEEK
Message-ID: <20190923075830.a6sjwffnkljmyyqm@steredhat>
References: <1569174507-15267-1-git-send-email-matiasevara@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569174507-15267-1-git-send-email-matiasevara@gmail.com>
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

Hi Matias,
thanks for this patch!

Since this patch only concerns virtio_transport,
I'd use the 'vsock/virtio' prefix in the commit title:
"vsock/virtio: add support for MSG_PEEK"

Some comments below:

On Sun, Sep 22, 2019 at 05:48:27PM +0000, Matias Ezequiel Vara Larsen wrote:
> This patch adds support for MSG_PEEK. In such a case, packets are not
> removed from the rx_queue and credit updates are not sent.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
> ---
>  net/vmw_vsock/virtio_transport_common.c | 59 +++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 94cc0fa..830e890 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -264,6 +264,59 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
>  }
>  
>  static ssize_t
> +virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> +				struct msghdr *msg,
> +				size_t len)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	struct virtio_vsock_pkt *pkt;
> +	size_t bytes, off = 0, total = 0;
> +	int err = -EFAULT;
> +
> +	spin_lock_bh(&vvs->rx_lock);
> +

What about using list_for_each_entry() to cycle through the queued packets?

> +	if (list_empty(&vvs->rx_queue)) {
> +		spin_unlock_bh(&vvs->rx_lock);
> +		return 0;
> +	}
> +
> +	pkt = list_first_entry(&vvs->rx_queue,
> +			       struct virtio_vsock_pkt, list);
> +	do {

pkt->off contains the offset inside the packet where the unread data starts.
So here we should initialize 'off':

		off = pkt->off;

Or just use pkt->off later (without increasing it as in the dequeue).

> +		bytes = len - total;
> +		if (bytes > pkt->len - off)
> +			bytes = pkt->len - off;
> +
> +		/* sk_lock is held by caller so no one else can dequeue.
> +		 * Unlock rx_lock since memcpy_to_msg() may sleep.
> +		 */
> +		spin_unlock_bh(&vvs->rx_lock);
> +
> +		err = memcpy_to_msg(msg, pkt->buf + off, bytes);
> +		if (err)
> +			goto out;
> +
> +		spin_lock_bh(&vvs->rx_lock);
> +
> +		total += bytes;

Using list_for_each_entry(), here we can just do:
(or better, at the beginning of the cycle)

		if (total == len)
			break;

removing the next part...

> +		off += bytes;
> +		if (off == pkt->len) {
> +			pkt = list_next_entry(pkt, list);
> +			off = 0;
> +		}
> +	} while ((total < len) && !list_is_first(&pkt->list, &vvs->rx_queue));

...until here.

> +
> +	spin_unlock_bh(&vvs->rx_lock);
> +
> +	return total;
> +
> +out:
> +	if (total)
> +		err = total;
> +	return err;
> +}
> +
> +static ssize_t
>  virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
>  				   struct msghdr *msg,
>  				   size_t len)
> @@ -330,9 +383,9 @@ virtio_transport_stream_dequeue(struct vsock_sock *vsk,
>  				size_t len, int flags)
>  {
>  	if (flags & MSG_PEEK)
> -		return -EOPNOTSUPP;
> -
> -	return virtio_transport_stream_do_dequeue(vsk, msg, len);
> +		return virtio_transport_stream_do_peek(vsk, msg, len);
> +	else
> +		return virtio_transport_stream_do_dequeue(vsk, msg, len);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_stream_dequeue);
>  

The rest looks good to me!

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
