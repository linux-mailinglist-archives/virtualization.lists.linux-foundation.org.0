Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0CA5EB90B
	for <lists.virtualization@lfdr.de>; Tue, 27 Sep 2022 06:00:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E7A3400C6;
	Tue, 27 Sep 2022 04:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E7A3400C6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=THuuDvd+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVHmqYm_trQE; Tue, 27 Sep 2022 04:00:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E066C40112;
	Tue, 27 Sep 2022 04:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E066C40112
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21BBCC0078;
	Tue, 27 Sep 2022 04:00:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1950C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 04:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2DC781831
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 04:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2DC781831
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=THuuDvd+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIi7CYQSGffu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 04:00:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71408817FF
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71408817FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 04:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664251212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6nGfMsZA5Svgl4eGaRFbLGeh7CA7z58GbvR4o/tdcM=;
 b=THuuDvd+dWmI3G4/uFbMOvTE/iVLMZGjoGZNPsb7z+DNpMt0HHtJ3ybL7xIsF/u4dFddwX
 q8ycxxLlnJtVhoJRtu2ycdR7vIF4/gUsd+BNv5m4eC1fh2+CxRbu7pww5guN10FYYi4owi
 QlrRgGpjyGNAZYwaMrqC/lgGUrT8iA4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-C3kRVn5qPFibYB3w1YWhGA-1; Tue, 27 Sep 2022 00:00:08 -0400
X-MC-Unique: C3kRVn5qPFibYB3w1YWhGA-1
Received: by mail-oi1-f197.google.com with SMTP id
 bk6-20020a0568081a0600b0034feb47cb3eso2769556oib.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Sep 2022 21:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s6nGfMsZA5Svgl4eGaRFbLGeh7CA7z58GbvR4o/tdcM=;
 b=wiu6tvuE717fwINZUh3V16EcAt9dUiHWfgZzySWhidoQxLBhRthc7ghvylOCXvGGK+
 J+OrS4nwrXwAlv/PY5aeschtJ6GXFNVRJEzgwiwNtyD4lV71jYYCAJgT4x9sW/UV2JXr
 Gh+TXIRDMmg7cOop4pxxIAeqow3WUaOz2yxsVrnYEjLd4xawRqFfd1Z4fR5olegALD2W
 oKCk7FA+K4m/WClv7LvV+fVjtGiEhY7ZD4PlBN3ftcioFX/rIbgqh/6cOnDj3OsUqQ8E
 rMxM2yaaETphOeyLX0DBM6I6rAHM0aoFTV74sgndQHlyrDC+m5zBgK7P0gFPSRas6VRq
 CWOA==
X-Gm-Message-State: ACrzQf1CCvSV+9wuDq6AU7L8HJpFFYq0bAZhInREJ6MY9bIvBq1Apftb
 NQLVoOjzYauOJbuANl+ZkjOr7YoQKZELofpWPq9AsNpHasDLqApfe7d1AyzdOGnCcwesMcVK4t3
 bharQBjJ7+dnSmX6HCN5FjRogXMguLTSpMi1WuUpaZ6KxbmAR0zxJJD+e2Q==
X-Received: by 2002:a05:6870:73cd:b0:12a:dff3:790a with SMTP id
 a13-20020a05687073cd00b0012adff3790amr1067957oan.35.1664251208189; 
 Mon, 26 Sep 2022 21:00:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7aKLLkXhi/t+kIMI9B66B8HWqHSVCUKAMCjQdi95/qLwMx2rGI3Lfnc+5iabwGU2oyHq+rfVOztr1/UrBpF18=
X-Received: by 2002:a05:6870:73cd:b0:12a:dff3:790a with SMTP id
 a13-20020a05687073cd00b0012adff3790amr1067937oan.35.1664251207829; Mon, 26
 Sep 2022 21:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220922024305.1718-1-jasowang@redhat.com>
 <20220922024305.1718-3-jasowang@redhat.com>
 <a1e98754-114e-b401-e927-5f2b71c3c641@oracle.com>
 <CACGkMEu9JfBDP4VkK76jdAnH225yUfTF+xMnqmy7_yDW3P0rKA@mail.gmail.com>
 <afe960d3-730a-b52c-e084-40bf080b27fa@oracle.com>
