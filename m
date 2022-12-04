Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBC641D7E
	for <lists.virtualization@lfdr.de>; Sun,  4 Dec 2022 15:38:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BCC409B1;
	Sun,  4 Dec 2022 14:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BCC409B1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pPGEMfey
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZME9Uw9LcMAP; Sun,  4 Dec 2022 14:38:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 39FEC409B6;
	Sun,  4 Dec 2022 14:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FEC409B6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46EF3C007C;
	Sun,  4 Dec 2022 14:38:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE4E7C002D
 for <virtualization@lists.linux-foundation.org>;
 Sun,  4 Dec 2022 14:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E8C8176F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  4 Dec 2022 14:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E8C8176F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=pPGEMfey
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vs0SquDTZQzb
 for <virtualization@lists.linux-foundation.org>;
 Sun,  4 Dec 2022 14:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED9108176D
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED9108176D
 for <virtualization@lists.linux-foundation.org>;
 Sun,  4 Dec 2022 14:38:04 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id g7so4074771ile.0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 04 Dec 2022 06:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3ht+PFif9npJV8ar+ODGKMWqVb38BYWmSXzGf8Bql7o=;
 b=pPGEMfeyBvZrG0hTpf1s6ITxgBrJospjOIzVZS5Z/h73xQKsco6dl+e1LC/hk03vfg
 CYMZxfE+3i2HYg/abEcBi2PWlF7XDK8DOVG7k7EdL6qjfyAm5Znslvf4lHpOH9jKTW57
 4vZZ6gPdX56jhSX4Gu6+SkV6nSsQ2S1nEsh7GrRV/p97qZm/RRYR3eHrmS5BH/gujndy
 caS/Eyd0Xucm3FfoYcUw90BMOP+4uhhcZXFn1hufxpDbvRlfh3eNeOUS3aX1yA9825DE
 QQF1WULRaAwsgIWCCyBlC9A3jF8g7B6FZGdqeqsphLggrHQ3LlIxvdENwYy2oCk8NntE
 WfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ht+PFif9npJV8ar+ODGKMWqVb38BYWmSXzGf8Bql7o=;
 b=LBnTKQXVF+JGFYXsfd4D1z1txD0lGg/8e3B7UixVdAuWISrOjS8sXlxHAD+XqC8xnD
 BJS2kB8q756MRRjhAloN5sL+6gM279QQ59yvb0HgLOHUs2wT7CWcQWedD3QvrMXz4sXL
 hfamycWUoKA23N51wZu/z5tEfbvSVkiBmVJE4afPNj5QDld4nJvXzwwSGXRIWRzlG25w
 TXMNlrLCHR9lRax9pZH/RhlQ7xv+KIiZ4FKjKAgcGQ0Ejz9ogwKk1TJHfgdj/0lbcEtj
 /8GegtlKlQNj7RAsYZg6ZvEBNNBA8cXRlrJExGlXiwiwU5goGE8IDqefbY/JAsu8ml8L
 +QPA==
X-Gm-Message-State: ANoB5pn1t06pFJCfIFnnx0BwBFdos/Q0lJu/ha9eWffCcdfo1Gw/pDRO
 oA7Q3DCdyxmqF3blsTDmabIKsXXEcrweHznFNW8puA==
X-Google-Smtp-Source: AA0mqf6U6+Jlzl442PaUjNl6FqidwJuqolKD1dsRvBbSalz+iI+E0a5nBfwTUdXpiGNKivAXiZDkBqyKcdYosPR+9s8=
X-Received: by 2002:a92:dc8b:0:b0:302:4c01:2d2b with SMTP id
 c11-20020a92dc8b000000b003024c012d2bmr24967282iln.2.1670164683859; Sun, 04
 Dec 2022 06:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20221124013830-mutt-send-email-mst@kernel.org>
 <Y3/WXWoV1jcJnohR@fedora>
 <CAJs=3_AY_1eGwsu5MvzUr4N03=3qgYiVdu5=EV+VSj6+yUYeyg@mail.gmail.com>
 <Y4UG6lQXbzxOix1/@fedora> <dc8bf007-a6f6-9824-63e1-9447335da732@nvidia.com>
 <20221129001239-mutt-send-email-mst@kernel.org>
 <b76ad252-3f6a-8f4b-cb2d-0a4f45860aae@nvidia.com>
 <CAJs=3_Bma3KiOW3Cah2KWiN34TG4c=bdw1bTjB71Fo_QLaKmXw@mail.gmail.com>
 <20221204055044-mutt-send-email-mst@kernel.org>
 <CAJs=3_D1nX3K4=PXiS_CoLHmq1TbYUhecM6CkWT6FCV1JV2PCA@mail.gmail.com>
 <20221204072703-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221204072703-mutt-send-email-mst@kernel.org>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Sun, 4 Dec 2022 16:37:28 +0200
Message-ID: <CAJs=3_B91G7=ABYOBwZz8nZwNYFQwMLjtLiHHvitYx8uE+HEoA@mail.gmail.com>
Subject: Re: [PATCH v2] virtio_blk: add VIRTIO_BLK_F_LIFETIME feature support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

> And now is this generic enough to disconnect from virtio and
> make it a generic blk thing?

It could be generic enough if we drop the virtio structs and pass
single fields as elements.
The point is, we can easily make it generic enough, do we want to?

At the moment, there is at least 1 existing device-specific ioctl to
retrieve lifetime info (that I'm aware of),
MMC_IOC_CMD for a MMC device with MMC_SEND_EXT_CSD opcode.
So we will have duplication for MMC devices (for some of the lifetime fields).

Do you want it to be blk generic?

Alvaro
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
