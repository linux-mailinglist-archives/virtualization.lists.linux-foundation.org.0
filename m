Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B284AE29D
	for <lists.virtualization@lfdr.de>; Tue,  8 Feb 2022 21:37:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB46C8278F;
	Tue,  8 Feb 2022 20:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKqlXeKuBYxT; Tue,  8 Feb 2022 20:37:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 67A8D827A8;
	Tue,  8 Feb 2022 20:37:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA9C8C0039;
	Tue,  8 Feb 2022 20:37:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D62D4C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 20:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB0E4410B6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 20:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYV3rrkCrqB1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 20:37:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8133F410B1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 20:37:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ka4so1021975ejc.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Feb 2022 12:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OW+l8k2do19la/JXNnlav8oVlWK2sJt3MhQuSFM7S30=;
 b=lL5ReZjQMsAdWfcRmbvR6elnSObq1RPbWc2qqG2arpyoakVIWBoz46ZkAQqDvqgDln
 lb3IS8jO1tP+fwjufsQN7XBhANMoPZBOJOyakGICEeUtHEvMyEju8McygMYjPcU9gfDI
 bi1NHJ6O21q/h8T0FXAOcdZfsUxasKroKReNHkpQvDI65dBaHF+/gTvq1zjnbCK0ImjK
 As5ji22vw52fb8/u2DicrZYlrz3EJjrvZSOfNa4QJeOwp1E58eVoUVorgd8z2fzIqTWB
 zLQL5NfXKWU3H6KBFavLTYMSgOB2L8NGisU9R9OF8CWvDTBTwNbsJe73vSXM3c8ydFKs
 qwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OW+l8k2do19la/JXNnlav8oVlWK2sJt3MhQuSFM7S30=;
 b=Np9m3nAbNtNSEEGLeCJwY4lwlexWwTWHYoBKbfEV4J1lBZcX5UOsQ0DJoM0kekdNDS
 hKJi3udi0p2Q6QMN1QI2E0GmqRHayZZGP8joJ+GDIkI6gTA/aRkhHB4m/dxEQQS9N74s
 5bVCyVagwC8ViRAn+jnLtL0IAiwK9qNhhRJfm0ZX3m5xmMKdLMtzY0cTFQ7tYS4cNMbd
 iZhqyXXbgFCYf66m6NBgqpuHwLFDoSfr69Fwpb7lDVvsj1ltW6tk348M1qmW3NvBFDnq
 eXRUjz5SwCVQ2fUg609ptjwgHuw0aY6OYZwYfGqFt65h+fF0Zkw5KTWeRdgLMfhtUIjV
 v5dA==
X-Gm-Message-State: AOAM532ZJmE39ey3brqgQmKB6LTLuS914A6BTgsRMhvtYmBuqnyxhYBc
 fwxFQHYtRQTAWDBAwol5vs9EF+TT+njkAg==
X-Google-Smtp-Source: ABdhPJzZZRyIyw0BltR6tqab5kK8VvH8a8HZY4InZMVPdVB9WzEZHHMZOItfdtRCat5W+TR82W1ZsQ==
X-Received: by 2002:a17:907:d8c:: with SMTP id
 go12mr3690767ejc.432.1644352658220; 
 Tue, 08 Feb 2022 12:37:38 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id v19sm5177604edw.39.2022.02.08.12.37.36
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:37:37 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id m14so402736wrg.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Feb 2022 12:37:36 -0800 (PST)
X-Received: by 2002:adf:f905:: with SMTP id b5mr4910731wrr.173.1644352656172; 
 Tue, 08 Feb 2022 12:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20220208181510.787069-1-andrew@daynix.com>
 <20220208181510.787069-3-andrew@daynix.com>
In-Reply-To: <20220208181510.787069-3-andrew@daynix.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 8 Feb 2022 15:36:59 -0500
X-Gmail-Original-Message-ID: <CA+FuTSfPq-052=D3GzibMjUNXEcHTz=p87vW_3qU0OH9dDHSPQ@mail.gmail.com>
Message-ID: <CA+FuTSfPq-052=D3GzibMjUNXEcHTz=p87vW_3qU0OH9dDHSPQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drivers/net/virtio_net: Added basic RSS support.
To: Andrew Melnychenko <andrew@daynix.com>
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, yuri.benditovich@daynix.com,
 yan@daynix.com, kuba@kernel.org, davem@davemloft.net
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

