Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5164490329
	for <lists.virtualization@lfdr.de>; Mon, 17 Jan 2022 08:50:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D7A98144C;
	Mon, 17 Jan 2022 07:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUkSqiyEEMJM; Mon, 17 Jan 2022 07:50:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E04C8143C;
	Mon, 17 Jan 2022 07:50:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA034C007A;
	Mon, 17 Jan 2022 07:50:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 191E9C002F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F423481448
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CKcyPygiqa3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:50:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE2778143C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:50:00 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so4688202ooj.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Jan 2022 23:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88ZVVuW9T4vQ1yIyfpc5Ky/CiG+QJjRcfQxSez36Nz8=;
 b=oNvpfxBFVBTGQevGCdpBAD+BMKWaFLMkH7WWPmNgCDcOtPeGbiasg3crKA0Onn69Rj
 N4oLcoLLG1ueBnpjiLL3N3HBNPFYsBsLKlD+Y7phx3of9r+yZtgm7nucuNAJJ00UvS8E
 OfoT4bTmnYIiiyzk0L58oMvUUP4nXn5hUjsXVZTh5p7dcgBwnQboFHsFEHXo0VJiFQS4
 9MKckbFqsJd0C4rgZ9Vm6AbAhuRjqAF9QMOo1IzscFYJ+QhjZKVVfZ9JXJB/ErW0q+1C
 9aOsg3haZbx6flvb3qGmgx9Whrk0MKOsfuFdgO4cSAHM46JPz+lFz0wnHoSHFxJWaWa9
 tBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88ZVVuW9T4vQ1yIyfpc5Ky/CiG+QJjRcfQxSez36Nz8=;
 b=Da5181VY8ZNc01lkPws6k4f9YE/p4t0sXn3CuOovFXAqsPI+gk1QKhgT4IdZooVfIN
 32vw/isKcSoakwafQfniTIvksHiVb3j6q8umu0QOF1LPJb6QJqCY0HTRZ8FUhkdZTPrS
 ZBoMAZrUQrZUIKqVzM+NDaX8wWiwpXBKg2Mhi+jWk/GvOEvtSxhugdkG9Ichs0Wj+WmR
 BdQxUUe9pacmW+5JWLJCcdl9geBBZTn8LqXSdPvHC2Rb1iC6UId6/yUcB4+RjiwgUFVh
 98AElMZPCwt6jfIU06Tszq2t0vTm/aVgGw1bxqlGactxA5+MoQ92EyRwq+2bTpn8BYY2
 mOaA==
X-Gm-Message-State: AOAM533L4vO8sqo0EuUSdSTmfXQ9Sd4CS8mmBf+dPkFc+m4Seo295BpB
 Q3rUGIjcj/fnbK61ZygsOfA+3yBVPSIOG/yc/1w/9g==
X-Google-Smtp-Source: ABdhPJz5JPkBM0CoM7m/HQ207y+CNdeYM6qIznSl0C0OyeBGwHC6apPQk4PhBen8HtImKyypuzAGbCGnyxKTTwAOjYk=
X-Received: by 2002:a4a:1a05:: with SMTP id 5mr13411215oof.42.1642405799830;
 Sun, 16 Jan 2022 23:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20220109210659.2866740-1-andrew@daynix.com>
 <20220109210659.2866740-3-andrew@daynix.com>
 <20220111065539-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220111065539-mutt-send-email-mst@kernel.org>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 17 Jan 2022 09:49:48 +0200
Message-ID: <CABcq3pG4SV5i_dnFicrVqRbxu_izLdQDdOmDYEOxF9Bv56X-Pw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drivers/net/virtio_net: Added basic RSS support.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, kuba@kernel.org, davem@davemloft.net
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

Hi all

> Is this correct if both mergeable_rx_bufs and hash_report are set?
Yes, there is a similar code in qemu.

> Can we simply do virtio_cread_feature(vdev, VIRTIO_NET_F_MQ |
> VIRTIO_NET_F_RSS, ...) ?
No, VIRTIO_NET_F_* is bit offset - so in the end "1 <<
(VIRTIO_NET_F_MQ | VIRTIO_NET_F_RSS)" is not valid.

> Is rtnl_lock() really needed here consider we haven't even register netdev?
I'll remove rtnl lock.

> Generally best to avoid __packed.
I'll refactor the structure.

