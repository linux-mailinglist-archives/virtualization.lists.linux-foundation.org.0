Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DDAD42F8
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 16:34:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC1E31A53;
	Fri, 11 Oct 2019 14:34:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0A8791A39
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:22:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6D218A9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:22:37 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F6E02DD43
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:22:37 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id w198so9114311qka.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 07:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=3/69IjnpthyAsYWKUyauhiINSOqY8C5ksx6fR2DlmR8=;
	b=RQ/rBB3w98K5PwwZlIAHpw4vjpV0zFjT8e3DqmUdqK9s0ASZNfFL7YfEli3xH8rUBe
	piu1/+u2pev1anUA3mZaBpUxKtHTR+xcL0Xm4+LXYLUHqZuVruSJq/bMEiw/xNPIAX0u
	zswcBCz31ApnJG9SWjkM03I5/HyPwpz5K48hRTH/YkszgzFGoa5kr3u/tylz6SM/MkRp
	r8pwRZVehk5bvx2i36/DNY4qmxuPYlOR8WZhXOl9j1opDiAeTExGNhRFjWaOkNWpuwhG
	8/zZdVneKCn1lyIXDqv7O+R70u8hrqeb6JbVVzyvqPYxCfaCVrjiUd0XyFCbd9OGAm54
	Pi9Q==
X-Gm-Message-State: APjAAAVIGYuvb8LXvSQlKH84WECkx6yW2IU9a0gZAhQK1OdoX29e6sWs
	Yl3i2htXyqQLQ0B4hFXTKrK4bBR9hLi572S8HFbuxTAdQCmrXX5kCLJyIuBuvI5IGawiO2Iyc7+
	4CFn5Lv/4Di4nT7B5tZZBNJGxCDGqZOan2C3fPQ68rA==
X-Received: by 2002:ac8:6c4:: with SMTP id j4mr17178010qth.235.1570803756537; 
	Fri, 11 Oct 2019 07:22:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyypmt8JVfwhZN2RwBVS/3yah5jYZ2+VyE0up3EqHheFxjCMjltd5zsKzuYpHN6h2SBGBQ1eg==
X-Received: by 2002:ac8:6c4:: with SMTP id j4mr17177991qth.235.1570803756356; 
	Fri, 11 Oct 2019 07:22:36 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	q47sm6531138qtq.95.2019.10.11.07.22.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 07:22:35 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:22:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net 1/2] vsock: add half-closed socket details in the
	implementation notes
Message-ID: <20191011101936-mutt-send-email-mst@kernel.org>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011130758.22134-2-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011130758.22134-2-sgarzare@redhat.com>
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

On Fri, Oct 11, 2019 at 03:07:57PM +0200, Stefano Garzarella wrote:
> vmci_transport never allowed half-closed socket on the host side.
> Since we want to have the same behaviour across all transports, we
> add a section in the "Implementation notes".
> 
> Cc: Jorgen Hansen <jhansen@vmware.com>
> Cc: Adit Ranadive <aditr@vmware.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/af_vsock.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 2ab43b2bba31..27df57c2024b 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -83,6 +83,10 @@
>   *   TCP_ESTABLISHED - connected
>   *   TCP_CLOSING - disconnecting
>   *   TCP_LISTEN - listening
> + *
> + * - Half-closed socket is supported only on the guest side. recv() on the host
> + * side should return EOF when the guest closes a connection, also if some
> + * data is still in the receive queue.
>   */
>  
>  #include <linux/types.h>

That's a great way to lose data in a way that's hard to debug.

VMCI sockets connect to a hypervisor so there's tight control
of what the hypervisor can do.

But vhost vsocks connect to a fully fledged Linux, so
you can't assume this is safe. And application authors do not read
kernel source.

> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
