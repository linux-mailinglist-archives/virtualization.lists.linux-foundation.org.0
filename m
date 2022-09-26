Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 714205E9A43
	for <lists.virtualization@lfdr.de>; Mon, 26 Sep 2022 09:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C712826C0;
	Mon, 26 Sep 2022 07:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C712826C0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QE5NtoG2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aARhYufAoF8U; Mon, 26 Sep 2022 07:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 86BA0826C1;
	Mon, 26 Sep 2022 07:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BA0826C1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAC7FC007C;
	Mon, 26 Sep 2022 07:12:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EF10C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Sep 2022 07:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F055A40359
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Sep 2022 07:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F055A40359
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=QE5NtoG2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2wTIv4eI51N
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Sep 2022 07:12:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18C99401C9
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18C99401C9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Sep 2022 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664176328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kk40Cb91ob6P3jMCeHmGVy6FEdXDb0iktyx6LRhCi4M=;
 b=QE5NtoG2vqiepLSu+MMKjC5wpDo8cotlcwlLd78QP0XfFVUMXT7IGoJiE6fqb2Wil5t/8Z
 deGieYbgWLAnBFyblIosl8nrTRumSMkx2TfCir7csHjBir5t5AUbGgrlHfF5swdSBs7aAQ
 7ID2FyMab6pKmD7xTseAVP//lHFdeLA=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-58YOoHQwPXatW6dZVswKHQ-1; Mon, 26 Sep 2022 03:12:05 -0400
X-MC-Unique: 58YOoHQwPXatW6dZVswKHQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1278be3dc4cso2001088fac.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Sep 2022 00:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Kk40Cb91ob6P3jMCeHmGVy6FEdXDb0iktyx6LRhCi4M=;
 b=jBSFaPzy/wZEk3Qv+g6S/ycc5luGNbDPSWR4KW+h4e292GfSL41TdXHEzjpvoaLZlk
 45UxTp48ijZkn3hsJX0gPc5PYdUcjORmrmk8KwQCGiNUZ0OCiaqRRwmLmzu198YoRIHo
 8PEZtE8u2M1B33gB1/vB7kNiOXqPbGb90rpH5oEi/6xYRKekAnMwWLX94ZGTxbFj+RsF
 VRL+jTOwSuoBcLDCo9uNdMfGtMa3chFNAZ6ePtAM65VZRgvPQLMR8ISd/Wz0mSYpVx/N
 EZdq6QUr7EY5ujdAg5D1Zt+81joqiwaTtW9FkRm7C5LzXa8jqw+xIygVSGDkSbhFKoUV
 +9LQ==
X-Gm-Message-State: ACrzQf2rVMqvpXP0QZpSV+4aMQ53TlVCf32n5c50HPC+htuCxqGyC/oY
 NtfAY+kpKpUnYyN3lfoW6YLIVtoRNqwWr13J+d0PzbhOysKhrFQXj/dgEFWHcBJwZhh5R4T+bOh
 MoyEgO1YiQD+2C67Cq7BOIwaNHvyhDSwL32b/IoD5poS8UcKMqxW/otQOHQ==
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr11041285oag.280.1664176324270; 
 Mon, 26 Sep 2022 00:12:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Jh1aPfSlKDIhnP8B+svyyB4sY+Wby1jv2HNMTPvpWgii56PkLS0pySj74eksUz7kANrNmbNSqGoNQFSgvwUs=
X-Received: by 2002:a05:6870:e409:b0:127:d330:c941 with SMTP id
 n9-20020a056870e40900b00127d330c941mr11041280oag.280.1664176324060; Mon, 26
 Sep 2022 00:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220922024305.1718-1-jasowang@redhat.com>
 <20220922024305.1718-3-jasowang@redhat.com>
 <a1e98754-114e-b401-e927-5f2b71c3c641@oracle.com>
 <CACGkMEu9JfBDP4VkK76jdAnH225yUfTF+xMnqmy7_yDW3P0rKA@mail.gmail.com>
In-Reply-To: <CACGkMEu9JfBDP4VkK76jdAnH225yUfTF+xMnqmy7_yDW3P0rKA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Sep 2022 15:11:53 +0800
Message-ID: <CACGkMEt22w2rK058Bm692sb1xXsNRULcjgeCpoc6Fimn7suheA@mail.gmail.com>
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

