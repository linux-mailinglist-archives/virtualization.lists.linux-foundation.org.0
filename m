Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7C643BB7
	for <lists.virtualization@lfdr.de>; Tue,  6 Dec 2022 04:15:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6646B40247;
	Tue,  6 Dec 2022 03:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6646B40247
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NyQ5yFxJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBFzHuqgodTF; Tue,  6 Dec 2022 03:15:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3A7B940204;
	Tue,  6 Dec 2022 03:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7B940204
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F9FEC007C;
	Tue,  6 Dec 2022 03:15:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D92CC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 03:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11CC060759
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 03:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11CC060759
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NyQ5yFxJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usscGbrqhvCF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 03:14:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3E3606CB
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B3E3606CB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Dec 2022 03:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670296495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ujHSDCqhn0z+3qIcTcT6jWYRuWSTPRCvQhbgDjLh76c=;
 b=NyQ5yFxJIbpIjrrZ6qDP6GSCuKCJimDXG9KkrkJJDbh/AhpWYvh5gTuZcfMw6WGcKvFjvt
 ifK7KTtPfdzCSftx6BJqlxwaAac0uHuqiORozoWghxRhM4jGVv2fO9j0aZDdCWIM7b+7j+
 bTNiCmLE7NfX4GY8PXWD0wYHTL9iQMo=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-Mp-tTAaVNxe9Yr-99UMVcw-1; Mon, 05 Dec 2022 22:14:51 -0500
X-MC-Unique: Mp-tTAaVNxe9Yr-99UMVcw-1
Received: by mail-oi1-f198.google.com with SMTP id
 s18-20020a056808209200b0035be56b3f8dso5660944oiw.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 05 Dec 2022 19:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ujHSDCqhn0z+3qIcTcT6jWYRuWSTPRCvQhbgDjLh76c=;
 b=GYaUg1ftKGbxlFnmkSu44uYqttXd6uT8yaYKCIK01Pv/sj6N6JparUAcFZmTp9GC/j
 IP4Xw2cem/TM9Ms+fZS9XfNjWquP6kxpou185PRpr2Rw8cyZZTOwwcMzN/iaTQiQxLtP
 9eirhBAbhTBM5FAgUhLqvCbQkFmqSeQc0tCGxaLe6B7mNDxmVWqBbQCiEfCgOxiBUpZ4
 sasq7oXLsChl/jNEynvvVaz5t3SA1yx6++wQjx22DchSCC/Wq/8d5WMxX0DdJttSROF0
 IsNJoQtXyp130edvV+I4fhmHlEYsmhX78uquWsVhx+Txu7b2bZQqrqBtFN8+QKucb09e
 HUSQ==
X-Gm-Message-State: ANoB5pn1ThTay6oVjKSUW8EHQDDF8IkXkRV2WOTyHdHKczXGHzEw1+aq
 pfGQiwZIqsU17UABE+dOp1XT/PZQX57eUiIaGApCC25c1fneLJuR7/bkXfglOgnm3Ygjzk8Xjt+
 gX78bGABAlye1uFdg1p/5Zrgtl93BGpw39aNBjPNvFN6jzjUP7oaDJxsRWA==
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr2532807oab.280.1670296491069; 
 Mon, 05 Dec 2022 19:14:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf70D2tosBnznEU4dKAECNMTkdDBpXMhb9HO2tDLOxsIWpZsJbsH7BCKL5GyS0MxwOfwLER0YG0/FTzJWe2y8gw=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr2532791oab.280.1670296490559; Mon, 05
 Dec 2022 19:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20221117033303.16870-1-jasowang@redhat.com>
 <84298552-08ec-fe2d-d996-d89918c7fddf@oracle.com>
 <CACGkMEtLFTrqdb=MXKovP8gZzTXzFczQSmK0PgzXQTr0Dbr5jA@mail.gmail.com>
 <74909b12-80d5-653e-cd1c-3ea6bc5dbbde@oracle.com>
 <CACGkMEs7EGUsJ8wtZsj7GEMD9vD6vJNVRUu1fcwUWVYpLUQeZA@mail.gmail.com>
 <d4a85c3b-ab0b-a900-06a9-25abdf264e97@oracle.com>
 <CACGkMEsN7H4=DqyNWrwLhd+zdfhiYohyB7GmUi8iUH73Z9KxYA@mail.gmail.com>
 <153061e3-4623-38f5-c1b6-3177fc01fcec@oracle.com>