On Tue, Jan 11, 2022 at 2:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Jan 09, 2022 at 11:06:57PM +0200, Andrew Melnychenko wrote:
> > Added features for RSS.
> > Added initialization, RXHASH feature and ethtool ops.
> > By default RSS/RXHASH is disabled.
> > Virtio RSS "IPv6 extensions" hashes disabled.
> > Added ethtools ops to set key and indirection table.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  drivers/net/virtio_net.c | 194 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 184 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 66439ca488f4..21794731fc75 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -169,6 +169,28 @@ struct receive_queue {
> >       struct xdp_rxq_info xdp_rxq;
> >  };
> >
> > +/* This structure can contain rss message with maximum settings for indirection table and keysize
> > + * Note, that default structure that describes RSS configuration virtio_net_rss_config
> > + * contains same info but can't handle table values.
> > + * In any case, structure would be passed to virtio hw through sg_buf split by parts
> > + * because table sizes may be differ according to the device configuration.
> > + */
> > +#define VIRTIO_NET_RSS_MAX_KEY_SIZE     40
> > +#define VIRTIO_NET_RSS_MAX_TABLE_LEN    128
> > +struct virtio_net_ctrl_rss {
> > +     struct {
> > +             __le32 hash_types;
> > +             __le16 indirection_table_mask;
> > +             __le16 unclassified_queue;
> > +     } __packed table_info;
> > +     u16 indirection_table[VIRTIO_NET_RSS_MAX_TABLE_LEN];
> > +     struct {
> > +             u16 max_tx_vq; /* queues */
> > +             u8 hash_key_length;
> > +     } __packed key_info;
> > +     u8 key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
> > +};
> > +
>
> Generally best to avoid __packed.
> I think it's not a bad idea to just follow the spec when
> you lay out the structures. Makes it easier to follow
> that it matches. Spec has just a single struct:
>
> struct virtio_net_rss_config {
>     le32 hash_types;
>     le16 indirection_table_mask;
>     le16 unclassified_queue;
>     le16 indirection_table[indirection_table_length];
>     le16 max_tx_vq;
>     u8 hash_key_length;
>     u8 hash_key_data[hash_key_length];
> };
>
> and with this layout you don't need __packed.
>
>
>
> >  /* Control VQ buffers: protected by the rtnl lock */
> >  struct control_buf {
> >       struct virtio_net_ctrl_hdr hdr;
> > @@ -178,6 +200,7 @@ struct control_buf {
> >       u8 allmulti;
> >       __virtio16 vid;
> >       __virtio64 offloads;
> > +     struct virtio_net_ctrl_rss rss;
> >  };
> >
> >  struct virtnet_info {
> > @@ -206,6 +229,12 @@ struct virtnet_info {
> >       /* Host will merge rx buffers for big packets (shake it! shake it!) */
> >       bool mergeable_rx_bufs;
> >
> > +     /* Host supports rss and/or hash report */
> > +     bool has_rss;
> > +     u8 rss_key_size;
> > +     u16 rss_indir_table_size;
> > +     u32 rss_hash_types_supported;
> > +
> >       /* Has control virtqueue */
> >       bool has_cvq;
> >
> > @@ -395,9 +424,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
> >       hdr_p = p;
> >
> >       hdr_len = vi->hdr_len;
> > -     if (vi->has_rss_hash_report)
> > -             hdr_padded_len = sizeof(struct virtio_net_hdr_v1_hash);
> > -     else if (vi->mergeable_rx_bufs)
> > +     if (vi->mergeable_rx_bufs)
> >               hdr_padded_len = sizeof(*hdr);
> >       else
> >               hdr_padded_len = sizeof(struct padded_vnet_hdr);
> > @@ -2184,6 +2211,55 @@ static void virtnet_get_ringparam(struct net_device *dev,
> >       ring->tx_pending = ring->tx_max_pending;
> >  }
> >
> > +static bool virtnet_commit_rss_command(struct virtnet_info *vi)
> > +{
> > +     struct net_device *dev = vi->dev;
> > +     struct scatterlist sgs[4];
> > +     unsigned int sg_buf_size;
> > +
> > +     /* prepare sgs */
> > +     sg_init_table(sgs, 4);
> > +
> > +     sg_buf_size = sizeof(vi->ctrl->rss.table_info);
> > +     sg_set_buf(&sgs[0], &vi->ctrl->rss.table_info, sg_buf_size);
> > +
> > +     sg_buf_size = sizeof(uint16_t) * vi->rss_indir_table_size;
> > +     sg_set_buf(&sgs[1], vi->ctrl->rss.indirection_table, sg_buf_size);
> > +
> > +     sg_buf_size = sizeof(vi->ctrl->rss.key_info);
> > +     sg_set_buf(&sgs[2], &vi->ctrl->rss.key_info, sg_buf_size);
> > +
> > +     sg_buf_size = vi->rss_key_size;
> > +     sg_set_buf(&sgs[3], vi->ctrl->rss.key, sg_buf_size);
> > +
> > +     if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_MQ,
> > +                               VIRTIO_NET_CTRL_MQ_RSS_CONFIG, sgs)) {
> > +             dev_warn(&dev->dev, "VIRTIONET issue with committing RSS sgs\n");
> > +             return false;
> > +     }
> > +     return true;
> > +}
> > +
> > +static void virtnet_init_default_rss(struct virtnet_info *vi)
> > +{
> > +     u32 indir_val = 0;
> > +     int i = 0;
> > +
> > +     vi->ctrl->rss.table_info.hash_types = vi->rss_hash_types_supported;
> > +     vi->ctrl->rss.table_info.indirection_table_mask = vi->rss_indir_table_size - 1;
> > +     vi->ctrl->rss.table_info.unclassified_queue = 0;
> > +
> > +     for (; i < vi->rss_indir_table_size; ++i) {
> > +             indir_val = ethtool_rxfh_indir_default(i, vi->max_queue_pairs);
> > +             vi->ctrl->rss.indirection_table[i] = indir_val;
> > +     }
> > +
> > +     vi->ctrl->rss.key_info.max_tx_vq = vi->curr_queue_pairs;
> > +     vi->ctrl->rss.key_info.hash_key_length = vi->rss_key_size;
> > +
> > +     netdev_rss_key_fill(vi->ctrl->rss.key, vi->rss_key_size);
> > +}
> > +
> >
> >  static void virtnet_get_drvinfo(struct net_device *dev,
> >                               struct ethtool_drvinfo *info)
> > @@ -2412,6 +2488,71 @@ static void virtnet_update_settings(struct virtnet_info *vi)
> >               vi->duplex = duplex;
> >  }
> >
> > +static u32 virtnet_get_rxfh_key_size(struct net_device *dev)
> > +{
> > +     return ((struct virtnet_info *)netdev_priv(dev))->rss_key_size;
> > +}
> > +
> > +static u32 virtnet_get_rxfh_indir_size(struct net_device *dev)
> > +{
> > +     return ((struct virtnet_info *)netdev_priv(dev))->rss_indir_table_size;
> > +}
> > +
> > +static int virtnet_get_rxfh(struct net_device *dev, u32 *indir, u8 *key, u8 *hfunc)
> > +{
> > +     struct virtnet_info *vi = netdev_priv(dev);
> > +     int i;
> > +
> > +     if (indir) {
> > +             for (i = 0; i < vi->rss_indir_table_size; ++i)
> > +                     indir[i] = vi->ctrl->rss.indirection_table[i];
> > +     }
> > +
> > +     if (key)
> > +             memcpy(key, vi->ctrl->rss.key, vi->rss_key_size);
> > +
> > +     if (hfunc)
> > +             *hfunc = ETH_RSS_HASH_TOP;
> > +
> > +     return 0;
> > +}
> > +
> > +static int virtnet_set_rxfh(struct net_device *dev, const u32 *indir, const u8 *key, const u8 hfunc)
> > +{
> > +     struct virtnet_info *vi = netdev_priv(dev);
> > +     int i;
> > +
> > +     if (hfunc != ETH_RSS_HASH_NO_CHANGE && hfunc != ETH_RSS_HASH_TOP)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (indir) {
> > +             for (i = 0; i < vi->rss_indir_table_size; ++i)
> > +                     vi->ctrl->rss.indirection_table[i] = indir[i];
> > +     }
> > +     if (key)
> > +             memcpy(vi->ctrl->rss.key, key, vi->rss_key_size);
> > +
> > +     virtnet_commit_rss_command(vi);
> > +
> > +     return 0;
> > +}
> > +
> > +static int virtnet_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info, u32 *rule_locs)
> > +{
> > +     struct virtnet_info *vi = netdev_priv(dev);
> > +     int rc = 0;
> > +
> > +     switch (info->cmd) {
> > +     case ETHTOOL_GRXRINGS:
> > +             info->data = vi->curr_queue_pairs;
> > +             break;
> > +     default:
> > +             rc = -EOPNOTSUPP;
> > +     }
> > +
> > +     return rc;
> > +}
> > +
> >  static const struct ethtool_ops virtnet_ethtool_ops = {
> >       .supported_coalesce_params = ETHTOOL_COALESCE_MAX_FRAMES,
> >       .get_drvinfo = virtnet_get_drvinfo,
> > @@ -2427,6 +2568,11 @@ static const struct ethtool_ops virtnet_ethtool_ops = {
> >       .set_link_ksettings = virtnet_set_link_ksettings,
> >       .set_coalesce = virtnet_set_coalesce,
> >       .get_coalesce = virtnet_get_coalesce,
> > +     .get_rxfh_key_size = virtnet_get_rxfh_key_size,
> > +     .get_rxfh_indir_size = virtnet_get_rxfh_indir_size,
> > +     .get_rxfh = virtnet_get_rxfh,
> > +     .set_rxfh = virtnet_set_rxfh,
> > +     .get_rxnfc = virtnet_get_rxnfc,
> >  };
> >
> >  static void virtnet_freeze_down(struct virtio_device *vdev)
> > @@ -3073,7 +3219,8 @@ static bool virtnet_validate_features(struct virtio_device *vdev)
> >                            "VIRTIO_NET_F_CTRL_VQ") ||
> >            VIRTNET_FAIL_ON(vdev, VIRTIO_NET_F_MQ, "VIRTIO_NET_F_CTRL_VQ") ||
> >            VIRTNET_FAIL_ON(vdev, VIRTIO_NET_F_CTRL_MAC_ADDR,
> > -                          "VIRTIO_NET_F_CTRL_VQ"))) {
> > +                          "VIRTIO_NET_F_CTRL_VQ") ||
> > +          VIRTNET_FAIL_ON(vdev, VIRTIO_NET_F_RSS, "VIRTIO_NET_F_RSS"))) {
> >               return false;
> >       }
> >
> > @@ -3113,13 +3260,14 @@ static int virtnet_probe(struct virtio_device *vdev)
> >       u16 max_queue_pairs;
> >       int mtu;
> >
> > -     /* Find if host supports multiqueue virtio_net device */
> > -     err = virtio_cread_feature(vdev, VIRTIO_NET_F_MQ,
> > -                                struct virtio_net_config,
> > -                                max_virtqueue_pairs, &max_queue_pairs);
> > +     /* Find if host supports multiqueue/rss virtio_net device */
> > +     max_queue_pairs = 0;
> > +     if (virtio_has_feature(vdev, VIRTIO_NET_F_MQ) || virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
> > +             max_queue_pairs =
> > +                  virtio_cread16(vdev, offsetof(struct virtio_net_config, max_virtqueue_pairs));
> >
> >       /* We need at least 2 queue's */
> > -     if (err || max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
> > +     if (max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
> >           max_queue_pairs > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
> >           !virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
> >               max_queue_pairs = 1;
> > @@ -3207,6 +3355,25 @@ static int virtnet_probe(struct virtio_device *vdev)
> >       if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF))
> >               vi->mergeable_rx_bufs = true;
> >
> > +     if (virtio_has_feature(vdev, VIRTIO_NET_F_RSS)) {
> > +             vi->has_rss = true;
> > +             vi->rss_indir_table_size =
> > +                     virtio_cread16(vdev, offsetof(struct virtio_net_config,
> > +                                                   rss_max_indirection_table_length));
> > +             vi->rss_key_size =
> > +                     virtio_cread8(vdev, offsetof(struct virtio_net_config, rss_max_key_size));
> > +     }
> > +
> > +     if (vi->has_rss) {
> > +             vi->rss_hash_types_supported =
> > +                 virtio_cread32(vdev, offsetof(struct virtio_net_config, supported_hash_types));
> > +             vi->rss_hash_types_supported &=
> > +                             ~(VIRTIO_NET_RSS_HASH_TYPE_IP_EX |
> > +                               VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
> > +                               VIRTIO_NET_RSS_HASH_TYPE_UDP_EX);
> > +
> > +             dev->hw_features |= NETIF_F_RXHASH;
> > +     }
> >       if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF) ||
> >           virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
> >               vi->hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
> > @@ -3275,6 +3442,12 @@ static int virtnet_probe(struct virtio_device *vdev)
> >               }
> >       }
> >
> > +     if (vi->has_rss) {
> > +             rtnl_lock();
> > +             virtnet_init_default_rss(vi);
> > +             rtnl_unlock();
> > +     }
> > +
> >       err = register_netdev(dev);
> >       if (err) {
> >               pr_debug("virtio_net: registering device failed\n");
> > @@ -3406,7 +3579,8 @@ static struct virtio_device_id id_table[] = {
> >       VIRTIO_NET_F_GUEST_ANNOUNCE, VIRTIO_NET_F_MQ, \
> >       VIRTIO_NET_F_CTRL_MAC_ADDR, \
> >       VIRTIO_NET_F_MTU, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
> > -     VIRTIO_NET_F_SPEED_DUPLEX, VIRTIO_NET_F_STANDBY
> > +     VIRTIO_NET_F_SPEED_DUPLEX, VIRTIO_NET_F_STANDBY, \
> > +     VIRTIO_NET_F_RSS
> >
> >  static unsigned int features[] = {
> >       VIRTNET_FEATURES,
> > --
> > 2.34.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
