Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F748BD58
	for <lists.virtualization@lfdr.de>; Wed, 12 Jan 2022 03:37:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F450404A6;
	Wed, 12 Jan 2022 02:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3M5H-FImh1pe; Wed, 12 Jan 2022 02:37:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E76A141497;
	Wed, 12 Jan 2022 02:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A661C0070;
	Wed, 12 Jan 2022 02:37:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 861BEC001E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jan 2022 02:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655C140939
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jan 2022 02:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhZnRUNxcdDL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jan 2022 02:37:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7DB240937
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jan 2022 02:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641955022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cYcl6RjQujKGDmTnlz380C5Wiv9/WB1PeIqogcc9Jxs=;
 b=NWgumxuDVaBma5tgjV3MpNHJMJ3vPj1EamhfWAeGpLIQ+QeCoBCDPobbaTL30VmLiz30Wh
 FdXC9ifhLF2fKygBp78YVHsZYrpJsv/dUFXq42sW6lylK3n+6vl3QreIXKYBHwkp3o/4Vy
 QxVxqmAqWHXftBfg6q/QpqDuggK4vW4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-GK7VmmDRPfGArd8BS2yOUQ-1; Tue, 11 Jan 2022 21:36:59 -0500
X-MC-Unique: GK7VmmDRPfGArd8BS2yOUQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 q14-20020ac246ee000000b0042c02909ed4so624929lfo.19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Jan 2022 18:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYcl6RjQujKGDmTnlz380C5Wiv9/WB1PeIqogcc9Jxs=;
 b=HwoE77Q+LvOG86ShCskKHnA0QSI8EvQUMpKOU5mcATHpc5bX2yVVhX3ibBJkBSkhHF
 8APMlTz7qX1+f9oz3rBpBRbY+I90OQn6eCoRj97zN5evQmHd3eaqe1TN0v/Lw8PDGJor
 XC7dLv8Cjel4fyZYU91ErC25huZyDcO4q3ih3iB2lMs5rW+e7HJvOFPGiFzXWjM4B3Ku
 nCrHJgKOdC8xH8cuRm2zErrTgjOGZg/mot8jLWOLCBKSkyeEX1qNQR3y0iOqdaqMcmcS
 u3WmvJqGrW2gCN5Cm+r09ZNhxF6a8MZ8UXIEufqznpI0HQGvBJJVhWVh7oVUrlleV7in
 Vp8A==
X-Gm-Message-State: AOAM531cRtO5/T4Jt3jEjuAeAYWVbeWeGuEP/UO6GuaUG3PU7JobDSVp
 xFERW6nH1rRZm3RnYyew/SrldfvsqHuT24udwHVRDmTNwt/GrgHG+ly8oQM7Usd57RRCpuIQxGo
 nl2iZd/pVafpKls+6iBOd8TE4K6PpD9PnCgUpySfSOOVrOh6J0ZC7aEqJCg==
X-Received: by 2002:a05:6512:108b:: with SMTP id
 j11mr5321304lfg.629.1641955017298; 
 Tue, 11 Jan 2022 18:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0PuNNl4h1qaLtg8as2pa7VdYyem4M6dXgHfPVOErQFYWoCCdIAHPhL95W8qboMXTg5koogrA6yhFzSTjm1NM=
X-Received: by 2002:a05:6512:108b:: with SMTP id
 j11mr5321286lfg.629.1641955016964; 
 Tue, 11 Jan 2022 18:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20220105114646.577224-1-elic@nvidia.com>
 <20220105114646.577224-8-elic@nvidia.com>
 <99150f0c-6814-a0cc-8640-aa8014af6ed0@oracle.com>
 <3205e802-a982-fbe2-511e-f5c28fc19b36@oracle.com>
 <20220109141023.GB70879@mtl-vdi-166.wap.labs.mlnx>
 <94048dc7-defa-2c7b-9350-540e8b9df227@oracle.com>
 <20220111073416.GB149570@mtl-vdi-166.wap.labs.mlnx>
 <CACGkMEsJYoEop+shT6mngH68pYbGzMQhC4FO9UtzDczv6Lvbzw@mail.gmail.com>
 <20220111070404-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220111070404-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Jan 2022 10:36:45 +0800
