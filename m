Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55242220F6C
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 16:35:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 769578AE5E;
	Wed, 15 Jul 2020 14:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7O0Ei1Ms-DDb; Wed, 15 Jul 2020 14:34:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB9848AE61;
	Wed, 15 Jul 2020 14:34:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5AFFC0733;
	Wed, 15 Jul 2020 14:34:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AC98C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 122A489682
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luT8UnPSltvj
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:34:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C917B8967F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594823694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDUnF1gX4Wln5UGQpyw0DsCZrmXKbH1BJblX2g4HkKY=;
 b=f4y0MJ3byWsV/c4dAXaj0GExpxt5+5duSytOqyGeKX81CrDbxYHEgsCJKlhVLIiY5repuM
 tyPsJieTetq38kzbJphGXoiQU/TOUJLab9kMaCkFuvePxux1RDhT5Jnjwp64ck1emlaNeZ
 plbHhPoIRGMOaayDZxYSAG/FqKXS/Io=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-8HcFOxFtNvSFr_VjGbgaaA-1; Wed, 15 Jul 2020 10:34:52 -0400
X-MC-Unique: 8HcFOxFtNvSFr_VjGbgaaA-1
Received: by mail-wr1-f69.google.com with SMTP id a18so1465446wrm.14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 07:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gDUnF1gX4Wln5UGQpyw0DsCZrmXKbH1BJblX2g4HkKY=;
 b=KMEj3Kn2sMW5ZrMrmQZMlLLOxYLvXDY4Berp8NWMcTWeyEXMSm1qUZzHWVS9YoWVGr
 wk47mFf0i+uNPjcBbxEw0gJoXuozUY2iLrmFYVaqC2iM3w1SA8b4WP+9leROz/qyLkzQ
 t3HwgME+MfY6suYgPrFiWsmOuXxX4mIa+zwsJFd5btBev/JYrpPA9PzbnPySPXz6Y4hG
 xfTMFtifppwnDYvuSGV2owuL5rL37tqNoxM3F23EY4aMXT6QAJrJ5w5QuuGmnHZp1S0J
 tN6Q319AdS3VJWiWShBhTCsTTGjPOfIWn14uRF1PNWjWA68WK3UgvVuW9sE1rvsDFWS6
 Y+nQ==
X-Gm-Message-State: AOAM533wAGz8TyRohdCGmlE0Kxgt4ZQx5L3qhNO9+oBt2g8priJ7uegD
 ml2t3JDC1DY69iv8nPWT/OrAy8Y4fEZGBjXFEYv6224UdH68/mHetaB49G5PAt5wOyvD8iU00oo
 LCZR0jg/gTV477BaGr+Y92Hq1UeF97bJ1av8iKzo+gw==
X-Received: by 2002:a5d:6987:: with SMTP id g7mr11513363wru.79.1594823691728; 
 Wed, 15 Jul 2020 07:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoUwaGmSvRQhzNykS+/dS1cmb21BRdb+HUz8NopOX7oAtNCENF0Kaaj4WsT5RV7bERzyNJsQ==
X-Received: by 2002:a5d:6987:: with SMTP id g7mr11513341wru.79.1594823691514; 
 Wed, 15 Jul 2020 07:34:51 -0700 (PDT)
Received: from steredhat ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id e8sm3600980wrp.26.2020.07.15.07.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:34:50 -0700 (PDT)
Date: Wed, 15 Jul 2020 16:34:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, davem@davemloft.net
Subject: Re: [PATCH] vsock/virtio: annotate 'the_virtio_vsock' RCU pointer
Message-ID: <20200715143446.kfl3zb4vwkk4ic4r@steredhat>
References: <20200710121243.120096-1-sgarzare@redhat.com>
 <20200713065423-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200713065423-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Jul 13, 2020 at 06:54:43AM -0400, Michael S. Tsirkin wrote:
> On Fri, Jul 10, 2020 at 02:12:43PM +0200, Stefano Garzarella wrote:
> > Commit 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free
> > on the_virtio_vsock") starts to use RCU to protect 'the_virtio_vsock'
> > pointer, but we forgot to annotate it.
> > 
> > This patch adds the annotation to fix the following sparse errors:
> > 
> >     net/vmw_vsock/virtio_transport.c:73:17: error: incompatible types in comparison expression (different address spaces):
> >     net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock [noderef] __rcu *
> >     net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock *
> >     net/vmw_vsock/virtio_transport.c:171:17: error: incompatible types in comparison expression (different address spaces):
> >     net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock [noderef] __rcu *
> >     net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock *
> >     net/vmw_vsock/virtio_transport.c:207:17: error: incompatible types in comparison expression (different address spaces):
> >     net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock [noderef] __rcu *
> >     net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock *
> >     net/vmw_vsock/virtio_transport.c:561:13: error: incompatible types in comparison expression (different address spaces):
> >     net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock [noderef] __rcu *
> >     net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock *
> >     net/vmw_vsock/virtio_transport.c:612:9: error: incompatible types in comparison expression (different address spaces):
> >     net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock [noderef] __rcu *
> >     net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock *
> >     net/vmw_vsock/virtio_transport.c:631:9: error: incompatible types in comparison expression (different address spaces):
> >     net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock [noderef] __rcu *
> >     net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock *
> > 
> > Fixes: 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free on the_virtio_vsock")
> > Reported-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> who's merging this? Dave?

I think so, but I forgot the 'net' tag :-(

I'll wait to see if Dave will queue this, otherwise I'll resend with
the 'net' tag.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