In-Reply-To: <153061e3-4623-38f5-c1b6-3177fc01fcec@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Dec 2022 11:14:39 +0800
Message-ID: <CACGkMEsdC8hfRoCM9bbNRtAbgEPF5FdzfGSoP-OpQ4sckkOMTw@mail.gmail.com>
Subject: Re: [PATCH V2] vdpa: allow provisioning device features
To: Si-Wei Liu <si-wei.liu@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mst@redhat.com, netdev@vger.kernel.org, dsahern@kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 elic@nvidia.com
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

On Tue, Dec 6, 2022 at 9:43 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 12/4/2022 10:46 PM, Jason Wang wrote:
> > On Thu, Dec 1, 2022 at 8:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >> Sorry for getting back late due to the snag of the holidays.
> > No worries :)
> >
> >> On 11/23/2022 11:13 PM, Jason Wang wrote:
> >>> On Thu, Nov 24, 2022 at 6:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >>>>
> >>>> On 11/22/2022 7:35 PM, Jason Wang wrote:
> >>>>> On Wed, Nov 23, 2022 at 6:29 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >>>>>> On 11/16/2022 7:33 PM, Jason Wang wrote:
> >>>>>>> This patch allows device features to be provisioned via vdpa. This
> >>>>>>> will be useful for preserving migration compatibility between source
> >>>>>>> and destination:
> >>>>>>>
> >>>>>>> # vdpa dev add name dev1 mgmtdev pci/0000:02:00.0 device_features 0x300020000
> >>>>>> Miss the actual "vdpa dev config show" command below
> >>>>> Right, let me fix that.
> >>>>>
> >>>>>>> # dev1: mac 52:54:00:12:34:56 link up link_announce false mtu 65535
> >>>>>>>           negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM
> >>>>>>>
> >>>>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >>>>>>> ---
> >>>>>>> Changes since v1:
> >>>>>>> - Use uint64_t instead of __u64 for device_features
> >>>>>>> - Fix typos and tweak the manpage
> >>>>>>> - Add device_features to the help text
> >>>>>>> ---
> >>>>>>>      man/man8/vdpa-dev.8            | 15 +++++++++++++++
> >>>>>>>      vdpa/include/uapi/linux/vdpa.h |  1 +
> >>>>>>>      vdpa/vdpa.c                    | 32 +++++++++++++++++++++++++++++---
> >>>>>>>      3 files changed, 45 insertions(+), 3 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/man/man8/vdpa-dev.8 b/man/man8/vdpa-dev.8
> >>>>>>> index 9faf3838..43e5bf48 100644
> >>>>>>> --- a/man/man8/vdpa-dev.8
> >>>>>>> +++ b/man/man8/vdpa-dev.8
> >>>>>>> @@ -31,6 +31,7 @@ vdpa-dev \- vdpa device configuration
> >>>>>>>      .I NAME
> >>>>>>>      .B mgmtdev
> >>>>>>>      .I MGMTDEV
> >>>>>>> +.RI "[ device_features " DEVICE_FEATURES " ]"
> >>>>>>>      .RI "[ mac " MACADDR " ]"
> >>>>>>>      .RI "[ mtu " MTU " ]"
> >>>>>>>      .RI "[ max_vqp " MAX_VQ_PAIRS " ]"
> >>>>>>> @@ -74,6 +75,15 @@ Name of the new vdpa device to add.
> >>>>>>>      Name of the management device to use for device addition.
> >>>>>>>
> >>>>>>>      .PP
> >>>>>>> +.BI device_features " DEVICE_FEATURES"
> >>>>>>> +Specifies the virtio device features bit-mask that is provisioned for the new vdpa device.
> >>>>>>> +
> >>>>>>> +The bits can be found under include/uapi/linux/virtio*h.
> >>>>>>> +
> >>>>>>> +see macros such as VIRTIO_F_ and VIRTIO_XXX(e.g NET)_F_ for specific bit values.
> >>>>>>> +
> >>>>>>> +This is optional.
> >>>>>> Document the behavior when this attribute is missing? For e.g. inherit
> >>>>>> device features from parent device.
> >>>>> This is the current behaviour but unless we've found a way to mandate
> >>>>> it, I'd like to not mention it. Maybe add a description to say the
> >>>>> user needs to check the features after the add if features are not
> >>>>> specified.
> >>>> Well, I think at least for live migration the mgmt software should get
> >>>> to some consistent result between all vdpa parent drivers regarding
> >>>> feature inheritance.
> >>> It would be hard. Especially for the device:
> >>>
> >>> 1) ask device_features from the device, in this case, new features
> >>> could be advertised after e.g a firmware update
> >> The consistency I meant is to always inherit all device features from
> >> the parent device for whatever it is capable of,
> > This looks fragile. How about the features that are mutually
> > exclusive? E.g FEATURE_X and FEATURE_Y that are both supported by the
> > mgmt?
> Hmmm, in theory, yes, it's a bit cumbersome. Is this for future proof,
> since so far as I see the virtio spec doesn't seem to define features
> that are mutually exclusive, and the way how driver should respond to
> mutually exclusive features in feature negotiation is completely undefined?