Message-ID: <CACGkMEuaqW+ueNg6RVSDCzkUvypynf_oAFLtKZ8RkJyt9Ax8mQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] vdpa/mlx5: Support configuring max data virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 eperezma <eperezma@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Eli Cohen <elic@nvidia.com>
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

On Tue, Jan 11, 2022 at 8:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jan 11, 2022 at 04:28:58PM +0800, Jason Wang wrote:
> > On Tue, Jan 11, 2022 at 3:34 PM Eli Cohen <elic@nvidia.com> wrote:
> > >
> > > On Mon, Jan 10, 2022 at 05:00:34PM -0800, Si-Wei Liu wrote:
> > > >
> > > >
> > > > On 1/9/2022 6:10 AM, Eli Cohen wrote:
> > > > > On Thu, Jan 06, 2022 at 05:50:24PM -0800, Si-Wei Liu wrote:
> > > > > >
> > > > > > On 1/6/2022 5:27 PM, Si-Wei Liu wrote:
> > > > > > >
> > > > > > > On 1/5/2022 3:46 AM, Eli Cohen wrote:
> > > > > > > > Check whether the max number of data virtqueue pairs was provided when a
> > > > > > > > adding a new device and verify the new value does not exceed device
> > > > > > > > capabilities.
> > > > > > > >
> > > > > > > > In addition, change the arrays holding virtqueue and callback contexts
> > > > > > > > to be dynamically allocated.
> > > > > > > >
> > > > > > > > Signed-off-by: Eli Cohen <elic@nvidia.com>
> > > > > > > > ---
> > > > > > > > v6 -> v7:
> > > > > > > > 1. Evaluate RQT table size based on config.max_virtqueue_pairs.
> > > > > > > >
> > > > > > > >    drivers/vdpa/mlx5/net/mlx5_vnet.c | 51 ++++++++++++++++++++++---------
> > > > > > > >    1 file changed, 37 insertions(+), 14 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > > > > b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > > > > index 4a2149f70f1e..d4720444bf78 100644
> > > > > > > > --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > > > > +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > > > > > > > @@ -131,11 +131,6 @@ struct mlx5_vdpa_virtqueue {
> > > > > > > >        struct mlx5_vq_restore_info ri;
> > > > > > > >    };
> > > > > > > >    -/* We will remove this limitation once mlx5_vdpa_alloc_resources()
> > > > > > > > - * provides for driver space allocation
> > > > > > > > - */
> > > > > > > > -#define MLX5_MAX_SUPPORTED_VQS 16
> > > > > > > > -
> > > > > > > >    static bool is_index_valid(struct mlx5_vdpa_dev *mvdev, u16 idx)
> > > > > > > >    {
> > > > > > > >        if (unlikely(idx > mvdev->max_idx))
> > > > > > > > @@ -148,8 +143,8 @@ struct mlx5_vdpa_net {
> > > > > > > >        struct mlx5_vdpa_dev mvdev;
> > > > > > > >        struct mlx5_vdpa_net_resources res;
> > > > > > > >        struct virtio_net_config config;
> > > > > > > > -    struct mlx5_vdpa_virtqueue vqs[MLX5_MAX_SUPPORTED_VQS];
> > > > > > > > -    struct vdpa_callback event_cbs[MLX5_MAX_SUPPORTED_VQS + 1];
> > > > > > > > +    struct mlx5_vdpa_virtqueue *vqs;
> > > > > > > > +    struct vdpa_callback *event_cbs;
> > > > > > > >          /* Serialize vq resources creation and destruction. This is
> > > > > > > > required
> > > > > > > >         * since memory map might change and we need to destroy and create
> > > > > > > > @@ -1218,7 +1213,7 @@ static void suspend_vqs(struct mlx5_vdpa_net
> > > > > > > > *ndev)
> > > > > > > >    {
> > > > > > > >        int i;
> > > > > > > >    -    for (i = 0; i < MLX5_MAX_SUPPORTED_VQS; i++)
> > > > > > > > +    for (i = 0; i < ndev->mvdev.max_vqs; i++)
> > > > > > > >            suspend_vq(ndev, &ndev->vqs[i]);
> > > > > > > >    }
> > > > > > > >    @@ -1244,8 +1239,14 @@ static int create_rqt(struct mlx5_vdpa_net
> > > > > > > > *ndev)
> > > > > > > >        void *in;
> > > > > > > >        int i, j;
> > > > > > > >        int err;
> > > > > > > > +    int num;
> > > > > > > >    -    max_rqt = min_t(int, MLX5_MAX_SUPPORTED_VQS / 2,
> > > > > > > > +    if (!(ndev->mvdev.actual_features & BIT_ULL(VIRTIO_NET_F_MQ)))
> > > > > > > > +        num = 1;
> > > > > > > > +    else
> > > > > > > > +        num = le16_to_cpu(ndev->config.max_virtqueue_pairs);
> > > > > > > > +
> > > > > > > > +    max_rqt = min_t(int, roundup_pow_of_two(num),
> > > > > > > >                1 << MLX5_CAP_GEN(ndev->mvdev.mdev, log_max_rqt_size));
> > > > > > > >        if (max_rqt < 1)
> > > > > > > >            return -EOPNOTSUPP;
> > > > > > > > @@ -1262,7 +1263,7 @@ static int create_rqt(struct mlx5_vdpa_net *ndev)
> > > > > > > >        MLX5_SET(rqtc, rqtc, rqt_max_size, max_rqt);
> > > > > > > >        list = MLX5_ADDR_OF(rqtc, rqtc, rq_num[0]);
> > > > > > > >        for (i = 0, j = 0; i < max_rqt; i++, j += 2)
> > > > > > > > -        list[i] = cpu_to_be32(ndev->vqs[j %
> > > > > > > > ndev->mvdev.max_vqs].virtq_id);
> > > > > > > > +        list[i] = cpu_to_be32(ndev->vqs[j % (2 * num)].virtq_id);
> > > > > > > Good catch. LGTM.
> > > > > > >
> > > > > > > Reviewed-by: Si-Wei Liu<si-wei.liu@oracle.com>
> > > > > > >
> > > > > > Apologies to reply to myself. It looks to me we need to set cur_num_vqs to
> > > > > > the negotiated num of queues. Otherwise any site referencing cur_num_vqs
> > > > > > won't work properly.
> > > > > You can't really use cur_num_vqs. Consider this scenario:
> > > > > create vdpa device with max VQs = 16 (RQT size created with 8 entries)
> > > > > boot VM
> > > > > ethtool modify num QPs to 2. cur_num_vqs now equals 2.
> > > > > reboot VM.
> > > > Once VM is rebooted, the cur_num_vqs has to reset to 0 in the reset() op.
> > >
> > > Why reset to 0? The correct value to set here is
> > > config->max_virtqueue_pairs.
> >
> > Multiqueue is disabled by default so I think it should be 1 here. This
> > is the behavior of Qemu.
> >
> > It looks to me we need to clarify this in the spec.
> >
> > Thanks
>
> Not sure what do you want to clarify.

Ok, I see this:

Multiqueue is disabled by setting virtqueue_pairs to 1 (this is the
default) and waiting for the device to use the command buffer.

So we are fine.

Thanks

>
>
> > > This is what happens when you add the
> > > device. Setting cur_num_vqs to config->max_virtqueue_pairs will address
> > > your concerns with respect to modify_rqt. Once you reset cur_num_vqs to
> > > config->max_virtqueue_pairs your concerns with respect to changing
> > > mumber of QPs should be addressed. We could even leave create_rqt
> > > untouched or modify the code to use cur_num_vqs. It should work the
> > > same.
> > >
> > > > > create RQT with 1 entry only.
> > > > Here cur_num_vqs will be loaded with the newly negotiated value (max_rqt)
> > > > again.
> > > >
> > > > > ethtool modify num QPs to 4. modify RQT will fail since it was created
> > > > > with max QPs equals 1.
> > > > It won't fail as the cur_num_vqs will be consistent with the number of
> > > > queues newly negotiated (i.e the max_rqt in create_rqt) for modify.
> > > >
> > > > >
> > > > > I think it is ok to create the RQT always with the value configured when
> > > > > the device was created.
> > > > The problem of not setting cur_num_vqs in create_rqt (and resetting it in
> > > > mlx5_vdpa_reset) is that, once the VM is rebooted or the device is reset,
> > > > the value doesn't go with the actual number of rqt entries hence would break
> > > > various assumptions in change_num_qps() or modify_rqt(). For instances,
> > > >
> > > > create vdpa device with max data VQs = 16
> > > > boot VM
> > > > features_ok set with MQ negotiated
> > > > RQT created with 8 entries in create_rqt
> > > > ethtool modify num QPs to 2. cur_num_vqs now equals 2.
> > > > reboot VM
> > > > features_ok set with MQ negotiated
> > > > RQT created with 8 entries in create_rqt
> > > > ethtool modify num QPs to 6.
> > > > cur_num_vqs was 2 while the actual RQT size is 8 (= 16 / 2)
> > > > change_num_qps would fail as the wrong increment branch (rather than the decrement) was taken
> > > >
> > > > and this case too, which calls out the need to validate the presence of
> > > > VIRTIO_NET_F_MQ in handle_ctrl_mq()
> > > >
> > > > create vdpa device with max data VQs = 16 (RQT size created with 8 entries)
> > > > boot VM
> > > > features_ok set with MQ negotiated
> > > > RQT created with 8 entries in create_rqt
> > > > ethtool modify num QPs to 2. cur_num_vqs now equals 2.
> > > > reboot VM
> > > > features_ok set with no MQ negotiated
> > > > RQT created with 8 entries in create_rqt
> > > > ethtool modify num QPs to 6. suppose guest runs a custom kernel without checking the #channels to configure
> > > > change_num_qps can succeed and no host side check prohibiting a single queue guest to set multi-queue
> > > >
> > > > Thanks,
> > > > -Siwei
> > > > >
> > > > > > Further, we need to validate VIRTIO_NET_F_MQ is present
> > > > > > in handle_ctrl_mq() before changing the number of queue pairs.
> > > > > >
> > > > > > So just disregard my previous R-b for this patch.
> > > > > >
> > > > > > Thanks,
> > > > > > -Siwei
> > > > > >
> > > > > >
> > > > > > > >          MLX5_SET(rqtc, rqtc, rqt_actual_size, max_rqt);
> > > > > > > >        err = mlx5_vdpa_create_rqt(&ndev->mvdev, in, inlen,
> > > > > > > > &ndev->res.rqtn);
> > > > > > > > @@ -2220,7 +2221,7 @@ static int mlx5_vdpa_reset(struct vdpa_device
> > > > > > > > *vdev)
> > > > > > > >        clear_vqs_ready(ndev);
> > > > > > > >        mlx5_vdpa_destroy_mr(&ndev->mvdev);
> > > > > > > >        ndev->mvdev.status = 0;
> > > > > > > > -    memset(ndev->event_cbs, 0, sizeof(ndev->event_cbs));
> > > > > > > > +    memset(ndev->event_cbs, 0, sizeof(*ndev->event_cbs) *
> > > > > > > > (mvdev->max_vqs + 1));
> > > > > > > >        ndev->mvdev.actual_features = 0;
> > > > > > > >        ++mvdev->generation;
> > > > > > > >        if (MLX5_CAP_GEN(mvdev->mdev, umem_uid_0)) {
> > > > > > > > @@ -2293,6 +2294,8 @@ static void mlx5_vdpa_free(struct vdpa_device
> > > > > > > > *vdev)
> > > > > > > >        }
> > > > > > > >        mlx5_vdpa_free_resources(&ndev->mvdev);
> > > > > > > >        mutex_destroy(&ndev->reslock);
> > > > > > > > +    kfree(ndev->event_cbs);
> > > > > > > > +    kfree(ndev->vqs);
> > > > > > > >    }
> > > > > > > >      static struct vdpa_notification_area
> > > > > > > > mlx5_get_vq_notification(struct vdpa_device *vdev, u16 idx)
> > > > > > > > @@ -2538,15 +2541,33 @@ static int mlx5_vdpa_dev_add(struct
> > > > > > > > vdpa_mgmt_dev *v_mdev, const char *name,
> > > > > > > >            return -EOPNOTSUPP;
> > > > > > > >        }
> > > > > > > >    -    /* we save one virtqueue for control virtqueue should we
> > > > > > > > require it */
> > > > > > > >        max_vqs = MLX5_CAP_DEV_VDPA_EMULATION(mdev,
> > > > > > > > max_num_virtio_queues);
> > > > > > > > -    max_vqs = min_t(u32, max_vqs, MLX5_MAX_SUPPORTED_VQS);
> > > > > > > > +    if (max_vqs < 2) {
> > > > > > > > +        dev_warn(mdev->device,
> > > > > > > > +             "%d virtqueues are supported. At least 2 are required\n",
> > > > > > > > +             max_vqs);
> > > > > > > > +        return -EAGAIN;
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP)) {
> > > > > > > > +        if (add_config->net.max_vq_pairs > max_vqs / 2)
> > > > > > > > +            return -EINVAL;
> > > > > > > > +        max_vqs = min_t(u32, max_vqs, 2 *
> > > > > > > > add_config->net.max_vq_pairs);
> > > > > > > > +    } else {
> > > > > > > > +        max_vqs = 2;
> > > > > > > > +    }
> > > > > > > >          ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev,
> > > > > > > > mdev->device, &mlx5_vdpa_ops,
> > > > > > > >                     name, false);
> > > > > > > >        if (IS_ERR(ndev))
> > > > > > > >            return PTR_ERR(ndev);
> > > > > > > >    +    ndev->vqs = kcalloc(max_vqs, sizeof(*ndev->vqs), GFP_KERNEL);
> > > > > > > > +    ndev->event_cbs = kcalloc(max_vqs + 1,
> > > > > > > > sizeof(*ndev->event_cbs), GFP_KERNEL);
> > > > > > > > +    if (!ndev->vqs || !ndev->event_cbs) {
> > > > > > > > +        err = -ENOMEM;
> > > > > > > > +        goto err_alloc;
> > > > > > > > +    }
> > > > > > > >        ndev->mvdev.max_vqs = max_vqs;
> > > > > > > >        mvdev = &ndev->mvdev;
> > > > > > > >        mvdev->mdev = mdev;
> > > > > > > > @@ -2627,6 +2648,7 @@ static int mlx5_vdpa_dev_add(struct
> > > > > > > > vdpa_mgmt_dev *v_mdev, const char *name,
> > > > > > > >            mlx5_mpfs_del_mac(pfmdev, config->mac);
> > > > > > > >    err_mtu:
> > > > > > > >        mutex_destroy(&ndev->reslock);
> > > > > > > > +err_alloc:
> > > > > > > >        put_device(&mvdev->vdev.dev);
> > > > > > > >        return err;
> > > > > > > >    }
> > > > > > > > @@ -2669,7 +2691,8 @@ static int mlx5v_probe(struct auxiliary_device
> > > > > > > > *adev,
> > > > > > > >        mgtdev->mgtdev.ops = &mdev_ops;
> > > > > > > >        mgtdev->mgtdev.device = mdev->device;
> > > > > > > >        mgtdev->mgtdev.id_table = id_table;
> > > > > > > > -    mgtdev->mgtdev.config_attr_mask =
> > > > > > > > BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MACADDR);
> > > > > > > > +    mgtdev->mgtdev.config_attr_mask =
> > > > > > > > BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MACADDR) |
> > > > > > > > +                      BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP);
> > > > > > > >        mgtdev->madev = madev;
> > > > > > > >          err = vdpa_mgmtdev_register(&mgtdev->mgtdev);
> > > >
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
