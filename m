Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A11DE37F830
	for <lists.virtualization@lfdr.de>; Thu, 13 May 2021 14:49:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2B083896;
	Thu, 13 May 2021 12:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsSYOOtVeUFg; Thu, 13 May 2021 12:49:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7BF83770;
	Thu, 13 May 2021 12:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFCE5C001C;
	Thu, 13 May 2021 12:49:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5105FC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4DB608A0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3VJSG0NqQIl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:49:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60150606C0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620910158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NSrjqlQIJu1uxoxnuhMrvLQLzbH8gXslRcYpELalTPg=;
 b=irllEUc7Yn8v5Vl9RqE6QuUePztTLGPxYfeYfiR15lXEInISCOiUcrLYnRORS2UZRL2mN3
 t1Q+6IXAdtREDLXAHpe12+eHYL1jlUJquZRYpfYTvpgVmlU21w+3UFETvx2bH5/RjfEeE0
 kgEjmYsdWuNGah7iwAkVEmusY8eshic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-CuVfZcR_PaCsdgcAdMnTJQ-1; Thu, 13 May 2021 08:49:16 -0400
X-MC-Unique: CuVfZcR_PaCsdgcAdMnTJQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so14570483edd.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 05:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NSrjqlQIJu1uxoxnuhMrvLQLzbH8gXslRcYpELalTPg=;
 b=qP5Z0mFhgHAkETVmeoTbnu3G29QuzLQ1cYUyklMhhkWc8zceW/8CCFqVmvXEZEvvDr
 EcB0XzobsC5DqNFi0Vq0imia0hvJ09dhiErvYRJVub+E6QAvVoLkvLU7EzH1D4oYygvk
 BbJWQR9G/TZagdTHrlGU4oFKzfhitTnGACZaX97QGkMqJfZ4Y7wJaFeX91uoRppw5hCc
 bSaSF33cSfvLjbrvbU100i2H0a9l2Tb7yQ37+F2ikLSoW8BYakU3o3M1kDMnUcFDAOrj
 t+wFSOzsFlVPaxMbtyS6pUs+saVFOcqfiEBKwkYJie8Xt7woxmc1antyxtN6+qhGesBS
 zerw==
X-Gm-Message-State: AOAM532dMB3wRAL+3bLMkumovFNKYT98FRpEHTyog/ULu4JB9YowpU6H
 xY2+/eqiDJ03YIXiD/N0Jy0L1Gxvvptk9ruIqrwZZ/7KkpCaroKyXwOPzGLfHc7UfDz9M3roTr/
 23UH3lz+8UDEhaJF5B/eBiogFWqItwadjVHCFGW9KlA==
X-Received: by 2002:a17:906:144d:: with SMTP id
 q13mr45360850ejc.458.1620910155421; 
 Thu, 13 May 2021 05:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoWSdvzLm133gY1yGZQzxSLocSHvkGSmNAzGowvENZeAXfZJswxcWVjdFLnXw30TfArShrKw==
X-Received: by 2002:a17:906:144d:: with SMTP id
 q13mr45360828ejc.458.1620910155258; 
 Thu, 13 May 2021 05:49:15 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id j22sm1873651ejt.11.2021.05.13.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:49:14 -0700 (PDT)
Date: Thu, 13 May 2021 14:49:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v9 14/19] virtio/vsock: enable SEQPACKET for transport
Message-ID: <20210513124912.sw4rea75re7xwjdz@steredhat>
References: <20210508163027.3430238-1-arseny.krasnov@kaspersky.com>
 <20210508163617.3432380-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210508163617.3432380-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, stsp2@yandex.ru,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sat, May 08, 2021 at 07:36:14PM +0300, Arseny Krasnov wrote:
>This adds
>1) SEQPACKET ops for virtio transport and 'seqpacket_allow()' callback.
>2) Handling of SEQPACKET bit: guest tries to negotiate it with vhost.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> v8 -> v9:
> 1) Move 'seqpacket_allow' to 'struct virtio_vsock'.
>
> net/vmw_vsock/virtio_transport.c | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 2700a63ab095..f714c16af65d 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -62,6 +62,7 @@ struct virtio_vsock {
> 	struct virtio_vsock_event event_list[8];
>
> 	u32 guest_cid;
>+	bool seqpacket_allow;
> };
>
> static u32 virtio_transport_get_local_cid(void)
>@@ -443,6 +444,8 @@ static void virtio_vsock_rx_done(struct virtqueue *vq)
> 	queue_work(virtio_vsock_workqueue, &vsock->rx_work);
> }
>
>+static bool virtio_transport_seqpacket_allow(u32 remote_cid);
>+
> static struct virtio_transport virtio_transport = {
> 	.transport = {
> 		.module                   = THIS_MODULE,
>@@ -469,6 +472,10 @@ static struct virtio_transport virtio_transport = {
> 		.stream_is_active         = virtio_transport_stream_is_active,
> 		.stream_allow             = virtio_transport_stream_allow,
>
>+		.seqpacket_dequeue        = virtio_transport_seqpacket_dequeue,
>+		.seqpacket_enqueue        = virtio_transport_seqpacket_enqueue,
>+		.seqpacket_allow          = virtio_transport_seqpacket_allow,
>+
> 		.notify_poll_in           = virtio_transport_notify_poll_in,
> 		.notify_poll_out          = virtio_transport_notify_poll_out,
> 		.notify_recv_init         = virtio_transport_notify_recv_init,
>@@ -485,6 +492,19 @@ static struct virtio_transport virtio_transport = {
> 	.send_pkt = virtio_transport_send_pkt,
> };
>
>+static bool virtio_transport_seqpacket_allow(u32 remote_cid)
>+{
>+	struct virtio_vsock *vsock;
>+	bool seqpacket_allow;
>+
>+	rcu_read_lock();
>+	vsock = rcu_dereference(the_virtio_vsock);
>+	seqpacket_allow = vsock->seqpacket_allow;
>+	rcu_read_unlock();
>+
>+	return seqpacket_allow;
>+}
>+
> static void virtio_transport_rx_work(struct work_struct *work)
> {
> 	struct virtio_vsock *vsock =
>@@ -612,6 +632,10 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
> 	rcu_assign_pointer(the_virtio_vsock, vsock);
>
> 	mutex_unlock(&the_virtio_vsock_mutex);
>+
>+	if (vdev->features & (1ULL << VIRTIO_VSOCK_F_SEQPACKET))

We should use virtio_has_feature() to check the device features.

>+		vsock->seqpacket_allow = true;

When we assign the_virtio_vsock pointer, we should already set all the 
fields, so please move this code before the following block:

	# here

	vdev->priv = vsock;
	rcu_assign_pointer(the_virtio_vsock, vsock);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