My understanding is that if a driver accepts two mutually exclusive
features it should be a bug.

But anyhow it's an example that it is not easy to have forward
compatibility if we mandating to inherit all features from the
management device.

>
> >
> >> since that was the only
> >> reasonable behavior pre-dated the device_features attribute, even though
> >> there's no mandatory check by the vdpa core. This way it's
> >> self-descriptive and consistent for the mgmt software to infer, as users
> >> can check into dev_features at the parent mgmtdev level to know what
> >> features will be ended up with after 'vdpa dev add'. I thought even
> >> though inheritance is not mandated as part of uAPI, it should at least
> >> be mentioned as a recommended guide line (for drivers in particular),
> >> especially this is the only reasonable behavior with nowhere to check
> >> what features are ended up after add (i.e. for now we can only set but
> >> not possible to read the exact device_features at vdpa dev level, as yet).
> > I fully agree, but what I want to say is. Consider:
> >
> > 1) We've already had feature provisioning
> > 2) It would be hard or even impossible to mandate the semantic
> > (consistency) of the features inheritance.
> >
> > I'm fine with the doc, but the mgmt layer should not depend on this
> > and they should use feature provisioning instead.
> OK, if it's for future proof to not mandate feature inheritance I think
> I see the point.
>
> >
> >>> 2) or have hierarchy architecture where several layers were placed
> >>> between vDPA and the real hardware
> >> Not sure what it means but I don't get why extra layers are needed. Do
> >> you mean extra layer to validate resulting features during add? Why vdpa
> >> core is not the right place to do that?
> > Just want to go wild because we can't expect how many layers are below vDPA.
> >
> > vDPA core is the right place but the validating should be done during
> > feature provisioning since it's much more easier than trying to
> > mandating code defined behaviour like inheritance.
> OK, thanks for the clarifications.
>
> >
> >>>> This inheritance predates the exposure of device
> >>>> features, until which user can check into specific features after
> >>>> creation. Imagine the case mgmt software of live migration needs to work
> >>>> with older vdpa tool stack with no device_features exposure, how does it
> >>>> know what device features are provisioned - it can only tell it from
> >>>> dev_features shown at the parent mgmtdev level.
> >>> The behavior is totally defined by the code, it would be not safe for
> >>> the mgmt layer to depend on. Instead, the mgmt layer should use a
> >>> recent vdpa tool with feature provisioning interface to guarantee the
> >>> device_features if it wants since it has a clear semantic instead of
> >>> an implicit kernel behaviour which doesn't belong to an uAPI.
> >> That is going to be a slightly harsh requirement. If there's an existing
> >> vDPA setup already provisioned before the device_features work, there is
> >> no way for it to live migrate even if the QEMU userspace stack is made
> >> live migrate-able. It'd be the best to find some mild alternative before
> >> claiming certain setup unmigrate-able.
> > It can still work in a passive way, mgmt layer check the device
> > features and only allow the migration among the vDPA devices that have
> > the same device_feature.
> Right, that is the scenario in concern which I'd like to get support
> for, even though it's passive due to incompleteness in previous CLI
> design (lack of individual device feature provisioning). Once the tool
> is upgraded, vdpa features can be provisioned selectively on the
> destination node, matching those on the source.

This should work, but it probably requires the mgmt layer to collect
and compare features among the nodes.

>
> >   Less flexible than feature provisioning.
> >
> >>> If we can mandate the inheriting behaviour, users may be surprised at
> >>> the features in the production environment which are very hard to
> >>> debug.
> >> I'm not against an explicit uAPI to define and guard device_features
> >> inheritance, but on the other hand, wouldn't it be necessary to show the
> >> actual device_features at vdpa dev level if it's not guaranteed to be
> >> the same with that of the parent mgmtdev?
> > I think this is already been done ,or anything I miss?
> The kernel patch is not merged yet, preventing the userspace patch from
> being posted.

