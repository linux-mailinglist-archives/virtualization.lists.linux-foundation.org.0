Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A0520BA5
	for <lists.virtualization@lfdr.de>; Tue, 10 May 2022 05:01:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9447D402E8;
	Tue, 10 May 2022 03:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAArN9RMqAns; Tue, 10 May 2022 03:01:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CBE59402EB;
	Tue, 10 May 2022 03:01:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32A5DC0081;
	Tue, 10 May 2022 03:01:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E462C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 03:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55BF460B17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 03:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5wJ46EcysTo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 03:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1101860AEB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652151676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iwvr19FZSIq5KqKdB9f/TVyL7R2GbZHhsa2AxDjC2gM=;
 b=EgNVJlbYKsamdIN5GNlsBAsNrjJji4mkgirGl2xlTupd4O/qf5hsCfhzTH24mrJ6nOli/s
 V07j6HrBPUU2BOqsPyU1QAA6ByH5vS94+O13ydNBsS3Ip9Fzy3JMM+rzVdb9tfrGrU2Sty
 a+23v9STXyQMS4qPp9dB7qeYUIm/Pss=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-lqbG0v40P6qM6gTorAhq7g-1; Mon, 09 May 2022 23:01:15 -0400
X-MC-Unique: lqbG0v40P6qM6gTorAhq7g-1
Received: by mail-lj1-f199.google.com with SMTP id
 m11-20020a2ea88b000000b0024db6246908so4694643ljq.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 May 2022 20:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iwvr19FZSIq5KqKdB9f/TVyL7R2GbZHhsa2AxDjC2gM=;
 b=KMyS1WE/+bWRN/cI+ERI8lLg8uqqRbfJUA/4YXwUZwhqeikU7m4XfMy5XN5iDxBGDO
 WAtOYml6sF76w005D+kkMGuYJGWno58Jp0e+73jECmxhXI1eIgm9cQ/jR+hDqATrQSvV
 q76sFZftkbnAK1zgNy2o0x+ho/y1HDvcD5RwFe56p4kONbqUjJ9/zoIXCBgjSyV2HWOa
 i1wTYmZ8OXDhwj/3BwWGoiWCuJQ4Wl03rBCQGAMvrUETnLh9Dzy612xj0MZf04eOLp/t
 6KPKVLimV+pFUqGAGgvIo3TPkN21y5PzC47iRBk1SKWv6WHb5P1i2JgnGM9EJwiC3sGM
 J/cw==
X-Gm-Message-State: AOAM5305Frgfs7YUp83cfqu+OZuZuV0LoghD1li8s9+PnngIdD/Nz2j+
 zO2qWSFUuKxS22ZTnLSQkuV6urxW0NvVH/vaLO4IEWBL6VLlg5TUJLUtjJlSaA5nCnjJQkswzBa
 W106XYEbwFrq4ZViaxXGtXHJ6dajjeL9jwQLFxvLwV/PU7tqQcSZQ8/ATnA==
X-Received: by 2002:a19:ca50:0:b0:471:f556:92b with SMTP id
 h16-20020a19ca50000000b00471f556092bmr14810310lfj.587.1652151673664; 
 Mon, 09 May 2022 20:01:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQSU5RXL5ew2BBNwGpp6PUwN1jLjJBGaCJBeNtaxwKnuTuMgd+oc+udc+ydns48LQwspQaWXnYhf3Zyq9FBNM=
X-Received: by 2002:a19:ca50:0:b0:471:f556:92b with SMTP id
 h16-20020a19ca50000000b00471f556092bmr14810296lfj.587.1652151673359; Mon, 09
 May 2022 20:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220508163317.204673-1-elic@nvidia.com>
 <20220508163317.204673-4-elic@nvidia.com>
In-Reply-To: <20220508163317.204673-4-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 May 2022 11:01:01 +0800
Message-ID: <CACGkMEupvw+REVOtHjPQJFEEcyhWmRBA0C-VrsixZK_+oVuOCQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] vdpa/mlx5: Add support for reading descriptor
 statistics
