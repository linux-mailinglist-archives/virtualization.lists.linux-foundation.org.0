Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234B4DBD0B
	for <lists.virtualization@lfdr.de>; Thu, 17 Mar 2022 03:33:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFD0D40AF2;
	Thu, 17 Mar 2022 02:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6bKA8mDBIaG; Thu, 17 Mar 2022 02:33:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9DD5A40AF5;
	Thu, 17 Mar 2022 02:33:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 176F8C0033;
	Thu, 17 Mar 2022 02:33:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64B4AC000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 02:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D8C2410C5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 02:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5-eX2Hormc3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 02:33:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7B4C410B6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Mar 2022 02:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647484391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FwezJHU/UjMaLKVBEXGzX4AfNs2DL2XOlOBZWRSnAMg=;
 b=aR2qxWfakucNIVik+cneErouxEZF4Ktja7qiXoYendbwm/LQPADpoox3jRA8lqQG0O93Dp
 skfpHE6RVhdf2h1YuFkKVe4aneUbbNWnWnGOiRc7xrOhTtO3XYd5WnK9B14GnRgML5EKE5
 jLtA6pFP6N1ZGuhEyIef498BoJiyG/A=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-13H9DOsNPlmbK42RV-AlUQ-1; Wed, 16 Mar 2022 22:33:08 -0400
X-MC-Unique: 13H9DOsNPlmbK42RV-AlUQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 n9-20020a2e82c9000000b002435af2e8b9so1558267ljh.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 19:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwezJHU/UjMaLKVBEXGzX4AfNs2DL2XOlOBZWRSnAMg=;
 b=Oye29U9gXT5c2wcXbGWoyN/x3qMNDE3Carb5Q+P30qgig7RDiFwpYUOmJi62HyFCny
 BR5+mxumHDKHCkLLPEtbHz5TMjxN8ED40QSh7lvEZWafsG0MICuiqxuUcR6hbo1bcBZZ
 ObvfRjyqzkJxb0KfsI4+OE7DftIQIk2j9w8Lxd2cYxS28mjuVzytx65+gfp1RmvXkAoY
 Oo4jnIq7ITkqmasJHxdMDyYMLvmV79tx2DwttOPQB6a1wqYGOUyZ0baOfNCXKLIkGSHx
 QKAVd9GuYa/zinvkgvSiQtuUV3+j+2QdFrOIix0zZPgkzse4L3E6Z6STCplar4bIcIMD
 a9wQ==
X-Gm-Message-State: AOAM531JAGwI+2hTFruhL/EEolHxMfEaCYNMWlpu5dWxSFIEymQHQA1v
 AzwBhqUw80/vqn6Zrn2nKbX/lfIqiFGlgEKr/4Twu9trNnAkm4vmALuaBJ+CFaeyZQX8n7UmzAk
 HH8XkiMLvLCx1ONhOUBVX8wUk56UMh8MQDSUKOV9arOpAcOt07q3DGPD5sg==
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr1476026lfv.257.1647484386426; 
 Wed, 16 Mar 2022 19:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3rIAGZ8dwsocxj4jXcKqZaKruziIeMiOIdsrisMjhFez+nmWyuChA+cWkRE6qoTQEj5//Vf0AvjRQH9BhZXQ=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr1475999lfv.257.1647484386106; Wed, 16
 Mar 2022 19:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220216080022.56707-1-elic@nvidia.com>
 <20220216080022.56707-2-elic@nvidia.com>
 <22f77b5c-2003-c963-24c9-fce9cb53160d@oracle.com>
 <20220217064619.GB86497@mtl-vdi-166.wap.labs.mlnx>
 <8e834c04-47d2-1286-117d-28caa3e84606@oracle.com>
 <DM8PR12MB5400E80073521E898056578BAB089@DM8PR12MB5400.namprd12.prod.outlook.com>
 <6175d620-6be3-c249-5482-0a9448499e4a@oracle.com>
 <DM8PR12MB5400E03D7AD7833CEBF8DF9DAB099@DM8PR12MB5400.namprd12.prod.outlook.com>
 <74495f15-8f1c-93db-1277-50198ac3284e@oracle.com>
 <DM8PR12MB540086CCD1F535668D05E546AB0A9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <a30ac3c0-059d-4588-c5ac-599c060f6bbf@oracle.com>
 <DM8PR12MB54000042A48FDFA446EFE792AB0E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <61748d91-153c-ec79-c1f0-e3c44cdbea5d@oracle.com>
 <DM8PR12MB540054565515158F9209723EAB109@DM8PR12MB5400.namprd12.prod.outlook.com>
 <53dd5c21-5045-bb66-05fe-1a1157f7abe8@oracle.com>
 <DM8PR12MB5400E7B2359FE4797F190AC5AB119@DM8PR12MB5400.namprd12.prod.outlook.com>
 <7fa43ec9-202e-0cbc-22fb-0770ed023c35@oracle.com>
