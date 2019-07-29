Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0546278D6D
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 16:06:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A6E2E1961;
	Mon, 29 Jul 2019 14:06:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2572218EF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 14:04:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7567C2C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 14:04:35 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d17so59647328qtj.8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 07:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=9TGrSWXBSPwHy8jYtphhW0dEmj0QZhEapSIaBCYSsds=;
	b=LF9WYaL3C4ZIfZ7y1pwBxWt4/CNGeZOQS/4g8S62wg8P3+NRHw/09/CgxG1XxVpuCq
	yq0AlgfBbVy5GCPOb59AWsYaev2xk6LhA47jc0IP2ofh8zm6FAulfgaEJLfKMxWQmtWF
	0df2TyilLGSVvtcnCR0NerAut0Y7JC2t8j/+Ar10SDWR3UOiSKue+RaQjfHJn92GWwng
	Sm3I3k8KjpERM+DKi494s7u+cjwdyS6reJvtY5Q5MtuNvD9Wvd8JjnH+u7y7apmtkEwO
	ZnYpOhCG8yJgXbCKW24AwAZPfnrKTufb3/GcQTF1SVNBfTgOvLemhXAvHa9zyR3SSn3i
	Nqow==
X-Gm-Message-State: APjAAAVSlGxUp2qSRUNHqLiB9+CJjuEKo4BR/zIvCtcjgd4KqIGk5eg4
	PSpt/FIvABusg6eIn8ABPuy9vA==
X-Google-Smtp-Source: APXvYqxjkWPX2jNn/Dzz4DX/RzsFfIydjYDR0yXBAhz1UUZ7xlpbws8nDmZPX4DMGukA3N0rsbT+uA==
X-Received: by 2002:ac8:333d:: with SMTP id t58mr79478835qta.167.1564409074630;
	Mon, 29 Jul 2019 07:04:34 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	f25sm32100187qta.81.2019.07.29.07.04.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 07:04:33 -0700 (PDT)
Date: Mon, 29 Jul 2019 10:04:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190729095956-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717113030.163499-2-sgarzare@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
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

On Wed, Jul 17, 2019 at 01:30:26PM +0200, Stefano Garzarella wrote:
> Since virtio-vsock was introduced, the buffers filled by the host
> and pushed to the guest using the vring, are directly queued in
> a per-socket list. These buffers are preallocated by the guest
> with a fixed size (4 KB).
> 
> The maximum amount of memory used by each socket should be
> controlled by the credit mechanism.
> The default credit available per-socket is 256 KB, but if we use
> only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> buffers, using up to 1 GB of memory per-socket. In addition, the
> guest will continue to fill the vring with new 4 KB free buffers
> to avoid starvation of other sockets.
> 
> This patch mitigates this issue copying the payload of small
> packets (< 128 bytes) into the buffer of last packet queued, in
> order to avoid wasting memory.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

This is good enough for net-next, but for net I think we
should figure out how to address the issue completely.
Can we make the accounting precise? What happens to
performance if we do?


