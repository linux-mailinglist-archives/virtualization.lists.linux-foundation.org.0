Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D570150D219
	for <lists.virtualization@lfdr.de>; Sun, 24 Apr 2022 15:47:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 515A741545;
	Sun, 24 Apr 2022 13:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2zL-w3Suzwr; Sun, 24 Apr 2022 13:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EA7064155B;
	Sun, 24 Apr 2022 13:47:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2861BC007C;
	Sun, 24 Apr 2022 13:47:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AB40C002D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 13:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7364D60BD1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 13:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MwQ_yp16WtM
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 13:47:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23B4D60BB4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 13:46:59 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id b189so9083967qkf.11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dwBFVIXy534bKGTyyuJDK1gwkEa8o2qP7YdajUgu+g=;
 b=FDkvAgGJ0PNObM/pCjxbWmTzNac5Abl0qKcS/HIco9/IQWF/WCLCbIi0rOXELA4qn6
 lSTMqWF/bEQROUJqEOEpx+Uu7nWjFz6463+8HYFmn2ETfkEngvRqkpU12Pt6zhzL5rCS
 bKn+Hq0lzHn3XLpvDTHWBTtOl23F5TLp/BIbL9qiExOPLM+0yQ7IibHzl7UhhFMMMeSe
 1ndmRdGC1it3S3VickSXM/DIn0qUXIAS7FpajpuxwlJX2GprH32Y/I89kV+Xz/FxtsUc
 j0GnQL7hHBHwNvOw5tVhUFpaWNCWr3AvacGSUv8LJ/hyFhEpExE1LWvaU4MxoOcUoqVv
 +6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dwBFVIXy534bKGTyyuJDK1gwkEa8o2qP7YdajUgu+g=;
 b=h54K2QLvC824dfO2CNAMFOHZhhU81QLAlw5dz0RkbADNmEqhExJ3HrbppXEajER45Z
 CQQLgVGvnjI/LE6xUI1Bh+CxWMYmjR61IplR4BbENIIfQfyjBF7Gr/r39XC+3UKEL4hi
 VBl986jWuEKNdEIpOO85wuKoE2lzsnpiq8DLjR7NmoHYZ1PWjq2TlxD/XrS6zNew6Ql8
 i1u7/SleBwLLysE4MxJg0phQbZf+DVXZXPeH0IUbsLqut0Ew7A/r60oKdlVwRR7Qs84m
 UfEUFqi0IqL+v8cyv91JFwSFRPeRY6r11gn3XcAxe76A5pWCePm8OcJQhnzg/wO8+7Ez
 eH6Q==
X-Gm-Message-State: AOAM531zQN+He5y/8W30bRS3ssE+E65MXtlNZklXeuIDlTsuLe1AEwmZ
 xf+kuHOIZ6RQUF70BBwnCXgi8esr91M=
X-Google-Smtp-Source: ABdhPJzD5X8Z42r5OShcOG9lmcNMPperrjWBK4Vo5Q1TgxsFE+F07I3jGq7eSp/iQPzr7YiSM9Rekg==
X-Received: by 2002:a37:ad0:0:b0:69e:eb4d:7334 with SMTP id
 199-20020a370ad0000000b0069eeb4d7334mr7548055qkk.706.1650808018749; 
 Sun, 24 Apr 2022 06:46:58 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 b28-20020a05620a271c00b0069f52b96667sm433916qkp.53.2022.04.24.06.46.57
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 06:46:57 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id v59so9791857ybi.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Apr 2022 06:46:57 -0700 (PDT)
X-Received: by 2002:a05:6902:10c2:b0:645:192e:1a88 with SMTP id
 w2-20020a05690210c200b00645192e1a88mr13139818ybu.117.1650808016622; Sun, 24
 Apr 2022 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220420082758.581245-1-liuhangbin@gmail.com>
 <CA+FuTScyF4BKEcNSCYOv8SBA_EmB806YtKA17jb3F+fymVF-Pg@mail.gmail.com>
 <YmDCHI330AUfcYKa@Laptop-X1>
 <CA+FuTSckEJVUH1Q2vBxGbfPgVteyDVmTfjJC6hBj=qRP+JcAxA@mail.gmail.com>
 <YmIOLBihyeLy+PCS@Laptop-X1>
 <CA+FuTSfzcAUXrxzbLd-MPctTyLu8USJQ4gvsqPBfLpA+svYMYA@mail.gmail.com>
 <YmS2Gd6c1b+o5nyR@Laptop-X1>
In-Reply-To: <YmS2Gd6c1b+o5nyR@Laptop-X1>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sun, 24 Apr 2022 09:46:19 -0400
X-Gmail-Original-Message-ID: <CA+FuTSe7zNmJ0JpouMoCFrt5AR19HJQVzDsB3BK46A9rNfowYw@mail.gmail.com>
Message-ID: <CA+FuTSe7zNmJ0JpouMoCFrt5AR19HJQVzDsB3BK46A9rNfowYw@mail.gmail.com>
Subject: Re: [PATCH net-next] net/af_packet: add VLAN support for AF_PACKET
 SOCK_RAW GSO
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Maxim Mikityanskiy <maximmi@mellanox.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, virtualization@lists.linux-foundation.org,
 Balazs Nemeth <bnemeth@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Mike Pattrick <mpattric@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
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

On Sat, Apr 23, 2022 at 10:31 PM Hangbin Liu <liuhangbin@gmail.com> wrote:
>
> On Fri, Apr 22, 2022 at 05:39:48PM -0400, Willem de Bruijn wrote:
> > > If we split skb_probe_transport_header() from packet_parse_headers() and
> > > move it before calling virtio_net_hdr_* function in packet_snd(). Should
> > > we do the same for tpacket_snd(), i.e. move skb_probe_transport_header()
> > > after the virtio_net_hdr_* function?
> >
> > That sounds like the inverse: "move after" instead of "move before"?
>
> That's for "split packet_parse_headers()" option.
>
> >
> > But I thought the plan was to go back to your last patch which brings
> > packet_snd in line with tpacket_snd by moving packet_parse_headers in
> > its entirety before virtio_net_hdr_*?
>
> Yes, exactly.
>
> > > So my conclusion is. There is no need to split packet_parse_headers(). Move
> > > packet_parse_headers() before calling virtio_net_hdr_* function in packet_snd()
> > > should be safe.
> >
> > Ack. Sorry if my last response was not entirely clear on this point.
>
> Thanks a lot for your review. Do you think if I need to re-post the patch?
> Or will you give an Acked-by for this one?

Please resubmit. And then please also add the comment about tap having
the same path.

>
> Hangbin
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
