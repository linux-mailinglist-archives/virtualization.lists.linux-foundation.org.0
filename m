Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCD21B325
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 12:25:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C6D389B9F;
	Fri, 10 Jul 2020 10:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O66-UW94dzMn; Fri, 10 Jul 2020 10:25:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8CB5D89B93;
	Fri, 10 Jul 2020 10:25:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CF9DC016F;
	Fri, 10 Jul 2020 10:25:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 500BDC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C63489B93
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4NjFT2QGDtc
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:25:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ACF9189B8A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594376701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=EdeAaKTgChoVakQaH9ioQmoteP6GoARZY0ssosn9JtQ=;
 b=Kik7mM+nrrw+M9iv29nySReMeN31n/jEXpDzjEpBIoNxKhMU8t0AG62FFYUQQa4EWS1cCJ
 SkK2LrbCosZAkm+V16k1/f7OUZiGwye/6cnYAm4kcm2XT+ZoTptlJyoc9fECSZxpr0MtML
 p7h7C+ZlPkNKAyn8wccbLxEuvFOI1UI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Brk-xUL8MQ6hVibUzpGElw-1; Fri, 10 Jul 2020 06:25:00 -0400
X-MC-Unique: Brk-xUL8MQ6hVibUzpGElw-1
Received: by mail-wm1-f69.google.com with SMTP id g124so6279708wmg.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 03:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=EdeAaKTgChoVakQaH9ioQmoteP6GoARZY0ssosn9JtQ=;
 b=dmIRMX0NnW1c13vaC+IuoTl35pfn6JyyNOjVt3Eeq6PKI3LWOIljZpASYNPNnVa79N
 z2J/Eb6TTGdlDA9hfjmDhI84IJbOH+rNVI+gsYz/S0CTxao9a2i9nDvc4knx7chT0MVS
 S+tgZRnBdRCSo89OhGBVZPJeUhVeGF+yB12ogrxrp26+39MEZy0aqbn1OuwW6OjeEh0y
 lAkbkXGmoZteCBnCnbZz3NdD/JckM+elEInizi1Uap8VdjD9kJC7sG/vVXkSr+ZUDsYC
 lL9yt0UqPW30NpM0bDPG0wKWJKrJ3GhSKYVGvs0jAKTsCnxWiqZYqOgXMewOfKbYR5j8
 fkyA==
X-Gm-Message-State: AOAM5333nqjG1FVuneLqo9cckbxm1oJJmsb0bJ3IrLAPAyu4VEpgXi77
 0bmLUpzeNZw6No4nXK7+IqZe/N10mSI9qYBgxfz5MPbgpkgEEg6NJrmIrGbvSrApQYqtriNtwVf
 /BK5Jk3ccpKKrTdqCSp40mL5kOqYbqIiyLZwT8840Ag==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr4736806wmc.51.1594376696270; 
 Fri, 10 Jul 2020 03:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykWL23cX3nQ0MBbqN4BbE0cmuQxQQP9+yT7FJe28AgN0uaIkr9RSYEjSnIicZ6QvahSf2thA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr4736796wmc.51.1594376696112; 
 Fri, 10 Jul 2020 03:24:56 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 r11sm8228480wmh.1.2020.07.10.03.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:24:54 -0700 (PDT)
Date: Fri, 10 Jul 2020 06:24:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: stefanha@redhat.com, sgarzare@redhat.com,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: sparse warnings in net/vmw_vsock/virtio_transport.c
Message-ID: <20200710062421-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

RCU trickery:

net/vmw_vsock/virtio_transport.c:73:17: error: incompatible types in comparison expression (different address spaces):
net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock [noderef] __rcu *
net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock *
net/vmw_vsock/virtio_transport.c:171:17: error: incompatible types in comparison expression (different address spaces):
net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock [noderef] __rcu *
net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock *
net/vmw_vsock/virtio_transport.c:207:17: error: incompatible types in comparison expression (different address spaces):
net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock [noderef] __rcu *
net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock *
net/vmw_vsock/virtio_transport.c:561:13: error: incompatible types in comparison expression (different address spaces):
net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock [noderef] __rcu *
net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock *
net/vmw_vsock/virtio_transport.c:612:9: error: incompatible types in comparison expression (different address spaces):
net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock [noderef] __rcu *
net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock *
net/vmw_vsock/virtio_transport.c:631:9: error: incompatible types in comparison expression (different address spaces):
net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock [noderef] __rcu *
net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock *
  CC [M]  net/vmw_vsock/virtio_transport.o

can you take a look at fixing this pls?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
