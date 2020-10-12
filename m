Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D67228B661
	for <lists.virtualization@lfdr.de>; Mon, 12 Oct 2020 15:34:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3C0D1207B0;
	Mon, 12 Oct 2020 13:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdwMejuzzHFS; Mon, 12 Oct 2020 13:34:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3961E20C45;
	Mon, 12 Oct 2020 13:34:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4B33C0051;
	Mon, 12 Oct 2020 13:34:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9C2CC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 13:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C20D286999
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 13:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h93NO39Ht4-L
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 13:34:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0B736867D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 13:34:38 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id u7so9092706vsq.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rKlAI4VcpxoazHMfmiz07xfIfCv2gl8wbl6h7oKeIcw=;
 b=O1SiDHg0N75UnJq9CLsvCVIYbB3HIpnq+lXG+u77urEnT4Y6aihwAgvRkc+5Hzd2cq
 SznlkCfBSTLBj3Xy+eH3B+uhxQNkVyRzM7/YIkMkdtpZhnJEQEMNgc8JgXVyGo82iXTl
 tpHaRoQQg2jxQ4KfwRMdSDoZFxyFL8L3QkCOM0rRvlU6D4ejP8eYXa3ZbzZFoLz6HQX/
 SMMR9divIfFz9N/6m6hIm7Mowwz4sghjoUJKWaU4zw6JPsEmgkOsGiUi00j9KkGqxKCY
 XlMnSrbmO4WNe2knKg0M1dCn9C26LK3jOYuQGXXBmvizlrKbVfeYrUrx98CVwtLFNSw5
 lLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rKlAI4VcpxoazHMfmiz07xfIfCv2gl8wbl6h7oKeIcw=;
 b=CeshBYkzbJ5kboLQTG//KqdvYwcc9x3RoUk7hlQcdNYtKqpxw38NafLkzTM2rEwWub
 7UEtrN7GvFfvlynRW4heq7oo+N6dJfVGijZlePduI8OOjiOZdBzpgGZoEbUYFFKXtNfi
 YlICRNYRTN8bLefNBIzHABMiWSjZoItUaMCBKqZm2rYA+RKFf02JEEzMlSWO0sZqsK9l
 2+yFC/Vsn28FSTF27iTb/+NGxcpzVXIMiXc8DMVCP+hf5eN6gGo6mFDT6vMr3jzZb/er
 vwe6Yu+6L8SGrl5scLjzFmX55ntU941PcWX1qI/BDJkQIxxNBPErLoA246WxegDOiqfI
 sIgQ==
X-Gm-Message-State: AOAM530oYtvmxVUME54bZTWtY7lODiECWkCOgdxexztGv+pYYLj7gTB8
 FKkWRGXDSuDD4IXmIBBp20vSaJBnJPM=
X-Google-Smtp-Source: ABdhPJxubzNdwRdWrTs6+c6Y9zBojyFZa3ghiHzlotuSn+UY1q1E/pnGdTDzchkBfrvvuH/5D5bZqQ==
X-Received: by 2002:a67:6484:: with SMTP id y126mr911555vsb.58.1602509676215; 
 Mon, 12 Oct 2020 06:34:36 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id m1sm1391362vsd.14.2020.10.12.06.34.35
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 06:34:35 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id z10so3834261vkn.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 06:34:35 -0700 (PDT)
X-Received: by 2002:a1f:1f0d:: with SMTP id f13mr13410484vkf.1.1602509674648; 
 Mon, 12 Oct 2020 06:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201012015820.62042-1-xiangxia.m.yue@gmail.com>
In-Reply-To: <20201012015820.62042-1-xiangxia.m.yue@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 12 Oct 2020 09:33:57 -0400
X-Gmail-Original-Message-ID: <CA+FuTSdHG4n4xRgg0-3-wOEp_kKHrEV-eSH8YeQhMOsUbamCiw@mail.gmail.com>
Message-ID: <CA+FuTSdHG4n4xRgg0-3-wOEp_kKHrEV-eSH8YeQhMOsUbamCiw@mail.gmail.com>
Subject: Re: [PATCH net-next v3] virtio-net: ethtool configurable RXCSUM
To: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Sun, Oct 11, 2020 at 10:03 PM <xiangxia.m.yue@gmail.com> wrote:
>
> From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
>
> Allow user configuring RXCSUM separately with ethtool -K,
> reusing the existing virtnet_set_guest_offloads helper
> that configures RXCSUM for XDP. This is conditional on
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
>
> If Rx checksum is disabled, LRO should also be disabled.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Willem de Bruijn <willemb@google.com>

I had to recall why we cannot just rely on dev->features and
dev->hw_features to encode the set of feature capabilities, but need
guest_offloads_capable.

Flag NETIF_F_LRO encapsulates multiple VIRTIO_NET_F_GUEST_.. flags,
and a device may advertise a subset. We thus have to bound to the set
learned at probing time.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
