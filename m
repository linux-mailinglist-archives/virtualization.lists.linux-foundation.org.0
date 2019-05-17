Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF0C21554
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 10:27:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6AC939EE;
	Fri, 17 May 2019 08:26:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0ED3D941
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 08:26:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9BE1F87B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 08:26:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i3so6044016wml.4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 01:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sEvENpqG7iRDJFzplTTWGKcKFWzhWauRstxh0Bhc8E4=;
	b=KzmWCt9oLytlBxvlOMVOX/5x78nECblEe1IoPdkE9UtwDDzoHDyGtmo/n+KezvE4PB
	9YCRPeZ9N4fkujrOKtZp9oYCjNtCM7uimqa2ZsVMEV1KMoIjfJx4J8DSfZDEfjsF1veL
	tHxUwk/mmJcrIjvLJ8Pii+IgEWseETC3mEqoipzL5rm0DMxUS7XRxlAt9wKzxOeZwWRB
	r28XX/a2SYeqh5W5cFiUYHAeb+8h8FR6LkwtEr7OOytfPVDHGAfdkjXJhZeQ5kyT9tyu
	KrDEV1MBCorILUFdMXggeQBCXas8BoHPhaYdgMXP1zn73Xe/kfdu1SFkFLyK8PTz9gYb
	zY4Q==
X-Gm-Message-State: APjAAAWCoXCRDNYxddjk8p8IBnK2cnUEU8y7MdS7GKsCtutZzMbBnnlz
	jmvy6afiSaFR60gbLx2s9Q706w==
X-Google-Smtp-Source: APXvYqzbrpzTZlidwr0VrrxreIABY704QNogR/kYguVAnOeyJIKbn/D8MSRkU5vYa/5xmd361QHBXQ==
X-Received: by 2002:a1c:c015:: with SMTP id q21mr1265915wmf.75.1558081616187; 
	Fri, 17 May 2019 01:26:56 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151])
	by smtp.gmail.com with ESMTPSA id a5sm6714144wrt.10.2019.05.17.01.26.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 01:26:55 -0700 (PDT)
Date: Fri, 17 May 2019 10:26:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/8] vsock/virtio: free packets during the socket
	release
Message-ID: <20190517082653.aymkhkqkj5yminfg@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-3-sgarzare@redhat.com>
	<20190516153218.GC29808@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516153218.GC29808@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

On Thu, May 16, 2019 at 04:32:18PM +0100, Stefan Hajnoczi wrote:
> On Fri, May 10, 2019 at 02:58:37PM +0200, Stefano Garzarella wrote:
> > When the socket is released, we should free all packets
> > queued in the per-socket list in order to avoid a memory
> > leak.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  net/vmw_vsock/virtio_transport_common.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> Ouch, this would be nice as a separate patch that can be merged right
> away (with s/virtio_vsock_buf/virtio_vsock_pkt/).

Okay, I'll fix this patch following the David's comment and I'll send
as a separate patch using the virtio_vsock_pkt.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