I may miss something, any potiner here?

> While the ideal situation is to allow query of
> device_features after adding a vdpa dev (for e.g. if not 100% inherited
> from the parent mgmtdev), followed by allowing selectively provision
> features individually.

Yes.

>
> >
> >> That is even needed before
> >> users are allowed to provision specific device_features IMO...
> >>
> >> (that is the reason why I urged Michael to merge this patch soon before
> >> 6.1 GA:
> >> https://lore.kernel.org/virtualization/1665422823-18364-1-git-send-email-si-wei.liu@oracle.com/,
> >> for which I have a pending iproute patch to expose device_features at
> >> 'vdpa dev show' output).
> > Right.
> >
> >>>> IMHO it's not about whether vdpa core can or should mandate it in a
> >>>> common place or not, it's that (the man page of) the CLI tool should set
> >>>> user's expectation upfront for consumers (for e.g. mgmt software). I.e.
> >>>> in case the parent driver doesn't follow the man page doc, it should be
> >>>> considered as an implementation bug in the individual driver rather than
> >>>> flexibility of its own.
> >>> So for the inheriting, it might be too late to do that:
> >>>
> >>> 1) no facility to mandate the inheriting and even if we had we can't
> >>> fix old kernels
> >> We don't need to fix any old kernel as all drivers there had obeyed the
> >> inheriting rule since day 1. Or is there exception you did see? If so we
> >> should treat it as a bug to fix in driver.
> > I'm not sure it's a bug consider a vDPA device have only a subset
> > feature of what mgmt has.
> For example, F_MQ requires F_CTRL_VQ, but today this validation is only
> done in individual driver. We should consider consolidating it to the
> vdpa core.

This needs some balances, the core actually tries to be devince
agnostic (though it has some net specific code).

One side effect is that it would be very hard for the core to catch up
with the spec development. With the current code, new features could
be added without the notice of the core.

> But before that happens, if such validation is missing from
> driver, we should fix those in vendor drivers first.

Yes, that's the way. (E.g virtio-net driver has such validation)

>
> >>> 2) no uAPI so there no entity to carry on the semantic
> >> Not against of introducing an explicit uAPI, but what it may end up with
> >> is only some validation in a central place, right?
> > Well, this is what has been already done right now before the feature
> > provisioning, the kernel for anyway needs to validate the illegal
> > input from userspace.
> Right. What I meant is the kernel validation in vdpa_core should be done
> anyway regardless of any new uAPI (for feature inheritance for e.g). I
> guess we are in the same page here.

Great, I think so.

Thanks

