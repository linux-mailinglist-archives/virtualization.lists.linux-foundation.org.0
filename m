Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 632FE63FAEF
	for <lists.virtualization@lfdr.de>; Thu,  1 Dec 2022 23:50:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A0E61116;
	Thu,  1 Dec 2022 22:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0A0E61116
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=daynix-com.20210112.gappssmtp.com header.i=@daynix-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=iC4iteAP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAkzCppQLt23; Thu,  1 Dec 2022 22:50:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 18EAD61114;
	Thu,  1 Dec 2022 22:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18EAD61114
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50B3DC0078;
	Thu,  1 Dec 2022 22:50:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F7BDC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 22:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2432041066
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 22:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2432041066
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=daynix-com.20210112.gappssmtp.com
 header.i=@daynix-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=iC4iteAP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBjlOzyHTEff
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 22:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981BB40112
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 981BB40112
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Dec 2022 22:50:26 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d18so3050638pls.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 01 Dec 2022 14:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fC7GRsfU9487zvkZ00n0yK00IS3v6qRRBNuKWVaoA3U=;
 b=iC4iteAPISIUjyDOTh+rS65EwB8rDVM5P7hVLZJUwBiBvPYWFrTdUF/YBavMs7FzKF
 R1IcF7xQ1IpJd8oxQR5X1mb5XepEeaFSlUblesgIkIEAPaE1M9Uql+rGeXV4WVAh5YWt
 NUeH6C8aFRELdXhHy1SkPo+whmdFSdQswqD49MYv7bgwUiDT9OoLroVS31tkT0PzlIYF
 54Aaz0sE9GeUjW4wYZP3xWrJBlHEobLpgd/f05uUIj6lgtK6XA6XKrXAbDV5qeJ6HpiG
 tlP32sN+zwdZNo7VZR4nU7uj4slju1xyOZObCOzjobdQoLrU65N88SVPZ7ZA/V3Ov7lR
 aVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fC7GRsfU9487zvkZ00n0yK00IS3v6qRRBNuKWVaoA3U=;
 b=mYp+7+5P5HyDod858opbaCC/FXY0Y8nOtta0pLofL/TgpYeSJ0qcUSQPYIEB2jlM16
 QJjFnBLAiwRXDo2FlgwdJcU16q60boBCP7e+C1LfWxC6SyBZQ2khqkf3c7eDA/QWJ6SE
 BgNFaCHJdsAsLWywgBaLS+xqFm2aSWYrG7gIlCTnkZFuXL1D+dTggRbhT/XN3FdmbElk
 mpqJmv7aC+XqB9TwXMAsIN7cTOQlZdSvTWMCnEPdyHH4T02HhY4y+96/hf3JE1DlqQyy
 EgXrlQGlB+vFVAA9IoBx/+qTnpVvWFwfa1y/P5pNjIOWWY/gMR4wu0R7WEOcedUkJ7j0
 luaw==
X-Gm-Message-State: ANoB5pkackWiBd9WWjMZsIr6tWKzFmKLslRptdD68DgB9BnKpNb4MQJ0
 u94TY+SGRKLIPvmhKkphXM26+IUjAYcIQWzc7fB55g==
X-Google-Smtp-Source: AA0mqf6FWoZVhGaziJ0DWoZLVEWjJu8bXNVWon7OsLKFnQGym/jUIE4LmI1FgqCsX+3UEAK+0KsWrwIVbi2mqTsFnKk=
X-Received: by 2002:a17:903:50c:b0:189:6de9:deb9 with SMTP id
 jn12-20020a170903050c00b001896de9deb9mr30943805plb.153.1669935025832; Thu, 01
 Dec 2022 14:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20221201215644.246571-1-andrew@daynix.com>
 <20221201173252-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221201173252-mutt-send-email-mst@kernel.org>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 2 Dec 2022 00:35:03 +0200
Message-ID: <CABcq3pGaf1-XchxYAhX=3k9dEAPLR4p-VR9QUxNa1dNKzwWHXw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TUN/VirtioNet USO features support.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 dsahern@kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 devel@daynix.com, davem@davemloft.net
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

Sorry, got issues with the internet during sending it. Now, all should be done.

On Fri, Dec 2, 2022 at 12:33 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Dec 01, 2022 at 11:56:38PM +0200, Andrew Melnychenko wrote:
> > Added new offloads for TUN devices TUN_F_USO4 and TUN_F_USO6.
> > Technically they enable NETIF_F_GSO_UDP_L4
> > (and only if USO4 & USO6 are set simultaneously).
> > It allows the transmission of large UDP packets.
> >
> > UDP Segmentation Offload (USO/GSO_UDP_L4) - ability to split UDP packets
> > into several segments. It's similar to UFO, except it doesn't use IP
> > fragmentation. The drivers may push big packets and the NIC will split
> > them(or assemble them in case of receive), but in the case of VirtioNet
> > we just pass big UDP to the host. So we are freeing the driver from doing
> > the unnecessary job of splitting. The same thing for several guests
> > on one host, we can pass big packets between guests.
> >
> > Different features USO4 and USO6 are required for qemu where Windows
> > guests can enable disable USO receives for IPv4 and IPv6 separately.
> > On the other side, Linux can't really differentiate USO4 and USO6, for now.
> > For now, to enable USO for TUN it requires enabling USO4 and USO6 together.
> > In the future, there would be a mechanism to control UDP_L4 GSO separately.
> >
> > New types for virtio-net already in virtio-net specification:
> > https://github.com/oasis-tcs/virtio-spec/issues/120
> >
> > Test it WIP Qemu https://github.com/daynix/qemu/tree/USOv3
> >
> > Andrew (5):
> >   uapi/linux/if_tun.h: Added new offload types for USO4/6.
> >   driver/net/tun: Added features for USO.
> >   uapi/linux/virtio_net.h: Added USO types.
> >   linux/virtio_net.h: Support USO offload in vnet header.
> >   drivers/net/virtio_net.c: Added USO support.
> >
> > Andrew Melnychenko (1):
> >   udp: allow header check for dodgy GSO_UDP_L4 packets.
>
> I don't see patches except 0 on list.
>
> >  drivers/net/tap.c               | 10 ++++++++--
> >  drivers/net/tun.c               |  8 +++++++-
> >  drivers/net/virtio_net.c        | 24 +++++++++++++++++++++---
> >  include/linux/virtio_net.h      |  9 +++++++++
> >  include/uapi/linux/if_tun.h     |  2 ++
> >  include/uapi/linux/virtio_net.h |  5 +++++
> >  net/ipv4/udp_offload.c          |  3 ++-
> >  net/ipv6/udp_offload.c          |  3 ++-
> >  8 files changed, 56 insertions(+), 8 deletions(-)
> >
> > --
> > 2.38.1
> >
> > _______________________________________________
> > Virtualization mailing list
> > Virtualization@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/virtualization
> >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
