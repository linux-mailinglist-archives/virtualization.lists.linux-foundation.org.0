Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3664307D
	for <lists.virtualization@lfdr.de>; Mon,  5 Dec 2022 19:37:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDE4A60C0A;
	Mon,  5 Dec 2022 18:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE4A60C0A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=r2nugea+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hN4udPK1eeV; Mon,  5 Dec 2022 18:37:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 912CD60BB8;
	Mon,  5 Dec 2022 18:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 912CD60BB8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C486EC007C;
	Mon,  5 Dec 2022 18:37:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1BD9C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Dec 2022 18:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C61060A82
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Dec 2022 18:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C61060A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qUbDMJ-gtbE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Dec 2022 18:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A6060797
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80A6060797
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Dec 2022 18:37:10 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id c7so8128646iof.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 05 Dec 2022 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bKqfMwQzWVOYOX0yr/2heukDSWlHU0sCLL6O1tBRc7A=;
 b=r2nugea+/S+x1+A/NKJxhGhSo46KlCg0/YSPkE4xZ65fZB3u3y4swnhKZToZJV53y9
 W9ZuR4fGX6HPrGTQoaamF83HV2266vhVLmtnTqs0f08R19v4/QjYZHxHkxNpukL6bq0T
 2RNtr7QF3zxGwPNAWXt2lxtnP8HKNHLrQNZWZRjIkLp+m6CJBuuAzxLg7wn6L7NeH5Br
 Ykj6XHfBLizr5eRdyrLbdpPVKMOx9NAw8tufqLVjkmkB+eGjAdId2ThIt3wJmqhKSbJT
 h7O2hmgsO0npQxMPs01kiVL2/tcv7qdJOM/Wj3xa/a2hq4E1YFE6m6+itmy/n/6DMF31
 q9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKqfMwQzWVOYOX0yr/2heukDSWlHU0sCLL6O1tBRc7A=;
 b=XiM+V4CQZVeMcE6gayVfOTycCQ0QGtrgiPL3S8yRYCiSjHSLoAatM5BP5L4fT3wP7N
 kraHQqBE94KOpTAWcC4GC3aARwcor/7Vr+WyajjlEu8XiDT2q+8s9Lu0mVcpucrQjy/X
 PeEmrUbsI5pTHktO0n7LBI71pMX6+wYdKElNns34Dmen+MXGVyakoummumnMaYoS6Up5
 +AFA0ELYFNRoBD+hL3QhSQ7UqruIp+BRW6E01oeiMeXmeEwADfnIa3SlW8ljjhauDgs8
 X1R5/fjMXwDeeRqnGgxvMbO0EPtrXH6jQzieiMYkNk3BnN7VhaX39NZSMDswtBSqBnoC
 SaVA==
X-Gm-Message-State: ANoB5pmHRA3oqo7ZeuYV6j2i+7F/4d6mfuolnvrQ4QQWlVrCvSTgF0n7
 5Df0r7AFxm11+RIej9+7m/Iq7SN0yDo9IIusJhyjYg==
X-Google-Smtp-Source: AA0mqf7iS69oYWO13rn/6u9i2SOCARyk4OODHe8uFql4/VPC3ttbr8u6HDq0kZnXhGPO5q+l052KxdhC7ngmMQnNADM=
X-Received: by 2002:a02:6603:0:b0:375:9e02:b459 with SMTP id
 k3-20020a026603000000b003759e02b459mr38421363jac.30.1670265429512; Mon, 05
 Dec 2022 10:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
 <fe2800f1-aaae-33e8-aaf0-83fd034162d5@kernel.dk>
In-Reply-To: <fe2800f1-aaae-33e8-aaf0-83fd034162d5@kernel.dk>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Mon, 5 Dec 2022 20:36:33 +0200
Message-ID: <CAJs=3_AKOMWBpvKqvX6_c=zN1cwEM7x9dzGr7na=i-5_16rdEg@mail.gmail.com>
Subject: Re: [PATCH v3] virtio_blk: add VIRTIO_BLK_F_LIFETIME feature support
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-scsi@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

Hi,

> Is this based on some spec? Because it looks pretty odd to me. There
> can be a pretty wide range of two/three/etc level cells with wildly
> different ranges of durability. And there's really not a lot of slc
> for generic devices these days, if any.

Yes, this is based on the virtio spec
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html
section  5.2.6
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