>
> Thanks,
> -Siwei
>
> >
> >> Why not do it now
> >> before adding device features provisioning to userspace. Such that it's
> >> functionality complete and correct no matter if device_features is
> >> specified or not.
> > So as discussed before, the kernel has already tried to do validation,
> > if there's any bug, we can fix that. If you meant userspace
> > validation, I'm not sure it is necessary:
> >
> > 1) kernel should do the validation
> > 2) hard to keep forward compatibility, e.g features supported by the
> > mgmt device might not be even known by the userspace.
> >
> > Thanks
> >
> >> Thanks,
> >> -Siwei
> >>
> >>> And this is one of the goals that feature provisioning tries to solve
> >>> so mgmt layer should use feature provisioning instead.
> >>>
> >>>>>> And what is the expected behavior when feature bit mask is off but the
> >>>>>> corresponding config attr (for e.g. mac, mtu, and max_vqp) is set?
> >>>>> It depends totally on the parent. And this "issue" is not introduced
> >>>>> by this feature. Parents can decide to provision MQ by itself even if
> >>>>> max_vqp is not specified.
> >>>> Sorry, maybe I wasn't clear enough. The case I referred to was that the
> >>>> parent is capable of certain feature (for e.g. _F_MQ), the associated
> >>>> config attr (for e.g. max_vqp) is already present in the CLI, but the
> >>>> device_features bit mask doesn't have the corresponding bit set (e.g.
> >>>> the _F_MQ bit). Are you saying that the failure of this apparently
> >>>> invalid/ambiguous/conflicting command can't be predicated and the
> >>>> resulting behavior is totally ruled by the parent driver?
> >>> Ok, I get you. My understanding is that the kernel should do the
> >>> validation at least, it should not trust any configuration that is
> >>> sent from the userspace. This is how it works before the device
> >>> provisioning. I think we can add some validation in the kernel.
> >>>
> >>> Thanks
> >>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>
> >>>>>> I think the previous behavior without device_features is that any config
> >>>>>> attr implies the presence of the specific corresponding feature (_F_MAC,
> >>>>>> _F_MTU, and _F_MQ). Should device_features override the other config
> >>>>>> attribute, or such combination is considered invalid thus should fail?
> >>>>> It follows the current policy, e.g if the parent doesn't support
> >>>>> _F_MQ, we can neither provision _F_MQ nor max_vqp.
> >>>>>
> >>>>> Thanks
> >>>>>
> >>>>>> Thanks,
> >>>>>> -Siwei
> >>>>>>
> >>>>>>> +
> >>>>>>>      .BI mac " MACADDR"
> >>>>>>>      - specifies the mac address for the new vdpa device.
> >>>>>>>      This is applicable only for the network type of vdpa device. This is optional.
> >>>>>>> @@ -127,6 +137,11 @@ vdpa dev add name foo mgmtdev vdpa_sim_net
> >>>>>>>      Add the vdpa device named foo on the management device vdpa_sim_net.
> >>>>>>>      .RE
> >>>>>>>      .PP
> >>>>>>> +vdpa dev add name foo mgmtdev vdpa_sim_net device_features 0x300020000
> >>>>>>> +.RS 4
> >>>>>>> +Add the vdpa device named foo on the management device vdpa_sim_net with device_features of 0x300020000
> >>>>>>> +.RE
> >>>>>>> +.PP
> >>>>>>>      vdpa dev add name foo mgmtdev vdpa_sim_net mac 00:11:22:33:44:55
> >>>>>>>      .RS 4
> >>>>>>>      Add the vdpa device named foo on the management device vdpa_sim_net with mac address of 00:11:22:33:44:55.
> >>>>>>> diff --git a/vdpa/include/uapi/linux/vdpa.h b/vdpa/include/uapi/linux/vdpa.h
> >>>>>>> index 94e4dad1..7c961991 100644
> >>>>>>> --- a/vdpa/include/uapi/linux/vdpa.h
> >>>>>>> +++ b/vdpa/include/uapi/linux/vdpa.h
> >>>>>>> @@ -51,6 +51,7 @@ enum vdpa_attr {
> >>>>>>>          VDPA_ATTR_DEV_QUEUE_INDEX,              /* u32 */
> >>>>>>>          VDPA_ATTR_DEV_VENDOR_ATTR_NAME,         /* string */
> >>>>>>>          VDPA_ATTR_DEV_VENDOR_ATTR_VALUE,        /* u64 */
> >>>>>>> +     VDPA_ATTR_DEV_FEATURES,                 /* u64 */
> >>>>>>>
> >>>>>>>          /* new attributes must be added above here */
> >>>>>>>          VDPA_ATTR_MAX,
> >>>>>>> diff --git a/vdpa/vdpa.c b/vdpa/vdpa.c
> >>>>>>> index b73e40b4..d0ce5e22 100644
> >>>>>>> --- a/vdpa/vdpa.c
> >>>>>>> +++ b/vdpa/vdpa.c
> >>>>>>> @@ -27,6 +27,7 @@
> >>>>>>>      #define VDPA_OPT_VDEV_MTU           BIT(5)
> >>>>>>>      #define VDPA_OPT_MAX_VQP            BIT(6)
> >>>>>>>      #define VDPA_OPT_QUEUE_INDEX                BIT(7)
> >>>>>>> +#define VDPA_OPT_VDEV_FEATURES               BIT(8)
> >>>>>>>
> >>>>>>>      struct vdpa_opts {
> >>>>>>>          uint64_t present; /* flags of present items */
> >>>>>>> @@ -38,6 +39,7 @@ struct vdpa_opts {
> >>>>>>>          uint16_t mtu;
> >>>>>>>          uint16_t max_vqp;
> >>>>>>>          uint32_t queue_idx;
> >>>>>>> +     uint64_t device_features;
> >>>>>>>      };
> >>>>>>>
> >>>>>>>      struct vdpa {
> >>>>>>> @@ -187,6 +189,17 @@ static int vdpa_argv_u32(struct vdpa *vdpa, int argc, char **argv,
> >>>>>>>          return get_u32(result, *argv, 10);
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +static int vdpa_argv_u64_hex(struct vdpa *vdpa, int argc, char **argv,
> >>>>>>> +                          uint64_t *result)
> >>>>>>> +{
> >>>>>>> +     if (argc <= 0 || !*argv) {
> >>>>>>> +             fprintf(stderr, "number expected\n");
> >>>>>>> +             return -EINVAL;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     return get_u64(result, *argv, 16);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>      struct vdpa_args_metadata {
> >>>>>>>          uint64_t o_flag;
> >>>>>>>          const char *err_msg;
> >>>>>>> @@ -244,6 +257,10 @@ static void vdpa_opts_put(struct nlmsghdr *nlh, struct vdpa *vdpa)
> >>>>>>>                  mnl_attr_put_u16(nlh, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, opts->max_vqp);
> >>>>>>>          if (opts->present & VDPA_OPT_QUEUE_INDEX)
> >>>>>>>                  mnl_attr_put_u32(nlh, VDPA_ATTR_DEV_QUEUE_INDEX, opts->queue_idx);
> >>>>>>> +     if (opts->present & VDPA_OPT_VDEV_FEATURES) {
> >>>>>>> +             mnl_attr_put_u64(nlh, VDPA_ATTR_DEV_FEATURES,
> >>>>>>> +                             opts->device_features);
> >>>>>>> +     }
> >>>>>>>      }
> >>>>>>>
> >>>>>>>      static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
> >>>>>>> @@ -329,6 +346,14 @@ static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
> >>>>>>>
> >>>>>>>                          NEXT_ARG_FWD();
> >>>>>>>                          o_found |= VDPA_OPT_QUEUE_INDEX;
> >>>>>>> +             } else if (!strcmp(*argv, "device_features") &&
> >>>>>>> +                        (o_optional & VDPA_OPT_VDEV_FEATURES)) {
> >>>>>>> +                     NEXT_ARG_FWD();
> >>>>>>> +                     err = vdpa_argv_u64_hex(vdpa, argc, argv,
> >>>>>>> +                                             &opts->device_features);
> >>>>>>> +                     if (err)
> >>>>>>> +                             return err;
> >>>>>>> +                     o_found |= VDPA_OPT_VDEV_FEATURES;
> >>>>>>>                  } else {
> >>>>>>>                          fprintf(stderr, "Unknown option \"%s\"\n", *argv);
> >>>>>>>                          return -EINVAL;
> >>>>>>> @@ -615,8 +640,9 @@ static int cmd_mgmtdev(struct vdpa *vdpa, int argc, char **argv)
> >>>>>>>      static void cmd_dev_help(void)
> >>>>>>>      {
> >>>>>>>          fprintf(stderr, "Usage: vdpa dev show [ DEV ]\n");
> >>>>>>> -     fprintf(stderr, "       vdpa dev add name NAME mgmtdev MANAGEMENTDEV [ mac MACADDR ] [ mtu MTU ]\n");
> >>>>>>> -     fprintf(stderr, "                                                    [ max_vqp MAX_VQ_PAIRS ]\n");
> >>>>>>> +     fprintf(stderr, "       vdpa dev add name NAME mgmtdevMANAGEMENTDEV [ device_features DEVICE_FEATURES]\n");
> >>>>>>> +     fprintf(stderr, "                                                   [ mac MACADDR ] [ mtu MTU ]\n");
> >>>>>>> +     fprintf(stderr, "                                                   [ max_vqp MAX_VQ_PAIRS ]\n");
> >>>>>>>          fprintf(stderr, "       vdpa dev del DEV\n");
> >>>>>>>          fprintf(stderr, "Usage: vdpa dev config COMMAND [ OPTIONS ]\n");
> >>>>>>>          fprintf(stderr, "Usage: vdpa dev vstats COMMAND\n");
> >>>>>>> @@ -708,7 +734,7 @@ static int cmd_dev_add(struct vdpa *vdpa, int argc, char **argv)
> >>>>>>>          err = vdpa_argv_parse_put(nlh, vdpa, argc, argv,
> >>>>>>>                                    VDPA_OPT_VDEV_MGMTDEV_HANDLE | VDPA_OPT_VDEV_NAME,
> >>>>>>>                                    VDPA_OPT_VDEV_MAC | VDPA_OPT_VDEV_MTU |
> >>>>>>> -                               VDPA_OPT_MAX_VQP);
> >>>>>>> +                               VDPA_OPT_MAX_VQP | VDPA_OPT_VDEV_FEATURES);
> >>>>>>>          if (err)
> >>>>>>>                  return err;
> >>>>>>>
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
