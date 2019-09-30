Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF00C22E5
	for <lists.virtualization@lfdr.de>; Mon, 30 Sep 2019 16:12:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C8ADD19AA;
	Mon, 30 Sep 2019 14:12:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 553BA19A5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:12:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E13DD1FB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:12:41 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AFD7C04959E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:12:41 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id k184so6015733wmk.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 07:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=U7Vi6scFOY6hhqVA0cemS3cQSEC3brtnkAsLJZs+8us=;
	b=CJvkYEWori+FqT3cyq9gM3iZyRPj+nC8b+Ir2FW/mCqj3JqEU+9O7U2GSNZMRVJ8i7
	OmY5hCC+7s/fEdtKePEjYb7juYV/8k/odCTTmB+fteS8DCkBWbJctIdIjjyVSH9W37TS
	mw8TZu/tdImQ/0pJm9G8HJ9OwChW30XK59YGqLjflKsbE/hbPQrvWlwz/SB8q9WoE775
	kUpiC5Xi0YZs3NLw2cG4JpKkOPOc+VXg4qCh5oacd9lbN/dAF3hb5kvQNREaE7uYrG56
	FatE6+SEODhR1pj9YRWF9wHI/qHHnYb7zRpJAvrTXQ+djwvktpZGMEVR4t2hWtTc/Bzq
	kRzQ==
X-Gm-Message-State: APjAAAX3wOK7PkoJ34U6P7rZhJQtsNkt5BB38C7d+5ilJbBJqToj14Qv
	KlntFktnO6T+bPdvPc0LU/47IO4zCtMjV3bHXzNFHoU+3eZYPD+kMVvzaJ7I4TnfiTbp9bBNGv3
	AF/m1CctzRnmhy7tMeafz95+gTKrBC+sTBZK4ytlsTw==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr12746640wrs.368.1569852759896;
	Mon, 30 Sep 2019 07:12:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuBZfGK6lRi6GwfXTgTA8HHpv68vhrm6ZMForGt3w+ZiwRNEldTnLZexHFnR0clNvNiDrJgw==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr12746617wrs.368.1569852759679;
	Mon, 30 Sep 2019 07:12:39 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	u11sm14385252wmd.32.2019.09.30.07.12.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 07:12:38 -0700 (PDT)
Date: Mon, 30 Sep 2019 16:12:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Subject: Re: [PATCH v2] vsock/virtio: add support for MSG_PEEK
Message-ID: <20190930141236.lp3nroal33k63vlg@steredhat>
References: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
	<1569602663-16815-1-git-send-email-matiasevara@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569602663-16815-1-git-send-email-matiasevara@gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: eric.dumazet@gmail.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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

On Fri, Sep 27, 2019 at 04:44:23PM +0000, Matias Ezequiel Vara Larsen wrote:
> This patch adds support for MSG_PEEK. In such a case, packets are not
> removed from the rx_queue and credit updates are not sent.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
> ---
>  net/vmw_vsock/virtio_transport_common.c | 55 +++++++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 3 deletions(-)

The patch LGTM. As David pointed out, this patch should go into net-next.
Since now net-next is open, you can resend with net-next tag [1] and
with:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Tested-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

[1] https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 94cc0fa..cf15751 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -264,6 +264,55 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
>  }
>  
>  static ssize_t
> +virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> +				struct msghdr *msg,
> +				size_t len)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	struct virtio_vsock_pkt *pkt;
> +	size_t bytes, total = 0, off;
> +	int err = -EFAULT;
> +
> +	spin_lock_bh(&vvs->rx_lock);
> +
> +	list_for_each_entry(pkt, &vvs->rx_queue, list) {
> +		off = pkt->off;
> +
> +		if (total == len)
> +			break;
> +
> +		while (total < len && off < pkt->len) {
> +			bytes = len - total;
> +			if (bytes > pkt->len - off)
> +				bytes = pkt->len - off;
> +
> +			/* sk_lock is held by caller so no one else can dequeue.
> +			 * Unlock rx_lock since memcpy_to_msg() may sleep.
> +			 */
> +			spin_unlock_bh(&vvs->rx_lock);
> +
> +			err = memcpy_to_msg(msg, pkt->buf + off, bytes);
> +			if (err)
> +				goto out;
> +
> +			spin_lock_bh(&vvs->rx_lock);
> +
> +			total += bytes;
> +			off += bytes;
> +		}
> +	}
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
> @@ -330,9 +379,9 @@ virtio_transport_stream_dequeue(struct vsock_sock *vsk,
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
> -- 
> 2.7.4
> 

-- 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
