Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A58BFA28
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 21:33:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BE086CA6;
	Thu, 26 Sep 2019 19:33:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 85BC0CA6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 19:33:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 353B78AA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 19:33:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q12so78246pff.9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YNVcgmXz/4TZ89qYi72xdZ0yUZGHtVYXxe8ksb5z6rQ=;
	b=LQcKNvFcjhf52vkDhChHAvJBub24+VVIdIOAN7luWyloJjj814Bt3XCZXIbMU8zj01
	kS1rwkcd2Bg4aPyF0iZm2ti7VXkcCN03q0gQZdi2CTCJZW4UnpQfDmO6u1cIEeN8yyUD
	rU8aQCPP7+ctSxT69wkStouEDALcngcJwVngjR7FkKHWFb8zuKRBB8jtYDII4mzB8EaY
	KgJhQiVnwigoAvPDwF1NzdmCHQHJ9vSStF1HWIbSxnP7TcwpxT5P8YdIdrPPhrFudLzN
	g0jNanX52MuZ6WBfXHPxRwuYD55Gs3lM6BBD/0heBQ112rVUjXhYL1F6zlPm/unQAp35
	3yIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YNVcgmXz/4TZ89qYi72xdZ0yUZGHtVYXxe8ksb5z6rQ=;
	b=o6TH212L2gyOalCko6Mh4j9LJyq0GUKigqGCrj/mIcdiPOn9IuJi3Xtz8DzgdJdOhq
	5R4nkUZcUvy5KMZblXDIecwrQBf9zWo8cmgY7B5w9H8Rb9b3aCuIm3b5UW59V96HHVBQ
	l1s6xYhgt7txiRjp/69Rgo3vjdDeIj/vMbwksl2hG7piqzt2PQhX6AwbyvJYgaA74N0n
	xqi6zoK6/MMg+fz32qotzU5p8rCUhxvEfZmLkvnRfUTKY9vOSKEc8o9ugRhUeIcK98Fm
	adGxvecVDcjkvp9Mt81gFRtTEZ/l8ShQER3hcCTUCAS6ZApw3qiF2s8cwOnflWkiUb+p
	8/BQ==
X-Gm-Message-State: APjAAAU8sZYBWrmjzrWmrcfaznYeSP2n8EJWdWiLJ1i7Wtsy6+vGtR/I
	M8/B2ZwSiPu9FGGysjQsFyU=
X-Google-Smtp-Source: APXvYqwVC8CgaBAaZrZp18sW5w1ajggjrTQ+D9LBCv7HM3iy9PqeXuOf37BaQp134FgDRzhrNV1kIg==
X-Received: by 2002:a17:90a:cf0c:: with SMTP id
	h12mr5257802pju.110.1569526418858; 
	Thu, 26 Sep 2019 12:33:38 -0700 (PDT)
Received: from ?IPv6:2620:15c:2c1:200:55c7:81e6:c7d8:94b?
	([2620:15c:2c1:200:55c7:81e6:c7d8:94b])
	by smtp.gmail.com with ESMTPSA id
	v12sm2984732pgr.31.2019.09.26.12.33.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 26 Sep 2019 12:33:37 -0700 (PDT)
Subject: Re: [PATCH] vsock/virtio: add support for MSG_PEEK
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>, stefanha@redhat.com
References: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <f069a65d-33b9-1fa8-d26e-b76cc51fc7cb@gmail.com>
Date: Thu, 26 Sep 2019 12:33:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net,
	sgarzare@redhat.com
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



On 9/26/19 11:23 AM, Matias Ezequiel Vara Larsen wrote:
> This patch adds support for MSG_PEEK. In such a case, packets are not
> removed from the rx_queue and credit updates are not sent.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
> ---
>  net/vmw_vsock/virtio_transport_common.c | 50 +++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 94cc0fa..938f2ed 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -264,6 +264,50 @@ static int virtio_transport_send_credit_update(struct vsock_sock *vsk,
>  }
>  
>  static ssize_t
> +virtio_transport_stream_do_peek(struct vsock_sock *vsk,
> +				struct msghdr *msg,
> +				size_t len)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	struct virtio_vsock_pkt *pkt;
> +	size_t bytes, total = 0;
> +	int err = -EFAULT;
> +
> +	spin_lock_bh(&vvs->rx_lock);
> +
> +	list_for_each_entry(pkt, &vvs->rx_queue, list) {
> +		if (total == len)
> +			break;
> +
> +		bytes = len - total;
> +		if (bytes > pkt->len - pkt->off)
> +			bytes = pkt->len - pkt->off;
> +
> +		/* sk_lock is held by caller so no one else can dequeue.
> +		 * Unlock rx_lock since memcpy_to_msg() may sleep.
> +		 */
> +		spin_unlock_bh(&vvs->rx_lock);
> +
> +		err = memcpy_to_msg(msg, pkt->buf + pkt->off, bytes);
> +		if (err)
> +			goto out;
> +
> +		spin_lock_bh(&vvs->rx_lock);
> +
> +		total += bytes;
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
>

This seems buggy to me.

virtio_transport_recv_enqueue() seems to be able to add payload to the last packet in the queue.

The loop you wrote here would miss newly added chunks while the vvs->rx_lock spinlock has been released.

virtio_transport_stream_do_dequeue() is ok, because it makes sure pkt->off == pkt->len
before cleaning the packet from the queue.



_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