In-Reply-To: <7fa43ec9-202e-0cbc-22fb-0770ed023c35@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Mar 2022 10:32:54 +0800
Message-ID: <CACGkMEuvbWWiCrmuCKG7Z9OWUaFU5GT+U_yEBVg=QcWDrwOSzA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] vdpa: Add support for querying vendor statistics
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>, Eli Cohen <elic@nvidia.com>
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

On Thu, Mar 17, 2022 at 6:00 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/16/2022 12:10 AM, Eli Cohen wrote:
> >> From: Si-Wei Liu <si-wei.liu@oracle.com>
> >> Sent: Wednesday, March 16, 2022 8:52 AM
> >> To: Eli Cohen <elic@nvidia.com>
> >> Cc: mst@redhat.com; jasowang@redhat.com; virtualization@lists.linux-foundation.org; eperezma@redhat.com; amorenoz@redhat.com;
> >> lvivier@redhat.com; sgarzare@redhat.com; Parav Pandit <parav@nvidia.com>
> >> Subject: Re: [PATCH v1 1/2] vdpa: Add support for querying vendor statistics
> >>
> >>
> >>
> >> On 3/15/2022 2:10 AM, Eli Cohen wrote:
> >>
> >> <...snip...>
> >>
> >>>> Say you got a vdpa net device created with 4 data queue pairs and a
> >>>> control vq. On boot some guest firmware may support just F_CTRL_VQ but
> >>>> not F_MQ, then the index for the control vq in guest ends up with 2, as
> >>>> in this case there's only a single queue pair enabled for rx (index 0)
> >>>> and tx (index 1). From the host driver (e.g. mlx5_vdpa) perspective, the
> >>>> control vq is the last vq following 8
> >>> If the host sees F_MQ was not negotiated but F_CTRL_VQ was, then it knows
> >>> that control VQ index is 2
> >> Right, but I don't see this feature negotiation info getting returned
> >> from your vdpa_dev_vendor_stats_fill(), or did I miss something? How do
> >> you plan for host user to get this info? If you meant another "vdpa dev
> >> show" command to query negotiated features ahead, this won't get the
> >> same lock protected as the time you run the stat query. It's very easy
> >> to miss that ephemeral queue index.
> > Right, so I suggested to include the negotiated features in the netlink message
> > for the statistics. That would save us from using two system calls to get the
> > information required and it answers your concern with respect to locking.
> > I think Jason was reluctant to adding this attribute to the message but can't
> > find where he explained the reasoning.
> Maybe Jason can clarify and correct me, but I just did not get the same
> impression as what you said? I just skimmed through all of the emails in
> the thread, only finding that he didn't want device specific attribute
> such as queue type to get returned by the vdpa core, which I agree. I'm
> not sure if he's explicitly against piggyback negotiated features to aid
> userspace parsing the index.

I think we need piggyback the negotiated features, otherwise as you
mentioned, we will probably get in-consistency.

But a question for the "host queue index", as mentioned before. It's
something that is not defined in the spec, so technically, vendor can
do any mappings between it and the index what guest can see. I feel
like we need to clarify it in the spec first.

Thanks