On Tue, Feb 8, 2022 at 1:19 PM Andrew Melnychenko <andrew@daynix.com> wrote:
>
> Added features for RSS.
> Added initialization, RXHASH feature and ethtool ops.
> By default RSS/RXHASH is disabled.
> Virtio RSS "IPv6 extensions" hashes disabled.
> Added ethtools ops to set key and indirection table.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  drivers/net/virtio_net.c | 191 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 185 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 1404e683a2fd..495aed524e33 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -169,6 +169,24 @@ struct receive_queue {
>         struct xdp_rxq_info xdp_rxq;
>  };
>
> +/* This structure can contain rss message with maximum settings for indirection table and keysize
> + * Note, that default structure that describes RSS configuration virtio_net_rss_config
> + * contains same info but can't handle table values.
> + * In any case, structure would be passed to virtio hw through sg_buf split by parts
> + * because table sizes may be differ according to the device configuration.
> + */
> +#define VIRTIO_NET_RSS_MAX_KEY_SIZE     40

Future proof, may want to support larger sizes.

netdevice.h defines NETDEV_RSS_KEY_LEN at 52.

tools/testing/selftests/net/toeplitz.c supports up to 60

> +#define VIRTIO_NET_RSS_MAX_TABLE_LEN    128
> +struct virtio_net_ctrl_rss {
> +       u32 hash_types;

conversely, u32 is a bit extreme?

> +       u16 indirection_table_mask;
> +       u16 unclassified_queue;
> +       u16 indirection_table[VIRTIO_NET_RSS_MAX_TABLE_LEN];
> +       u16 max_tx_vq;
> +       u8 hash_key_length;
> +       u8 key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
> +};
> +
>  /* Control VQ buffers: protected by the rtnl lock */
>  struct control_buf {
>         struct virtio_net_ctrl_hdr hdr;
> @@ -178,6 +196,7 @@ struct control_buf {
>         u8 allmulti;
>         __virtio16 vid;
>         __virtio64 offloads;
> +       struct virtio_net_ctrl_rss rss;
>  };
>
>  struct virtnet_info {
> @@ -206,6 +225,12 @@ struct virtnet_info {
>         /* Host will merge rx buffers for big packets (shake it! shake it!) */
>         bool mergeable_rx_bufs;
>
> +       /* Host supports rss and/or hash report */
> +       bool has_rss;
> +       u8 rss_key_size;
> +       u16 rss_indir_table_size;
> +       u32 rss_hash_types_supported;
> +
>         /* Has control virtqueue */
>         bool has_cvq;
>
> @@ -2184,6 +2209,56 @@ static void virtnet_get_ringparam(struct net_device *dev,
>         ring->tx_pending = ring->tx_max_pending;
>  }
>
> +static bool virtnet_commit_rss_command(struct virtnet_info *vi)
> +{
> +       struct net_device *dev = vi->dev;
> +       struct scatterlist sgs[4];
> +       unsigned int sg_buf_size;
> +
> +       /* prepare sgs */
> +       sg_init_table(sgs, 4);
> +
> +       sg_buf_size = offsetof(struct virtio_net_ctrl_rss, indirection_table);
> +       sg_set_buf(&sgs[0], &vi->ctrl->rss, sg_buf_size);
> +
> +       sg_buf_size = sizeof(uint16_t) * vi->rss_indir_table_size;
> +       sg_set_buf(&sgs[1], vi->ctrl->rss.indirection_table, sg_buf_size);
> +
> +       sg_buf_size = offsetof(struct virtio_net_ctrl_rss, key)
> +                       - offsetof(struct virtio_net_ctrl_rss, max_tx_vq);
> +       sg_set_buf(&sgs[2], &vi->ctrl->rss.max_tx_vq, sg_buf_size);
> +
> +       sg_buf_size = vi->rss_key_size;
> +       sg_set_buf(&sgs[3], vi->ctrl->rss.key, sg_buf_size);
> +
> +       if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_MQ,
> +                                 VIRTIO_NET_CTRL_MQ_RSS_CONFIG, sgs)) {
> +               dev_warn(&dev->dev, "VIRTIONET issue with committing RSS sgs\n");
> +               return false;
> +       }
> +       return true;
> +}
> +
> +static void virtnet_init_default_rss(struct virtnet_info *vi)
> +{
> +       u32 indir_val = 0;
> +       int i = 0;
> +
> +       vi->ctrl->rss.hash_types = vi->rss_hash_types_supported;
> +       vi->ctrl->rss.indirection_table_mask = vi->rss_indir_table_size - 1;

Is table size always a power of two?

> +       vi->ctrl->rss.unclassified_queue = 0;
> +
> +       for (; i < vi->rss_indir_table_size; ++i) {
> +               indir_val = ethtool_rxfh_indir_default(i, vi->curr_queue_pairs);
> +               vi->ctrl->rss.indirection_table[i] = indir_val;
> +       }
> +
> +       vi->ctrl->rss.max_tx_vq = vi->curr_queue_pairs;
> +       vi->ctrl->rss.hash_key_length = vi->rss_key_size;
> +
> +       netdev_rss_key_fill(vi->ctrl->rss.key, vi->rss_key_size);
> +}
> +
>
>  static void virtnet_get_drvinfo(struct net_device *dev,
>                                 struct ethtool_drvinfo *info)
> @@ -2412,6 +2487,71 @@ static void virtnet_update_settings(struct virtnet_info *vi)
>                 vi->duplex = duplex;
>  }
>
> +static u32 virtnet_get_rxfh_key_size(struct net_device *dev)
> +{
> +       return ((struct virtnet_info *)netdev_priv(dev))->rss_key_size;
> +}
> +
> +static u32 virtnet_get_rxfh_indir_size(struct net_device *dev)
> +{
> +       return ((struct virtnet_info *)netdev_priv(dev))->rss_indir_table_size;
> +}
> +
> +static int virtnet_get_rxfh(struct net_device *dev, u32 *indir, u8 *key, u8 *hfunc)
> +{
> +       struct virtnet_info *vi = netdev_priv(dev);
> +       int i;
> +
> +       if (indir) {
> +               for (i = 0; i < vi->rss_indir_table_size; ++i)
> +                       indir[i] = vi->ctrl->rss.indirection_table[i];
> +       }
> +
> +       if (key)
> +               memcpy(key, vi->ctrl->rss.key, vi->rss_key_size);
> +
> +       if (hfunc)
> +               *hfunc = ETH_RSS_HASH_TOP;
> +
> +       return 0;
> +}
> +
> +static int virtnet_set_rxfh(struct net_device *dev, const u32 *indir, const u8 *key, const u8 hfunc)
> +{
> +       struct virtnet_info *vi = netdev_priv(dev);
> +       int i;
> +
> +       if (hfunc != ETH_RSS_HASH_NO_CHANGE && hfunc != ETH_RSS_HASH_TOP)
> +               return -EOPNOTSUPP;
> +
> +       if (indir) {
> +               for (i = 0; i < vi->rss_indir_table_size; ++i)
> +                       vi->ctrl->rss.indirection_table[i] = indir[i];
> +       }
> +       if (key)
> +               memcpy(vi->ctrl->rss.key, key, vi->rss_key_size);
> +
> +       virtnet_commit_rss_command(vi);
> +
> +       return 0;
> +}
> +
> +static int virtnet_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info, u32 *rule_locs)
> +{
> +       struct virtnet_info *vi = netdev_priv(dev);
> +       int rc = 0;
> +
> +       switch (info->cmd) {
> +       case ETHTOOL_GRXRINGS:
> +               info->data = vi->curr_queue_pairs;
> +               break;
> +       default:
> +               rc = -EOPNOTSUPP;
> +       }
> +
> +       return rc;
> +}
> +
>  static const struct ethtool_ops virtnet_ethtool_ops = {
>         .supported_coalesce_params = ETHTOOL_COALESCE_MAX_FRAMES,
>         .get_drvinfo = virtnet_get_drvinfo,
> @@ -2427,6 +2567,11 @@ static const struct ethtool_ops virtnet_ethtool_ops = {
>         .set_link_ksettings = virtnet_set_link_ksettings,
>         .set_coalesce = virtnet_set_coalesce,
>         .get_coalesce = virtnet_get_coalesce,
> +       .get_rxfh_key_size = virtnet_get_rxfh_key_size,
> +       .get_rxfh_indir_size = virtnet_get_rxfh_indir_size,
> +       .get_rxfh = virtnet_get_rxfh,
> +       .set_rxfh = virtnet_set_rxfh,
> +       .get_rxnfc = virtnet_get_rxnfc,
>  };
>
>  static void virtnet_freeze_down(struct virtio_device *vdev)
> @@ -2679,6 +2824,16 @@ static int virtnet_set_features(struct net_device *dev,
>                 vi->guest_offloads = offloads;
>         }
>
> +       if ((dev->features ^ features) & NETIF_F_RXHASH) {
> +               if (features & NETIF_F_RXHASH)
> +                       vi->ctrl->rss.hash_types = vi->rss_hash_types_supported;
> +               else
> +                       vi->ctrl->rss.hash_types = VIRTIO_NET_HASH_REPORT_NONE;
> +
> +               if (!virtnet_commit_rss_command(vi))
> +                       return -EINVAL;
> +       }
> +
>         return 0;
>  }
>
> @@ -3073,6 +3228,8 @@ static bool virtnet_validate_features(struct virtio_device *vdev)
>                              "VIRTIO_NET_F_CTRL_VQ") ||
>              VIRTNET_FAIL_ON(vdev, VIRTIO_NET_F_MQ, "VIRTIO_NET_F_CTRL_VQ") ||
>              VIRTNET_FAIL_ON(vdev, VIRTIO_NET_F_CTRL_MAC_ADDR,
> +                            "VIRTIO_NET_F_CTRL_VQ") ||
> +            VIRTNET_FAIL_ON(vdev, VIRTIO_NET_F_RSS,
>                              "VIRTIO_NET_F_CTRL_VQ"))) {
>                 return false;
>         }
> @@ -3113,13 +3270,14 @@ static int virtnet_probe(struct virtio_device *vdev)
>         u16 max_queue_pairs;
>         int mtu;
>
> -       /* Find if host supports multiqueue virtio_net device */
> -       err = virtio_cread_feature(vdev, VIRTIO_NET_F_MQ,
> -                                  struct virtio_net_config,
> -                                  max_virtqueue_pairs, &max_queue_pairs);
> +       /* Find if host supports multiqueue/rss virtio_net device */
> +       max_queue_pairs = 1;
> +       if (virtio_has_feature(vdev, VIRTIO_NET_F_MQ) || virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
> +               max_queue_pairs =
> +                    virtio_cread16(vdev, offsetof(struct virtio_net_config, max_virtqueue_pairs));

Instead of testing either feature and treating them as somewhat equal,
shouldn't RSS be dependent on MQ?

>
>         /* We need at least 2 queue's */
> -       if (err || max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
> +       if (max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
>             max_queue_pairs > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
>             !virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
>                 max_queue_pairs = 1;
> @@ -3207,6 +3365,23 @@ static int virtnet_probe(struct virtio_device *vdev)
>         if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF))
>                 vi->mergeable_rx_bufs = true;
>
> +       if (virtio_has_feature(vdev, VIRTIO_NET_F_RSS)) {
> +               vi->has_rss = true;
> +               vi->rss_indir_table_size =
> +                       virtio_cread16(vdev, offsetof(struct virtio_net_config,
> +                               rss_max_indirection_table_length));
> +               vi->rss_key_size =
> +                       virtio_cread8(vdev, offsetof(struct virtio_net_config, rss_max_key_size));
> +
> +               vi->rss_hash_types_supported =
> +                   virtio_cread32(vdev, offsetof(struct virtio_net_config, supported_hash_types));
> +               vi->rss_hash_types_supported &=
> +                               ~(VIRTIO_NET_RSS_HASH_TYPE_IP_EX |
> +                                 VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
> +                                 VIRTIO_NET_RSS_HASH_TYPE_UDP_EX);
> +
> +               dev->hw_features |= NETIF_F_RXHASH;

Only make the feature visible when the hash is actually reported in
the skb, patch 3.

Also, clearly separate the feature patches (2) rss, (3) rxhash, (4)
rxhash config.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
