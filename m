Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C7D42FB
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 16:34:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 279361A61;
	Fri, 11 Oct 2019 14:34:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D90211A4B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB2518AC
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:26:41 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 502E99B28C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:26:41 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id w7so9056025qkf.10
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 07:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=u9P7ZH+Y5VJTavkHr+ZiIN7ARusJlNnypFrPGuqGbsc=;
	b=ItZYh7P9/y3xlu2Lz1Il7tU0F9QlIAZ/px/43AfEx7ABqqM5JJK9twmoPwIO4Z9KuI
	QNWT4qnIxZ+plpPst6x4cA+hgHFumNCs6i7/njDYYkuZIsMvh3v7BLdjxubvbfM9UzV1
	mMiBF24AG7a5cq/4tMabQPdDIWNdBNCduocgywjlsBY0QlNJb9yM4dVUsfci1c0HxA96
	BGFeJ9+O9787oLRrLrlow950y74arSj56/9mf6oEvnewKSVdBisr/iAdWNBhktdt3pTY
	BBWoYimyp4NwkLLoqC4M0Qa8EFUnHMm2lUJMS3sUfNBJEKbIEgnVvK78BbEWDYHWyMo4
	5brw==
X-Gm-Message-State: APjAAAW9kPh6630oX7bEGMaRuGI8ddz1xIbyFIJy4SfUi1ROv07AYa5p
	5HmfAvIYYhi64MovgZiab8RfTCl/IsEokLxWeVy5tnoNdYgnC6i+d0np2wAQorSB0RUNtGAwyD9
	Y1+kGwmT3xHGcBELQ/uGLWgoYQ+kKfNG5iEI6NHSwrg==
X-Received: by 2002:a37:6114:: with SMTP id v20mr16560724qkb.329.1570804000581;
	Fri, 11 Oct 2019 07:26:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRQu0tWlUWQUkl0Snv5crytJ8wM4hPrKuPA7AXRTavuKo53VLfKGDp3FcKv1ZsSQwyKNvQTQ==
X-Received: by 2002:a37:6114:: with SMTP id v20mr16560681qkb.329.1570804000320;
	Fri, 11 Oct 2019 07:26:40 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	i30sm4661684qte.27.2019.10.11.07.26.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 07:26:39 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:26:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net 2/2] vhost/vsock: don't allow half-closed socket in
	the host
Message-ID: <20191011102246-mutt-send-email-mst@kernel.org>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011130758.22134-3-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011130758.22134-3-sgarzare@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adit Ranadive <aditr@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Fri, Oct 11, 2019 at 03:07:58PM +0200, Stefano Garzarella wrote:
> vmci_transport never allowed half-closed socket on the host side.
> In order to provide the same behaviour, we changed the
> vhost_transport_stream_has_data() to return 0 (no data available)
> if the peer (guest) closed the connection.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

I don't think we should copy bugs like this.
Applications don't actually depend on this VMCI limitation, in fact
it looks like a working application can get broken by this.

So this looks like a userspace visible ABI change
which we can't really do.

If it turns out some application cares, it can always
fully close the connection. Or add an ioctl so the application
can find out whether half close works.

> ---
>  drivers/vhost/vsock.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 9f57736fe15e..754120aa4478 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -58,6 +58,21 @@ static u32 vhost_transport_get_local_cid(void)
>  	return VHOST_VSOCK_DEFAULT_HOST_CID;
>  }
>  
> +static s64 vhost_transport_stream_has_data(struct vsock_sock *vsk)
> +{
> +	/* vmci_transport doesn't allow half-closed socket on the host side.
> +	 * recv() on the host side returns EOF when the guest closes a
> +	 * connection, also if some data is still in the receive queue.
> +	 *
> +	 * In order to provide the same behaviour, we always return 0
> +	 * (no data available) if the peer (guest) closed the connection.
> +	 */
> +	if (vsk->peer_shutdown == SHUTDOWN_MASK)
> +		return 0;
> +
> +	return virtio_transport_stream_has_data(vsk);
> +}
> +
>  /* Callers that dereference the return value must hold vhost_vsock_mutex or the
>   * RCU read lock.
>   */
> @@ -804,7 +819,7 @@ static struct virtio_transport vhost_transport = {
>  
>  		.stream_enqueue           = virtio_transport_stream_enqueue,
>  		.stream_dequeue           = virtio_transport_stream_dequeue,
> -		.stream_has_data          = virtio_transport_stream_has_data,
> +		.stream_has_data          = vhost_transport_stream_has_data,
>  		.stream_has_space         = virtio_transport_stream_has_space,
>  		.stream_rcvhiwat          = virtio_transport_stream_rcvhiwat,
>  		.stream_is_active         = virtio_transport_stream_is_active,
> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