In-Reply-To: <afe960d3-730a-b52c-e084-40bf080b27fa@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Sep 2022 11:59:56 +0800
Message-ID: <CACGkMEsWPbTs+D4PBHQL2hUOtGWj_6zo-669cUhYK5zK039QCQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] vdpa_sim_net: support feature provisioning
To: Si-Wei Liu <si-wei.liu@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 Yongji Xie <xieyongji@bytedance.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 eperezma <eperezma@redhat.com>, Wu Zongyong <wuzongyong@linux.alibaba.com>,
 Eli Cohen <elic@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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

On Tue, Sep 27, 2022 at 9:02 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 9/26/2022 12:11 AM, Jason Wang wrote:
>
> On Sat, Sep 24, 2022 at 4:01 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
> On 9/21/2022 7:43 PM, Jason Wang wrote:
>
> This patch implements features provisioning for vdpa_sim_net.
>
> 1) validating the provisioned features to be a subset of the parent
>     features.
> 2) clearing the features that is not wanted by the userspace
>
> For example:
>
> # vdpa mgmtdev show
> vdpasim_net:
>    supported_classes net
>    max_supported_vqs 3
>    dev_features MTU MAC CTRL_VQ CTRL_MAC_ADDR ANY_LAYOUT VERSION_1 ACCESS_PLATFORM
>
> Sighs, not to blame any one and it's perhaps too late, but this
> "dev_features" attr in "mgmtdev show" command output should have been
> called "supported_features" in the first place.
>
> Not sure I get this, but I guess this is the negotiated features actually.
>
> Actually no, that is why I said the name is a bit confusing and "supported_features" might sound better.

You're right, it's an mgmtdev show actually.

>This attribute in the parent device (mgmtdev) denotes the real device capability for what virtio features can be supported by the parent device. Any unprivileged user can check into this field to know parent device's capability without having to create a child vDPA device at all. The features that child vDPA device may support should be a subset of, or at most up to what the parent device offers. For e.g. the vdpa device dev1 you created below can expose less or equal device_features bit than 0x308820028 (MTU MAC CTRL_VQ CTRL_MAC_ADDR ANY_LAYOUT VERSION_1 ACCESS_PLATFORM), but shouldn't be no more than what the parent device can actually support.

Yes, I didn't see anything wrong with "dev_features", it aligns to the
virtio spec which means the features could be used to create a vdpa
device. But if everyone agree on the renaming, I'm fine.

>
>
> I think Ling Shan is working on reporting both negotiated features
> with the device features.
>
> Does it imply this series is connected to another work in parallel? Is it possible to add a reference in the cover letter?

I'm not sure, I remember Ling Shan did some work to not block the
config show in this commit:

commit a34bed37fc9d3da319bb75dfbf02a7d3e95e12de
Author: Zhu Lingshan <lingshan.zhu@intel.com>
Date:   Fri Jul 22 19:53:07 2022 +0800

    vDPA: !FEATURES_OK should not block querying device config space

We need some changes in the vdpa tool to show device_features
unconditionally in the "dev config show" command.

>
>
> 1) provision vDPA device with all features that are supported by the
>     net simulator
>
> # vdpa dev add name dev1 mgmtdev vdpasim_net
> # vdpa dev config show
> dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
>    negotiated_features MTU MAC CTRL_VQ CTRL_MAC_ADDR VERSION_1 ACCESS_PLATFORM
>
> Maybe not in this patch, but for completeness for the whole series,
> could we also add device_features to the output?
>
> Lingshan, could you please share your thoughts or patch on this?
>
> Noted here the device_features argument specified during vdpa creation is introduced by this series itself, it somehow slightly changed the original semantics of what device_features used to be.

I'm not sure I get this, we don't support device_features in the past
and it is used to provision device features to the vDPA device which
seems to be fine.