To: Eli Cohen <elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Si-Wei Liu <si-wei.liu@oracle.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, mst <mst@redhat.com>
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

On Mon, May 9, 2022 at 12:33 AM Eli Cohen <elic@nvidia.com> wrote:
>
> Implement the get_vq_stats calback of vdpa_config_ops to return the
> statistics for a virtqueue.
>
> The statistics are provided as vendor specific statistics where the
> driver provides a pair of attribute name and attribute value.
>
> In addition to the attribute name/attribute value pair, the driver
> returns the negotiated features and max virtqueue pairs for userspace
> can decide for a given queue index whether it is a data or control
> virtqueue.
>
> Currently supported are received descriptors and completed descriptors.
>
> Signed-off-by: Eli Cohen <elic@nvidia.com>
>
> v3 -> v4:
> Only return statistics if feature negotiation was complete
> ---
>  drivers/vdpa/mlx5/core/mlx5_vdpa.h |   2 +
>  drivers/vdpa/mlx5/net/mlx5_vnet.c  | 171 +++++++++++++++++++++++++++++
>  include/linux/mlx5/mlx5_ifc.h      |   1 +
>  include/linux/mlx5/mlx5_ifc_vdpa.h |  39 +++++++
>  4 files changed, 213 insertions(+)
>
> diff --git a/drivers/vdpa/mlx5/core/mlx5_vdpa.h b/drivers/vdpa/mlx5/core/mlx5_vdpa.h
> index daaf7b503677..44104093163b 100644
> --- a/drivers/vdpa/mlx5/core/mlx5_vdpa.h
> +++ b/drivers/vdpa/mlx5/core/mlx5_vdpa.h
> @@ -61,6 +61,8 @@ struct mlx5_control_vq {
>         struct vringh_kiov riov;
>         struct vringh_kiov wiov;
>         unsigned short head;
> +       unsigned int received_desc;
> +       unsigned int completed_desc;
>  };
>
>  struct mlx5_vdpa_wq_ent {
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 79001301b383..5b1c4304ffc7 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -119,6 +119,7 @@ struct mlx5_vdpa_virtqueue {
>         struct mlx5_vdpa_umem umem2;
>         struct mlx5_vdpa_umem umem3;
>
> +       u32 counter_set_id;
>         bool initialized;
>         int index;
>         u32 virtq_id;
> @@ -164,6 +165,8 @@ struct mlx5_vdpa_net {
>         struct notifier_block nb;
>         struct vdpa_callback config_cb;
>         struct mlx5_vdpa_wq_ent cvq_ent;
> +       /* sync access to virtqueues statistics */
> +       struct mutex numq_lock;

Can we reuse reslock?

>  };
>
>  static void free_resources(struct mlx5_vdpa_net *ndev);
> @@ -822,6 +825,12 @@ static u16 get_features_12_3(u64 features)
>                (!!(features & BIT_ULL(VIRTIO_NET_F_GUEST_CSUM)) << 6);
>  }
>
> +static bool counters_supported(const struct mlx5_vdpa_dev *mvdev)
> +{
> +       return MLX5_CAP_GEN_64(mvdev->mdev, general_obj_types) &
> +              BIT_ULL(MLX5_OBJ_TYPE_VIRTIO_Q_COUNTERS);
> +}
> +
>  static int create_virtqueue(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
>  {
>         int inlen = MLX5_ST_SZ_BYTES(create_virtio_net_q_in);
> @@ -876,6 +885,8 @@ static int create_virtqueue(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtque
>         MLX5_SET(virtio_q, vq_ctx, umem_3_id, mvq->umem3.id);
>         MLX5_SET(virtio_q, vq_ctx, umem_3_size, mvq->umem3.size);
>         MLX5_SET(virtio_q, vq_ctx, pd, ndev->mvdev.res.pdn);
> +       if (counters_supported(&ndev->mvdev))
> +               MLX5_SET(virtio_q, vq_ctx, counter_set_id, mvq->counter_set_id);
>
>         err = mlx5_cmd_exec(ndev->mvdev.mdev, in, inlen, out, sizeof(out));
>         if (err)
> @@ -1139,6 +1150,47 @@ static int modify_virtqueue(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtque
>         return err;
>  }
>
> +static int counter_set_alloc(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
> +{
> +       u32 in[MLX5_ST_SZ_DW(create_virtio_q_counters_in)] = {};
> +       u32 out[MLX5_ST_SZ_DW(create_virtio_q_counters_out)] = {};
> +       void *cmd_hdr;
> +       int err;
> +
> +       if (!counters_supported(&ndev->mvdev))
> +               return 0;
> +
> +       cmd_hdr = MLX5_ADDR_OF(create_virtio_q_counters_in, in, hdr);
> +
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, opcode, MLX5_CMD_OP_CREATE_GENERAL_OBJECT);
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, obj_type, MLX5_OBJ_TYPE_VIRTIO_Q_COUNTERS);
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, uid, ndev->mvdev.res.uid);
> +
> +       err = mlx5_cmd_exec(ndev->mvdev.mdev, in, sizeof(in), out, sizeof(out));
> +       if (err)
> +               return err;
> +
> +       mvq->counter_set_id = MLX5_GET(general_obj_out_cmd_hdr, out, obj_id);
> +
> +       return 0;
> +}
> +
> +static void counter_set_dealloc(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
> +{
> +       u32 in[MLX5_ST_SZ_DW(destroy_virtio_q_counters_in)] = {};
> +       u32 out[MLX5_ST_SZ_DW(destroy_virtio_q_counters_out)] = {};
> +
> +       if (!counters_supported(&ndev->mvdev))
> +               return;
> +
> +       MLX5_SET(destroy_virtio_q_counters_in, in, hdr.opcode, MLX5_CMD_OP_DESTROY_GENERAL_OBJECT);
> +       MLX5_SET(destroy_virtio_q_counters_in, in, hdr.obj_id, mvq->counter_set_id);
> +       MLX5_SET(destroy_virtio_q_counters_in, in, hdr.uid, ndev->mvdev.res.uid);
> +       MLX5_SET(destroy_virtio_q_counters_in, in, hdr.obj_type, MLX5_OBJ_TYPE_VIRTIO_Q_COUNTERS);
> +       if (mlx5_cmd_exec(ndev->mvdev.mdev, in, sizeof(in), out, sizeof(out)))
> +               mlx5_vdpa_warn(&ndev->mvdev, "dealloc counter set 0x%x\n", mvq->counter_set_id);
> +}
> +
>  static int setup_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
>  {
>         u16 idx = mvq->index;
> @@ -1166,6 +1218,10 @@ static int setup_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
>         if (err)
>                 goto err_connect;
>
> +       err = counter_set_alloc(ndev, mvq);
> +       if (err)
> +               goto err_counter;

Does this mean if the counter is not supported, we will fail the
entire device setup?

> +
>         err = create_virtqueue(ndev, mvq);
>         if (err)
>                 goto err_connect;
> @@ -1183,6 +1239,8 @@ static int setup_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq)
>         return 0;
>
>  err_connect:
> +       counter_set_dealloc(ndev, mvq);
> +err_counter:
>         qp_destroy(ndev, &mvq->vqqp);
>  err_vqqp:
>         qp_destroy(ndev, &mvq->fwqp);
> @@ -1227,6 +1285,7 @@ static void teardown_vq(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *
>
>         suspend_vq(ndev, mvq);
>         destroy_virtqueue(ndev, mvq);
> +       counter_set_dealloc(ndev, mvq);
>         qp_destroy(ndev, &mvq->vqqp);
>         qp_destroy(ndev, &mvq->fwqp);
>         cq_destroy(ndev, mvq->index);
> @@ -1633,8 +1692,10 @@ static virtio_net_ctrl_ack handle_ctrl_mq(struct mlx5_vdpa_dev *mvdev, u8 cmd)
>                         break;
>                 }
>
> +               mutex_lock(&ndev->numq_lock);
>                 if (!change_num_qps(mvdev, newqps))
>                         status = VIRTIO_NET_OK;
> +               mutex_unlock(&ndev->numq_lock);
>
>                 break;
>         default:
> @@ -1681,6 +1742,7 @@ static void mlx5_cvq_kick_handler(struct work_struct *work)
>                 if (read != sizeof(ctrl))
>                         break;
>
> +               cvq->received_desc++;
>                 switch (ctrl.class) {
>                 case VIRTIO_NET_CTRL_MAC:
>                         status = handle_ctrl_mac(mvdev, ctrl.cmd);
> @@ -1704,6 +1766,7 @@ static void mlx5_cvq_kick_handler(struct work_struct *work)
>                 if (vringh_need_notify_iotlb(&cvq->vring))
>                         vringh_notify(&cvq->vring);
>
> +               cvq->completed_desc++;
>                 queue_work(mvdev->wq, &wqent->work);
>                 break;
>         }
> @@ -2323,6 +2386,8 @@ static int mlx5_vdpa_reset(struct vdpa_device *vdev)
>         mlx5_vdpa_destroy_mr(&ndev->mvdev);
>         ndev->mvdev.status = 0;
>         ndev->cur_num_vqs = 0;
> +       ndev->mvdev.cvq.received_desc = 0;
> +       ndev->mvdev.cvq.completed_desc = 0;
>         memset(ndev->event_cbs, 0, sizeof(*ndev->event_cbs) * (mvdev->max_vqs + 1));
>         ndev->mvdev.actual_features = 0;
>         ++mvdev->generation;
> @@ -2401,6 +2466,7 @@ static void mlx5_vdpa_free(struct vdpa_device *vdev)
>                 mlx5_mpfs_del_mac(pfmdev, ndev->config.mac);
>         }
>         mlx5_vdpa_free_resources(&ndev->mvdev);
> +       mutex_destroy(&ndev->numq_lock);
>         mutex_destroy(&ndev->reslock);
>         kfree(ndev->event_cbs);
>         kfree(ndev->vqs);
> @@ -2442,6 +2508,108 @@ static u64 mlx5_vdpa_get_driver_features(struct vdpa_device *vdev)
>         return mvdev->actual_features;
>  }
>
> +static int counter_set_query(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq,
> +                            u64 *received_desc, u64 *completed_desc)
> +{
> +       u32 in[MLX5_ST_SZ_DW(query_virtio_q_counters_in)] = {};
> +       u32 out[MLX5_ST_SZ_DW(query_virtio_q_counters_out)] = {};
> +       void *cmd_hdr;
> +       void *ctx;
> +       int err;
> +
> +       if (!counters_supported(&ndev->mvdev))
> +               return -EOPNOTSUPP;
> +
> +       if (mvq->fw_state != MLX5_VIRTIO_NET_Q_OBJECT_STATE_RDY)
> +               return -EAGAIN;
> +
> +       cmd_hdr = MLX5_ADDR_OF(query_virtio_q_counters_in, in, hdr);
> +
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, opcode, MLX5_CMD_OP_QUERY_GENERAL_OBJECT);
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, obj_type, MLX5_OBJ_TYPE_VIRTIO_Q_COUNTERS);
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, uid, ndev->mvdev.res.uid);
> +       MLX5_SET(general_obj_in_cmd_hdr, cmd_hdr, obj_id, mvq->counter_set_id);
> +
> +       err = mlx5_cmd_exec(ndev->mvdev.mdev, in, sizeof(in), out, sizeof(out));
> +       if (err)
> +               return err;
> +
> +       ctx = MLX5_ADDR_OF(query_virtio_q_counters_out, out, counters);
> +       *received_desc = MLX5_GET64(virtio_q_counters, ctx, received_desc);
> +       *completed_desc = MLX5_GET64(virtio_q_counters, ctx, completed_desc);
> +       return 0;
> +}
> +
> +static int mlx5_vdpa_get_vendor_vq_stats(struct vdpa_device *vdev, u16 idx,
> +                                        struct sk_buff *msg,
> +                                        struct netlink_ext_ack *extack)
> +{
> +       struct mlx5_vdpa_dev *mvdev = to_mvdev(vdev);
> +       struct mlx5_vdpa_net *ndev = to_mlx5_vdpa_ndev(mvdev);
> +       struct mlx5_vdpa_virtqueue *mvq;
> +       struct mlx5_control_vq *cvq;
> +       u64 received_desc;
> +       u64 completed_desc;
> +       int err = 0;
> +       u16 max_vqp;
> +
> +       mutex_lock(&ndev->numq_lock);
> +       if (!(ndev->mvdev.status & VIRTIO_CONFIG_S_FEATURES_OK)) {
> +               NL_SET_ERR_MSG_MOD(extack, "feature negotiation not complete");
> +               err = -EAGAIN;
> +               goto out_err;
> +       }
> +
> +       if (!is_index_valid(mvdev, idx)) {
> +               NL_SET_ERR_MSG_MOD(extack, "virtqueue index is not valid");
> +               err = -EINVAL;
> +               goto out_err;
> +       }
> +
> +       if (idx == ctrl_vq_idx(mvdev)) {
> +               cvq = &mvdev->cvq;
> +               received_desc = cvq->received_desc;
> +               completed_desc = cvq->completed_desc;
> +               goto out;
> +       }
> +
> +       mvq = &ndev->vqs[idx];
> +       err = counter_set_query(ndev, mvq, &received_desc, &completed_desc);
> +       if (err) {
> +               NL_SET_ERR_MSG_MOD(extack, "failed to query hardware");
> +               goto out_err;
> +       }
> +
> +out:
> +       err = -EMSGSIZE;
> +       if (nla_put_u64_64bit(msg, VDPA_ATTR_DEV_NEGOTIATED_FEATURES,
> +                             mvdev->actual_features, VDPA_ATTR_PAD))
> +               goto out_err;

Rethink this, considering we accept vq index, it might make sense to
move this to the caller (general code).

> +
> +       max_vqp = mlx5vdpa16_to_cpu(mvdev, ndev->config.max_virtqueue_pairs);
> +       if (nla_put_u16(msg, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, max_vqp))
> +               goto out_err;

It looks to me like the userspace program doesn't use this attribute?

Thanks

> +
> +       if (nla_put_string(msg, VDPA_ATTR_DEV_VENDOR_ATTR_NAME, "received_desc"))
> +               goto out_err;
> +
> +       if (nla_put_u64_64bit(msg, VDPA_ATTR_DEV_VENDOR_ATTR_VALUE, received_desc,
> +                             VDPA_ATTR_PAD))
> +               goto out_err;
> +
> +       if (nla_put_string(msg, VDPA_ATTR_DEV_VENDOR_ATTR_NAME, "completed_desc"))
> +               goto out_err;
> +
> +       if (nla_put_u64_64bit(msg, VDPA_ATTR_DEV_VENDOR_ATTR_VALUE, completed_desc,
> +                             VDPA_ATTR_PAD))
> +               goto out_err;
> +
> +       err = 0;
> +out_err:
> +       mutex_unlock(&ndev->numq_lock);
> +       return err;
> +}
> +
>  static const struct vdpa_config_ops mlx5_vdpa_ops = {
>         .set_vq_address = mlx5_vdpa_set_vq_address,
>         .set_vq_num = mlx5_vdpa_set_vq_num,
> @@ -2451,6 +2619,7 @@ static const struct vdpa_config_ops mlx5_vdpa_ops = {
>         .get_vq_ready = mlx5_vdpa_get_vq_ready,
>         .set_vq_state = mlx5_vdpa_set_vq_state,
>         .get_vq_state = mlx5_vdpa_get_vq_state,
> +       .get_vendor_vq_stats = mlx5_vdpa_get_vendor_vq_stats,
>         .get_vq_notification = mlx5_get_vq_notification,
>         .get_vq_irq = mlx5_get_vq_irq,
>         .get_vq_align = mlx5_vdpa_get_vq_align,
> @@ -2706,6 +2875,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>
>         init_mvqs(ndev);
>         mutex_init(&ndev->reslock);
> +       mutex_init(&ndev->numq_lock);
>         config = &ndev->config;
>
>         if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MTU)) {
> @@ -2788,6 +2958,7 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>         if (!is_zero_ether_addr(config->mac))
>                 mlx5_mpfs_del_mac(pfmdev, config->mac);
>  err_mtu:
> +       mutex_destroy(&ndev->numq_lock);
>         mutex_destroy(&ndev->reslock);
>  err_alloc:
>         put_device(&mvdev->vdev.dev);
> diff --git a/include/linux/mlx5/mlx5_ifc.h b/include/linux/mlx5/mlx5_ifc.h
> index 49a48d7709ac..1d193d9b6029 100644
> --- a/include/linux/mlx5/mlx5_ifc.h
> +++ b/include/linux/mlx5/mlx5_ifc.h
> @@ -94,6 +94,7 @@ enum {
>  enum {
>         MLX5_OBJ_TYPE_GENEVE_TLV_OPT = 0x000b,
>         MLX5_OBJ_TYPE_VIRTIO_NET_Q = 0x000d,
> +       MLX5_OBJ_TYPE_VIRTIO_Q_COUNTERS = 0x001c,
>         MLX5_OBJ_TYPE_MATCH_DEFINER = 0x0018,
>         MLX5_OBJ_TYPE_MKEY = 0xff01,
>         MLX5_OBJ_TYPE_QP = 0xff02,
> diff --git a/include/linux/mlx5/mlx5_ifc_vdpa.h b/include/linux/mlx5/mlx5_ifc_vdpa.h
> index 1a9c9d94cb59..4414ed5b6ed2 100644
> --- a/include/linux/mlx5/mlx5_ifc_vdpa.h
> +++ b/include/linux/mlx5/mlx5_ifc_vdpa.h
> @@ -165,4 +165,43 @@ struct mlx5_ifc_modify_virtio_net_q_out_bits {
>         struct mlx5_ifc_general_obj_out_cmd_hdr_bits general_obj_out_cmd_hdr;
>  };
>
> +struct mlx5_ifc_virtio_q_counters_bits {
> +       u8    modify_field_select[0x40];
> +       u8    reserved_at_40[0x40];
> +       u8    received_desc[0x40];
> +       u8    completed_desc[0x40];
> +       u8    error_cqes[0x20];
> +       u8    bad_desc_errors[0x20];
> +       u8    exceed_max_chain[0x20];
> +       u8    invalid_buffer[0x20];
> +       u8    reserved_at_180[0x280];
> +};
> +
> +struct mlx5_ifc_create_virtio_q_counters_in_bits {
> +       struct mlx5_ifc_general_obj_in_cmd_hdr_bits hdr;
> +       struct mlx5_ifc_virtio_q_counters_bits virtio_q_counters;
> +};
> +
> +struct mlx5_ifc_create_virtio_q_counters_out_bits {
> +       struct mlx5_ifc_general_obj_in_cmd_hdr_bits hdr;
> +       struct mlx5_ifc_virtio_q_counters_bits virtio_q_counters;
> +};
> +
> +struct mlx5_ifc_destroy_virtio_q_counters_in_bits {
> +       struct mlx5_ifc_general_obj_in_cmd_hdr_bits hdr;
> +};
> +
> +struct mlx5_ifc_destroy_virtio_q_counters_out_bits {
> +       struct mlx5_ifc_general_obj_out_cmd_hdr_bits hdr;
> +};
> +
> +struct mlx5_ifc_query_virtio_q_counters_in_bits {
> +       struct mlx5_ifc_general_obj_in_cmd_hdr_bits hdr;
> +};
> +
> +struct mlx5_ifc_query_virtio_q_counters_out_bits {
> +       struct mlx5_ifc_general_obj_in_cmd_hdr_bits hdr;
> +       struct mlx5_ifc_virtio_q_counters_bits counters;
> +};
> +
>  #endif /* __MLX5_IFC_VDPA_H_ */
> --
> 2.35.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
