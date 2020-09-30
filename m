Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57627E631
	for <lists.virtualization@lfdr.de>; Wed, 30 Sep 2020 12:05:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98B868683F;
	Wed, 30 Sep 2020 10:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uainV9ke9Y4H; Wed, 30 Sep 2020 10:05:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A1C2866EA;
	Wed, 30 Sep 2020 10:05:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E31D5C016F;
	Wed, 30 Sep 2020 10:05:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32E53C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 10:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18A7E871EB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 10:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqxqCjLrPIcl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 10:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B59AA8719A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 10:05:52 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id u7so363274vsq.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sw8MWy65K0URDWaVY+ZCIih81TlOoNQvNGMszTNW1YA=;
 b=IqLZYi0/AWq+R/9zodfquqj+KRUjW5h5YHkOyw8Vbwg0hNPltUrL8Gb/TdSIKNmbdu
 FfpRSdyjbcQSzmq2tEyhoZBkgXqy95s5avi9YHdbx2a8E/pjOwzefzCqWFM/JK9wcZ9Z
 U9S+AKxVfXPUYaPkBV3AtI9Yg3e40Bw8Y2khnVsqy/VBZK4bcX6FdfHUi36lmvojPKUI
 dvbvNz4aycRHCSSpDitxfEMN0VsTeD7XUylkYhPhdGP6cOL9SIayl3Zn4TU9FnuflWl/
 yFyfhef9JGUsGhLfnO8ssWMxT0wrk03foCNN7TSDn77daKMVXLXPWOENHEbVwTvjZsAN
 uBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sw8MWy65K0URDWaVY+ZCIih81TlOoNQvNGMszTNW1YA=;
 b=i+NWJCdBvt2XLmrU6Hr/WEv67B/Q3Tl7gHR2V99+4wW7vY1JWb7Lkx+JZ61Z9ITtkt
 RUwq2GiF3WRcHe29LMzGw9dbVRFq6CJdfME5W7ObGyHN6qyCLv73AG20Lkfr/TeLQE+G
 BYV7Lg028V9USgvGfZeIv4uLpHHSZisDrfv7Pw7lXQTAbCKHMgkCYm//zZLb65d5BJwt
 RD+nw8BwvNnHG0n6kLBvY/HxsQn3ZetgIoqKzdlD/nim6ctfNXSRjMbDKRFlfF2HJUnH
 MZel9qG3ifpYFOiS26V37QmNNXRgy4Oa+aDxSDYY3bnKuYJDELRnO8ATrIHy3l8dPWl6
 42cA==
X-Gm-Message-State: AOAM530J9YvOzjZ7MRRgStZzj/7lOL9ylPB2iiEp5DN3HIU6LJC3AO2Z
 lIhsgKFQvyw2quwFDQqe8a8dFjQlefyTpg==
X-Google-Smtp-Source: ABdhPJzVdVjcagYiulZdWGGvcW6XdMS15wO9yRd4nMI1tXOASc04+FyNlXbsWfg47DjmwXDW1IE19Q==
X-Received: by 2002:a67:ed48:: with SMTP id m8mr788865vsp.47.1601460350755;
 Wed, 30 Sep 2020 03:05:50 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id i67sm142330vkg.55.2020.09.30.03.05.49
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 03:05:49 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id h23so284135vkn.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 03:05:49 -0700 (PDT)
X-Received: by 2002:a1f:1f15:: with SMTP id f21mr751691vkf.12.1601460348742;
 Wed, 30 Sep 2020 03:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200930020300.62245-1-xiangxia.m.yue@gmail.com>
In-Reply-To: <20200930020300.62245-1-xiangxia.m.yue@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 30 Sep 2020 12:05:12 +0200
X-Gmail-Original-Message-ID: <CA+FuTSed1GsGp8a=GnHqV-HUcsOSZ0tb0NCe8360S8Md3MbS3g@mail.gmail.com>
Message-ID: <CA+FuTSed1GsGp8a=GnHqV-HUcsOSZ0tb0NCe8360S8Md3MbS3g@mail.gmail.com>
Subject: Re: [PATCH net-next v2] virtio-net: ethtool configurable RXCSUM
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

On Wed, Sep 30, 2020 at 4:05 AM <xiangxia.m.yue@gmail.com> wrote:
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
> Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>

The first patch was merged into net.

Please wait until that is merged into net-next, as this depends on the
other patch.

> ---
> v2:
> * LRO depends the rx csum
> * remove the unnecessary check
> ---
>  drivers/net/virtio_net.c | 49 ++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 21b71148c532..5407a0106771 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -68,6 +68,8 @@ static const unsigned long guest_offloads[] = {
>                                 (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
>                                 (1ULL << VIRTIO_NET_F_GUEST_UFO))
>
> +#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
> +
>  struct virtnet_stat_desc {
>         char desc[ETH_GSTRING_LEN];
>         size_t offset;
> @@ -2522,29 +2524,49 @@ static int virtnet_get_phys_port_name(struct net_device *dev, char *buf,
>         return 0;
>  }
>
> +static netdev_features_t virtnet_fix_features(struct net_device *netdev,
> +                                             netdev_features_t features)
> +{
> +       /* If Rx checksum is disabled, LRO should also be disabled.
> +        * That is life. :)

Please remove this second line.

> +        */
> +       if (!(features & NETIF_F_RXCSUM))
> +               features &= ~NETIF_F_LRO;
> +
> +       return features;
> +}
> +
>  static int virtnet_set_features(struct net_device *dev,
>                                 netdev_features_t features)
>  {
>         struct virtnet_info *vi = netdev_priv(dev);
> -       u64 offloads;
> +       u64 offloads = vi->guest_offloads &
> +                      vi->guest_offloads_capable;

When can vi->guest_offloads have bits set outside the mask of
vi->guest_offloads_capable?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