>
>
> When simply look at the "vdpa dev config show" output, I cannot really
> tell the actual device_features that was used in vdpa creation. For e.g.
> there is a missing feature ANY_LAYOUT from negotiated_features compared
> with supported_features in mgmtdev, but the orchestration software
> couldn't tell if the vdpa device on destination host should be created
> with or without the ANY_LAYOUT feature.
>
> I think VERSION_1 implies ANY_LAYOUT.
>
> Right, ANY_LAYOUT is a bad example. A good example might be that, I knew the parent mgmtdev on migration source node supports CTRL_MAC_ADDR, but I don't find it in negotiated_features.

I think we should use the features that we got from "mgmtdev show"
instead of "negotiated features".

>On the migration destination node, the parent device does support all features as the source offers, including CTRL_MAC_ADDR. What device features you would expect the mgmt software to create destination vdpa device with, if not otherwise requiring mgmt software to remember all the arguments on device creation?

So in this example, we need use "dev_features" so we get exact the
same features after and operation as either src or dst.

>
> SOURCE# vdpa mgmtdev show
> vdpasim_net:
>    supported_classes net
>    max_supported_vqs 3
>    dev_features MTU MAC CTRL_VQ CTRL_MAC_ADDR ANY_LAYOUT VERSION_1 ACCESS_PLATFORM
> SOURCE# vdpa dev config show
> dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
>    negotiated_features MTU MAC CTRL_VQ VERSION_1 ACCESS_PLATFORM
>
> DESTINATION# vdpa mgmtdev show
> vdpasim_net:
>    supported_classes net
>    max_supported_vqs 3
>    dev_features MTU MAC CTRL_VQ CTRL_MAC_ADDR ANY_LAYOUT VERSION_1 ACCESS_PLATFORM
>
>  But it should be sufficient to
> use features_src & feature_dst in this case. Actually, it should work
> similar as to the cpu flags, the management software should introduce
> the concept of cluster which means the maximal set of common features
> is calculated and provisioned during device creation to allow
> migration among the nodes inside the cluster.
>
> Yes, this is one way mgmt software may implement, but I am not sure if it's the only way. For e.g. for cpu flags, mgmt software can infer the guest cpus features in use from all qemu command line arguments and host cpu features/capability, which doesn't need to remember creation arguments and is easy to recover from failure without having to make the VM config persistent in data store. I thought it would be great if vdpa CLI design could offer the same.

One minor difference is that we have cpu model abstraction, so we can
have things like:

./qemu-system-x86_64 -cpu EPYC

Which implies the cpu features/flags where vDPA doesn't have. But
consider it's just a 64bit (or 128 in the future), it doesn't seems to
be too complex for the management to know, we probably need to start
from this and then we can try to introduce some generation/model after
it is agreed on most of the vendors.

Thanks

>
> Thanks,
> -Siwei
>
>
> Thanks
>
> Thanks,
> -Siwei
>
>
> 2) provision vDPA device with a subset of the features
>
> # vdpa dev add name dev1 mgmtdev vdpasim_net device_features 0x300020000
> # vdpa dev config show
> dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
>    negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM
>
> Reviewed-by: Eli Cohen <elic@nvidia.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> index 886449e88502..a9ba02be378b 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> @@ -254,6 +254,14 @@ static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
>       dev_attr.work_fn = vdpasim_net_work;
>       dev_attr.buffer_size = PAGE_SIZE;
>
> +     if (config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
> +             if (config->device_features &
> +                 ~dev_attr.supported_features)
> +                     return -EINVAL;
> +             dev_attr.supported_features &=
> +                      config->device_features;
> +     }
> +
>       simdev = vdpasim_create(&dev_attr);
>       if (IS_ERR(simdev))
>               return PTR_ERR(simdev);
> @@ -294,7 +302,8 @@ static struct vdpa_mgmt_dev mgmt_dev = {
>       .id_table = id_table,
>       .ops = &vdpasim_net_mgmtdev_ops,
>       .config_attr_mask = (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR |
> -                          1 << VDPA_ATTR_DEV_NET_CFG_MTU),
> +                          1 << VDPA_ATTR_DEV_NET_CFG_MTU |
> +                          1 << VDPA_ATTR_DEV_FEATURES),
>       .max_supported_vqs = VDPASIM_NET_VQ_NUM,
>       .supported_features = VDPASIM_NET_FEATURES,
>   };
>
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