>
> Another way around, vdpa tool may pass down -1 to get_vq_vstat() to
> represent the queue index for the control queue - but that's less
> favorable as the vdpa core needs to maintain device specific knowledge.
>
>
>
> >
> >>>> data vqs of all 4 pairs, hence got
> >>>> the 8th index in the rank. Since F_MQ is not negotiated and only 1 data
> >>>> queue pair enabled, in such event only host qindex 0,1 and 8 have vendor
> >>>> stats available, and the rest of qindex would get invalid/empty stat.
> >>>>
> >>>> Later on say boot continues towards loading the Linux virtio driver,
> >>>> then guest could successfully negotiate both F_CTRL_VQ and F_MQ
> >>>> features. In this case, all 8 data virtqueues are fully enabled, the
> >>>> index for the control vq ends up as 8, following tightly after all the 4
> >>>> data queue pairs. Only until both features are negotiated, the guest and
> >>>> host are able to see consistent view in identifying the control vq.
> >>>> Since F_MQ is negotiated, all host queues, indexed from 0 through 8,
> >>>> should have vendor stats available.
> >>>>
> >>>> That's why I said the guest qindex is ephemeral and hard to predict
> >>>> subjected to negotiated features, but host qindex is reliable and more
> >>>> eligible for command line identification purpose.
> >>>>
> >> <...snip...>
> >>>>> So what are you actually proposing? Display received and completed descriptors
> >>>>> per queue index without further interpretation?
> >>>> I'd suggest using a more stable queue id i.e. the host queue index to
> >>>> represent the qidx (which seems to be what you're doing now?), and
> >>>> displaying both the host qindex (queue_index_device in the example
> >>>> below), as well as the guest's (queue_index_driver as below) in the output:
> >>>>
> >>> Given that per vdpa device you can display statistics only after features have
> >>> been negotiated, you can always know the correct queue index for the control
> >>> VQ.
> >> The stats can be displayed only after features are negotiated, and only
> >> when the corresponding queue is enabled. If you know it from "vdpa dev
> >> show" on day 1 that the control vq and mq features are negotiated, but
> >> then on day2 you got nothing for the predicted control vq index, what
> >> would you recommend the host admin to do to get the right qindex again?
> >> Re-run the stat query on the same queue index, or check the "vdpa dev
> >> show" output again on day 3? This CLI design makes cloud administrator
> >> really challenging to follow the dynamics of guest activities were to
> >> manage hundreds or thousands of virtual machines...
> >>
> >> It would be easier, in my opinion, to grasp some well-defined handle
> >> that is easily predictable or fixed across the board, for looking up the
> >> control virtqueue. This could be a constant host queue index, or a
> >> special magic keyword like "qidx ctrlvq". If cloud admin runs vstat
> >> query on the control vq using a determined handle but get nothing back,
> >> then s/he knows *for sure* the control vq was not available for some
> >> reason at the point when the stat was being collected. S/he doesn't even
> >> need to care negotiated status via "vdpa dev show" at all. Why bother?
> > So, per my suggestion above, passing the negotiated attribute in the netlink
> > message would satisfy the requirements for atomicity, right?
> Yes, it satisfied the atomicity requirement, though not sure how you
> want to represent the queue index for control vq? Basically if cloud
> admin wants to dump control queue stats explicitly with a fixed handle
> or identifier, how that can be done with the negotiated attribute?
>
> Thanks,
> -Siwei
> >
> >>> Do you still hold see your proposal required?
> >> Yes, this is essential to any cloud admin that runs stat query on all of
> >> the queues on periodic basis. You'd get some deterministic without
> >> blindly guessing or bothering other irrelevant command.
> >>
> >>
> >> Thanks,
> >> -Siwei
> >>>> $ vdpa -jp dev vstats show vdpa-a qidx 8
> >>>> {
> >>>>        "vstats": {
> >>>>            "vdpa-a": {
> >>>>                "queue_stats": [{
> >>>>                    "queue_index_device": 8,
> >>>>                    "queue_index_driver": 2,
> >>>>                    "queue_type": "control_vq",
> >>>>                    "stat_name": [ "received_desc","completed_desc" ],
> >>>>                    "stat_value": [ 417776,417775 ],
> >>>>                }]
> >>>>            }
> >>>>        }
> >>>> }
> >>>>
> >>>> Optionally, user may use guest queue index gqidx, which is kind of an
> >>>> ephemeral ID and F_MQ negotiation depended, to query the stat on a
> >>>> specific guest queue:
> >>>>
> >>>> $ vdpa -jp dev vstats show vdpa-a gqidx 2
> >>>> {
> >>>>        "vstats": {
> >>>>            "vdpa-a": {
> >>>>                "queue_stats": [{
> >>>>                    "queue_index_device": 8,
> >>>>                    "queue_index_driver": 2,
> >>>>                    "queue_type": "control_vq",
> >>>>                    "stat_name": [ "received_desc","completed_desc" ],
> >>>>                    "stat_value": [ 417776,417775 ],
> >>>>                }]
> >>>>            }
> >>>>        }
> >>>> }
> >>>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>
> >>>>>> Thanks,
> >>>>>> -Siwei
> >>>>>>
> >>>>>>>> Regards,
> >>>>>>>> -Siwei
> >>>>>>>>
> >>>>>>>>>>>> Looks to me there are still some loose end I don't quite yet
> >>>>>>>>>>>> understand.
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>>>>                     "queue_index": 0,
> >>>>>>>>>>> I think this can be removed since the command is for a specific index.
> >>>>>>>>>>>
> >>>>>>>>>>>>>>>                     "name": "received_desc",
> >>>>>>>>>>>>>>>                     "value": 417776,
> >>>>>>>>>>>>>>>                     "name": "completed_desc",
> >>>>>>>>>>>>>>>                     "value": 417548
> >>>>>>>>>>>>>> Not for this kernel patch, but IMHO it's the best to put the name
> >>>>>>>>>>>>>> & value pairs in an array instead of flat entries in json's
> >>>>>>>>>>>>>> hash/dictionary. The hash entries can be re-ordered deliberately
> >>>>>>>>>>>>>> by external json parsing tool, ending up with inconsistent stat values.
> >>>>>>>>>>>> This comment is missed for some reason. Please change the example
> >>>>>>>>>>>> in the log if you agree to address it in vdpa tool. Or justify why
> >>>>>>>>>>>> keeping the order for json hash/dictionary is fine.
> >>>>>>>>>>> Sorry for skipping this comment.
> >>>>>>>>>>> Do you mean to present the information like:
> >>>>>>>>>>> "received_desc": 417776,
> >>>>>>>>>>> "completed_desc": 417548,
> >>>>>>>>>> I mean the following presentation:
> >>>>>>>>>>
> >>>>>>>>>> $ vdpa -jp dev vstats show vdpa-a qidx 0 {
> >>>>>>>>>>           "vstats": {
> >>>>>>>>>>               "vdpa-a": {
> >>>>>>>>>>                   "queue_stats": [{
> >>>>>>>>>>                       "queue_index": 0,
> >>>>>>>>>>                       "queue_type": "rx",
> >>>>>>>>>>                       "stat_name": [ "received_desc","completed_desc" ],
> >>>>>>>>>>                       "stat_value": [ 417776,417548 ],
> >>>>>>>>>>                   }]
> >>>>>>>>>>               }
> >>>>>>>>>>           }
> >>>>>>>>>> }
> >>>>>>>>>>
> >>>>>>>>>> I think Parav had similar suggestion, too.
> >>>>>>>>>>
> >>>>>>>>>> Thanks,
> >>>>>>>>>> -Siwei
> >>>>>>>>>>
> >>>>>>>>>>>> Thanks,
> >>>>>>>>>>>> -Siwei
> >>>>>>>>>>>>
> >>>>>>>>>>>>>> Thanks,
> >>>>>>>>>>>>>> -Siwei
> >>>>>>>>>>>>>>>                 }
> >>>>>>>>>>>>>>>             }
> >>>>>>>>>>>>>>> }
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Signed-off-by: Eli Cohen <elic@nvidia.com>
> >>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>          drivers/vdpa/vdpa.c       | 129
> >>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++
> >>>>>>>>>>>>>>>          include/linux/vdpa.h      |   5 ++
> >>>>>>>>>>>>>>>          include/uapi/linux/vdpa.h |   7 +++
> >>>>>>>>>>>>>>>          3 files changed, 141 insertions(+)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c index
> >>>>>>>>>>>>>>> 9846c9de4bfa..d0ff671baf88 100644
> >>>>>>>>>>>>>>> --- a/drivers/vdpa/vdpa.c
> >>>>>>>>>>>>>>> +++ b/drivers/vdpa/vdpa.c
> >>>>>>>>>>>>>>> @@ -909,6 +909,74 @@ vdpa_dev_config_fill(struct vdpa_device
> >>>>>>>>>>>>>>> *vdev,
> >>>>>>>>>>>> struct sk_buff *msg, u32 portid,
> >>>>>>>>>>>>>>>                 return err;
> >>>>>>>>>>>>>>>          }
> >>>>>>>>>>>>>>> +static int vdpa_fill_stats_rec(struct vdpa_device *vdev, struct
> >>>>>>>>>>>>>>> +sk_buff
> >>>>>>>>>>>> *msg,
> >>>>>>>>>>>>>>> +                              struct genl_info *info, u32 index) {
> >>>>>>>>>>>>>>> +       int err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       if (nla_put_u32(msg, VDPA_ATTR_DEV_QUEUE_INDEX, index))
> >>>>>>>>>>>>>>> +               return -EMSGSIZE;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       err = vdev->config->get_vendor_vq_stats(vdev, index, msg,
> >>>>>>>>>>>>>>> +info-
> >>>>>>>>>>>>> extack);
> >>>>>>>>>>>>>>> +       if (err)
> >>>>>>>>>>>>>>> +               return err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       return 0;
> >>>>>>>>>>>>>>> +}
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +static int vendor_stats_fill(struct vdpa_device *vdev, struct
> >>>>>>>>>>>>>>> +sk_buff
> >>>>>>>>>> *msg,
> >>>>>>>>>>>>>>> +                            struct genl_info *info, u32 index) {
> >>>>>>>>>>>>>>> +       int err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       if (!vdev->config->get_vendor_vq_stats)
> >>>>>>>>>>>>>>> +               return -EOPNOTSUPP;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       err = vdpa_fill_stats_rec(vdev, msg, info, index);
> >>>>>>>>>>>>>>> +       if (err)
> >>>>>>>>>>>>>>> +               return err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       return 0;
> >>>>>>>>>>>>>>> +}
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +static int vdpa_dev_vendor_stats_fill(struct vdpa_device *vdev,
> >>>>>>>>>>>>>>> +                                     struct sk_buff *msg,
> >>>>>>>>>>>>>>> +                                     struct genl_info *info, u32 index) {
> >>>>>>>>>>>>>>> +       u32 device_id;
> >>>>>>>>>>>>>>> +       void *hdr;
> >>>>>>>>>>>>>>> +       int err;
> >>>>>>>>>>>>>>> +       u32 portid = info->snd_portid;
> >>>>>>>>>>>>>>> +       u32 seq = info->snd_seq;
> >>>>>>>>>>>>>>> +       u32 flags = 0;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       hdr = genlmsg_put(msg, portid, seq, &vdpa_nl_family, flags,
> >>>>>>>>>>>>>>> +                         VDPA_CMD_DEV_VSTATS_GET);
> >>>>>>>>>>>>>>> +       if (!hdr)
> >>>>>>>>>>>>>>> +               return -EMSGSIZE;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       if (nla_put_string(msg, VDPA_ATTR_DEV_NAME,
> >>>>>>>> dev_name(&vdev-
> >>>>>>>>>>>>> dev))) {
> >>>>>>>>>>>>>>> +               err = -EMSGSIZE;
> >>>>>>>>>>>>>>> +               goto undo_msg;
> >>>>>>>>>>>>>>> +       }
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       device_id = vdev->config->get_device_id(vdev);
> >>>>>>>>>>>>>>> +       if (nla_put_u32(msg, VDPA_ATTR_DEV_ID, device_id)) {
> >>>>>>>>>>>>>>> +               err = -EMSGSIZE;
> >>>>>>>>>>>>>>> +               goto undo_msg;
> >>>>>>>>>>>>>>> +       }
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       err = vendor_stats_fill(vdev, msg, info, index);
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       genlmsg_end(msg, hdr);
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       return err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +undo_msg:
> >>>>>>>>>>>>>>> +       genlmsg_cancel(msg, hdr);
> >>>>>>>>>>>>>>> +       return err;
> >>>>>>>>>>>>>>> +}
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>          static int vdpa_nl_cmd_dev_config_get_doit(struct sk_buff
> >>>>>>>>>>>>>>> *skb, struct
> >>>>>>>>>>>> genl_info *info)
> >>>>>>>>>>>>>>>          {
> >>>>>>>>>>>>>>>                 struct vdpa_device *vdev;
> >>>>>>>>>>>>>>> @@ -990,6 +1058,60 @@
> >>>>>>>> vdpa_nl_cmd_dev_config_get_dumpit(struct
> >>>>>>>>>>>> sk_buff *msg, struct netlink_callback *
> >>>>>>>>>>>>>>>                 return msg->len;
> >>>>>>>>>>>>>>>          }
> >>>>>>>>>>>>>>> +static int vdpa_nl_cmd_dev_stats_get_doit(struct sk_buff *skb,
> >>>>>>>>>>>>>>> +                                         struct genl_info *info)
> >>>>>>>>>>>>>>> +{
> >>>>>>>>>>>>>>> +       struct vdpa_device *vdev;
> >>>>>>>>>>>>>>> +       struct sk_buff *msg;
> >>>>>>>>>>>>>>> +       const char *devname;
> >>>>>>>>>>>>>>> +       struct device *dev;
> >>>>>>>>>>>>>>> +       u32 index;
> >>>>>>>>>>>>>>> +       int err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       if (!info->attrs[VDPA_ATTR_DEV_NAME])
> >>>>>>>>>>>>>>> +               return -EINVAL;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       if (!info->attrs[VDPA_ATTR_DEV_QUEUE_INDEX])
> >>>>>>>>>>>>>>> +               return -EINVAL;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       devname = nla_data(info->attrs[VDPA_ATTR_DEV_NAME]);
> >>>>>>>>>>>>>>> +       msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> >>>>>>>>>>>>>>> +       if (!msg)
> >>>>>>>>>>>>>>> +               return -ENOMEM;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       index = nla_get_u32(info-
> >>>>>>>>> attrs[VDPA_ATTR_DEV_QUEUE_INDEX]);
> >>>>>>>>>>>>>>> +       mutex_lock(&vdpa_dev_mutex);
> >>>>>>>>>>>>>>> +       dev = bus_find_device(&vdpa_bus, NULL, devname,
> >>>>>>>>>>>> vdpa_name_match);
> >>>>>>>>>>>>>>> +       if (!dev) {
> >>>>>>>>>>>>>>> +               NL_SET_ERR_MSG_MOD(info->extack, "device not
> >>>>>>>> found");
> >>>>>>>>>>>>>>> +               err = -ENODEV;
> >>>>>>>>>>>>>>> +               goto dev_err;
> >>>>>>>>>>>>>>> +       }
> >>>>>>>>>>>>>>> +       vdev = container_of(dev, struct vdpa_device, dev);
> >>>>>>>>>>>>>>> +       if (!vdev->mdev) {
> >>>>>>>>>>>>>>> +               NL_SET_ERR_MSG_MOD(info->extack, "unmanaged
> >>>>>>>> vdpa
> >>>>>>>>>>>> device");
> >>>>>>>>>>>>>>> +               err = -EINVAL;
> >>>>>>>>>>>>>>> +               goto mdev_err;
> >>>>>>>>>>>>>>> +       }
> >>>>>>>>>>>>>>> +       err = vdpa_dev_vendor_stats_fill(vdev, msg, info, index);
> >>>>>>>>>>>>>>> +       if (!err)
> >>>>>>>>>>>>>>> +               err = genlmsg_reply(msg, info);
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       put_device(dev);
> >>>>>>>>>>>>>>> +       mutex_unlock(&vdpa_dev_mutex);
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       if (err)
> >>>>>>>>>>>>>>> +               nlmsg_free(msg);
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       return err;
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +mdev_err:
> >>>>>>>>>>>>>>> +       put_device(dev);
> >>>>>>>>>>>>>>> +dev_err:
> >>>>>>>>>>>>>>> +       mutex_unlock(&vdpa_dev_mutex);
> >>>>>>>>>>>>>>> +       return err;
> >>>>>>>>>>>>>>> +}
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>          static const struct nla_policy vdpa_nl_policy[VDPA_ATTR_MAX + 1]
> >>>>>>>> = {
> >>>>>>>>>>>>>>>                 [VDPA_ATTR_MGMTDEV_BUS_NAME] = { .type =
> >>>>>>>>>> NLA_NUL_STRING },
> >>>>>>>>>>>>>>>                 [VDPA_ATTR_MGMTDEV_DEV_NAME] = { .type = NLA_STRING
> >>>>>>>>>> }, @@ -
> >>>>>>>>>>>> 997,6
> >>>>>>>>>>>>>>> +1119,7 @@ static const struct nla_policy
> >>>>>>>>>>>> vdpa_nl_policy[VDPA_ATTR_MAX + 1] = {
> >>>>>>>>>>>>>>>                 [VDPA_ATTR_DEV_NET_CFG_MACADDR] =
> >>>>>>>>>> NLA_POLICY_ETH_ADDR,
> >>>>>>>>>>>>>>>                 /* virtio spec 1.1 section 5.1.4.1 for valid MTU range */
> >>>>>>>>>>>>>>>                 [VDPA_ATTR_DEV_NET_CFG_MTU] =
> >>>>>>>>>> NLA_POLICY_MIN(NLA_U16, 68),
> >>>>>>>>>>>>>>> +       [VDPA_ATTR_DEV_QUEUE_INDEX] =
> >>>>>>>> NLA_POLICY_RANGE(NLA_U32, 0,
> >>>>>>>>>>>> 65535),
> >>>>>>>>>>>>>>>          };
> >>>>>>>>>>>>>>>          static const struct genl_ops vdpa_nl_ops[] = { @@ -1030,6
> >>>>>>>>>>>>>>> +1153,12 @@ static const struct genl_ops vdpa_nl_ops[] = {
> >>>>>>>>>>>>>>>                         .doit = vdpa_nl_cmd_dev_config_get_doit,
> >>>>>>>>>>>>>>>                         .dumpit = vdpa_nl_cmd_dev_config_get_dumpit,
> >>>>>>>>>>>>>>>                 },
> >>>>>>>>>>>>>>> +       {
> >>>>>>>>>>>>>>> +               .cmd = VDPA_CMD_DEV_VSTATS_GET,
> >>>>>>>>>>>>>>> +               .validate = GENL_DONT_VALIDATE_STRICT |
> >>>>>>>>>>>> GENL_DONT_VALIDATE_DUMP,
> >>>>>>>>>>>>>>> +               .doit = vdpa_nl_cmd_dev_stats_get_doit,
> >>>>>>>>>>>>>>> +               .flags = GENL_ADMIN_PERM,
> >>>>>>>>>>>>>>> +       },
> >>>>>>>>>>>>>>>          };
> >>>>>>>>>>>>>>>          static struct genl_family vdpa_nl_family __ro_after_init =
> >>>>>>>>>>>>>>> { diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h index
> >>>>>>>>>>>>>>> 2de442ececae..274203845cfc 100644
> >>>>>>>>>>>>>>> --- a/include/linux/vdpa.h
> >>>>>>>>>>>>>>> +++ b/include/linux/vdpa.h
> >>>>>>>>>>>>>>> @@ -275,6 +275,9 @@ struct vdpa_config_ops {
> >>>>>>>>>>>>>>>                                     const struct vdpa_vq_state *state);
> >>>>>>>>>>>>>>>                 int (*get_vq_state)(struct vdpa_device *vdev, u16 idx,
> >>>>>>>>>>>>>>>                                     struct vdpa_vq_state *state);
> >>>>>>>>>>>>>>> +       int (*get_vendor_vq_stats)(struct vdpa_device *vdev, u16 idx,
> >>>>>>>>>>>>>>> +                                  struct sk_buff *msg,
> >>>>>>>>>>>>>>> +                                  struct netlink_ext_ack *extack);
> >>>>>>>>>>>>>>>                 struct vdpa_notification_area
> >>>>>>>>>>>>>>>                 (*get_vq_notification)(struct vdpa_device *vdev, u16 idx);
> >>>>>>>>>>>>>>>                 /* vq irq is not expected to be changed once DRIVER_OK is
> >>>>>>>>>>>>>>> set */ @@ -466,4 +469,6 @@ struct vdpa_mgmt_dev {
> >>>>>>>>>>>>>>>          int vdpa_mgmtdev_register(struct vdpa_mgmt_dev *mdev);
> >>>>>>>>>>>>>>>          void vdpa_mgmtdev_unregister(struct vdpa_mgmt_dev *mdev);
> >>>>>>>>>>>>>>> +#define VDPA_INVAL_QUEUE_INDEX 0xffff
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>          #endif /* _LINUX_VDPA_H */
> >>>>>>>>>>>>>>> diff --git a/include/uapi/linux/vdpa.h
> >>>>>>>>>>>>>>> b/include/uapi/linux/vdpa.h index 1061d8d2d09d..c5f229a41dc2
> >>>>>>>>>>>>>>> 100644
> >>>>>>>>>>>>>>> --- a/include/uapi/linux/vdpa.h
> >>>>>>>>>>>>>>> +++ b/include/uapi/linux/vdpa.h
> >>>>>>>>>>>>>>> @@ -18,6 +18,7 @@ enum vdpa_command {
> >>>>>>>>>>>>>>>                 VDPA_CMD_DEV_DEL,
> >>>>>>>>>>>>>>>                 VDPA_CMD_DEV_GET,               /* can dump */
> >>>>>>>>>>>>>>>                 VDPA_CMD_DEV_CONFIG_GET,        /* can dump */
> >>>>>>>>>>>>>>> +       VDPA_CMD_DEV_VSTATS_GET,
> >>>>>>>>>>>>>>>          };
> >>>>>>>>>>>>>>>          enum vdpa_attr {
> >>>>>>>>>>>>>>> @@ -46,6 +47,12 @@ enum vdpa_attr {
> >>>>>>>>>>>>>>>                 VDPA_ATTR_DEV_NEGOTIATED_FEATURES,      /* u64 */
> >>>>>>>>>>>>>>>                 VDPA_ATTR_DEV_MGMTDEV_MAX_VQS,          /*
> >>>>>>>>>> u32 */
> >>>>>>>>>>>>>>>                 VDPA_ATTR_DEV_SUPPORTED_FEATURES,       /* u64 */
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>> +       VDPA_ATTR_DEV_QUEUE_INDEX,              /* u16 */
> >>>>>>>>>>>>>>> +       VDPA_ATTR_DEV_QUEUE_TYPE,               /* string */
> >>>>>>>>>>>>>>> +       VDPA_ATTR_DEV_VENDOR_ATTR_NAME,         /*
> >>>>>>>> string */
> >>>>>>>>>>>>>>> +       VDPA_ATTR_DEV_VENDOR_ATTR_VALUE,        /* u64 */
> >>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>                 /* new attributes must be added above here */
> >>>>>>>>>>>>>>>                 VDPA_ATTR_MAX,
> >>>>>>>>>>>>>>>          };
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