> ---
>  drivers/vhost/vsock.c                   |  2 +
>  include/linux/virtio_vsock.h            |  1 +
>  net/vmw_vsock/virtio_transport.c        |  1 +
>  net/vmw_vsock/virtio_transport_common.c | 60 +++++++++++++++++++++----
>  4 files changed, 55 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 6a50e1d0529c..6c8390a2af52 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -329,6 +329,8 @@ vhost_vsock_alloc_pkt(struct vhost_virtqueue *vq,
>  		return NULL;
>  	}
>  
> +	pkt->buf_len = pkt->len;
> +
>  	nbytes = copy_from_iter(pkt->buf, pkt->len, &iov_iter);
>  	if (nbytes != pkt->len) {
>  		vq_err(vq, "Expected %u byte payload, got %zu bytes\n",
> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> index e223e2632edd..7d973903f52e 100644
> --- a/include/linux/virtio_vsock.h
> +++ b/include/linux/virtio_vsock.h
> @@ -52,6 +52,7 @@ struct virtio_vsock_pkt {
>  	/* socket refcnt not held, only use for cancellation */
>  	struct vsock_sock *vsk;
>  	void *buf;
> +	u32 buf_len;
>  	u32 len;
>  	u32 off;
>  	bool reply;
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> index 0815d1357861..082a30936690 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -307,6 +307,7 @@ static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
>  			break;
>  		}
>  
> +		pkt->buf_len = buf_len;
>  		pkt->len = buf_len;
>  
>  		sg_init_one(&hdr, &pkt->hdr, sizeof(pkt->hdr));
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 6f1a8aff65c5..095221f94786 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -26,6 +26,9 @@
>  /* How long to wait for graceful shutdown of a connection */
>  #define VSOCK_CLOSE_TIMEOUT (8 * HZ)
>  
> +/* Threshold for detecting small packets to copy */
> +#define GOOD_COPY_LEN  128
> +
>  static const struct virtio_transport *virtio_transport_get_ops(void)
>  {
>  	const struct vsock_transport *t = vsock_core_get_transport();
> @@ -64,6 +67,9 @@ virtio_transport_alloc_pkt(struct virtio_vsock_pkt_info *info,
>  		pkt->buf = kmalloc(len, GFP_KERNEL);
>  		if (!pkt->buf)
>  			goto out_pkt;
> +
> +		pkt->buf_len = len;
> +
>  		err = memcpy_from_msg(pkt->buf, info->msg, len);
>  		if (err)
>  			goto out;
> @@ -841,24 +847,60 @@ virtio_transport_recv_connecting(struct sock *sk,
>  	return err;
>  }
>  
> +static void
> +virtio_transport_recv_enqueue(struct vsock_sock *vsk,
> +			      struct virtio_vsock_pkt *pkt)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	bool free_pkt = false;
> +
> +	pkt->len = le32_to_cpu(pkt->hdr.len);
> +	pkt->off = 0;
> +
> +	spin_lock_bh(&vvs->rx_lock);
> +
> +	virtio_transport_inc_rx_pkt(vvs, pkt);
> +
> +	/* Try to copy small packets into the buffer of last packet queued,
> +	 * to avoid wasting memory queueing the entire buffer with a small
> +	 * payload.
> +	 */
> +	if (pkt->len <= GOOD_COPY_LEN && !list_empty(&vvs->rx_queue)) {
> +		struct virtio_vsock_pkt *last_pkt;
> +
> +		last_pkt = list_last_entry(&vvs->rx_queue,
> +					   struct virtio_vsock_pkt, list);
> +
> +		/* If there is space in the last packet queued, we copy the
> +		 * new packet in its buffer.
> +		 */
> +		if (pkt->len <= last_pkt->buf_len - last_pkt->len) {
> +			memcpy(last_pkt->buf + last_pkt->len, pkt->buf,
> +			       pkt->len);
> +			last_pkt->len += pkt->len;
> +			free_pkt = true;
> +			goto out;
> +		}
> +	}
> +
> +	list_add_tail(&pkt->list, &vvs->rx_queue);
> +
> +out:
> +	spin_unlock_bh(&vvs->rx_lock);
> +	if (free_pkt)
> +		virtio_transport_free_pkt(pkt);
> +}
> +
>  static int
>  virtio_transport_recv_connected(struct sock *sk,
>  				struct virtio_vsock_pkt *pkt)
>  {
>  	struct vsock_sock *vsk = vsock_sk(sk);
> -	struct virtio_vsock_sock *vvs = vsk->trans;
>  	int err = 0;
>  
>  	switch (le16_to_cpu(pkt->hdr.op)) {
>  	case VIRTIO_VSOCK_OP_RW:
> -		pkt->len = le32_to_cpu(pkt->hdr.len);
> -		pkt->off = 0;
> -
> -		spin_lock_bh(&vvs->rx_lock);
> -		virtio_transport_inc_rx_pkt(vvs, pkt);
> -		list_add_tail(&pkt->list, &vvs->rx_queue);
> -		spin_unlock_bh(&vvs->rx_lock);
> -
> +		virtio_transport_recv_enqueue(vsk, pkt);
>  		sk->sk_data_ready(sk);
>  		return err;
>  	case VIRTIO_VSOCK_OP_CREDIT_UPDATE:
> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