On Mon, Sep 26, 2022 at 3:11 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Sep 24, 2022 at 4:01 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >
> >
> >
> > On 9/21/2022 7:43 PM, Jason Wang wrote:
> > > This patch implements features provisioning for vdpa_sim_net.
> > >
> > > 1) validating the provisioned features to be a subset of the parent
> > >     features.
> > > 2) clearing the features that is not wanted by the userspace
> > >
> > > For example:
> > >
> > > # vdpa mgmtdev show
> > > vdpasim_net:
> > >    supported_classes net
> > >    max_supported_vqs 3
> > >    dev_features MTU MAC CTRL_VQ CTRL_MAC_ADDR ANY_LAYOUT VERSION_1 ACCESS_PLATFORM
> > Sighs, not to blame any one and it's perhaps too late, but this
> > "dev_features" attr in "mgmtdev show" command output should have been
> > called "supported_features" in the first place.
>
> Not sure I get this, but I guess this is the negotiated features actually.
>
> I think Ling Shan is working on reporting both negotiated features
> with the device features.
>
> >
> > >
> > > 1) provision vDPA device with all features that are supported by the
> > >     net simulator
> > >
> > > # vdpa dev add name dev1 mgmtdev vdpasim_net
> > > # vdpa dev config show
> > > dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
> > >    negotiated_features MTU MAC CTRL_VQ CTRL_MAC_ADDR VERSION_1 ACCESS_PLATFORM
> > Maybe not in this patch, but for completeness for the whole series,
> > could we also add device_features to the output?
>
> Lingshan, could you please share your thoughts or patch on this?
>
> >
> > When simply look at the "vdpa dev config show" output, I cannot really
> > tell the actual device_features that was used in vdpa creation. For e.g.
> > there is a missing feature ANY_LAYOUT from negotiated_features compared
> > with supported_features in mgmtdev, but the orchestration software
> > couldn't tell if the vdpa device on destination host should be created
> > with or without the ANY_LAYOUT feature.

Btw, it might be helpful to show those features in hex as well.

>
> I think VERSION_1 implies ANY_LAYOUT. But it should be sufficient to
> use features_src & feature_dst in this case. Actually, it should work
> similar as to the cpu flags, the management software should introduce
> the concept of cluster which means the maximal set of common features
> is calculated and provisioned during device creation to allow
> migration among the nodes inside the cluster.
>
> Thanks
>
> >
> > Thanks,
> > -Siwei
> >
> >
> > >
> > > 2) provision vDPA device with a subset of the features
> > >
> > > # vdpa dev add name dev1 mgmtdev vdpasim_net device_features 0x300020000
> > > # vdpa dev config show
> > > dev1: mac 00:00:00:00:00:00 link up link_announce false mtu 1500
> > >    negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM
> > >
> > > Reviewed-by: Eli Cohen <elic@nvidia.com>
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >   drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> > > index 886449e88502..a9ba02be378b 100644
> > > --- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> > > +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> > > @@ -254,6 +254,14 @@ static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
> > >       dev_attr.work_fn = vdpasim_net_work;
> > >       dev_attr.buffer_size = PAGE_SIZE;
> > >
> > > +     if (config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
> > > +             if (config->device_features &
> > > +                 ~dev_attr.supported_features)
> > > +                     return -EINVAL;
> > > +             dev_attr.supported_features &=
> > > +                      config->device_features;
> > > +     }
> > > +
> > >       simdev = vdpasim_create(&dev_attr);
> > >       if (IS_ERR(simdev))
> > >               return PTR_ERR(simdev);
> > > @@ -294,7 +302,8 @@ static struct vdpa_mgmt_dev mgmt_dev = {
> > >       .id_table = id_table,
> > >       .ops = &vdpasim_net_mgmtdev_ops,
> > >       .config_attr_mask = (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR |
> > > -                          1 << VDPA_ATTR_DEV_NET_CFG_MTU),
> > > +                          1 << VDPA_ATTR_DEV_NET_CFG_MTU |
> > > +                          1 << VDPA_ATTR_DEV_FEATURES),
> > >       .max_supported_vqs = VDPASIM_NET_VQ_NUM,
> > >       .supported_features = VDPASIM_NET_FEATURES,
> > >   };
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
