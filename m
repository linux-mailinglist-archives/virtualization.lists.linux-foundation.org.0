Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 00255524944
	for <lists.virtualization@lfdr.de>; Thu, 12 May 2022 11:41:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7312240185;
	Thu, 12 May 2022 09:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ztje0wL1lXYC; Thu, 12 May 2022 09:41:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F356940386;
	Thu, 12 May 2022 09:41:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46686C007E;
	Thu, 12 May 2022 09:41:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E671C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 09:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76B4141980
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 09:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3R1y6NB3fja7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 09:41:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F88F41913
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 09:41:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 855F3B826F5;
 Thu, 12 May 2022 09:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF99CC385B8;
 Thu, 12 May 2022 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652348460;
 bh=CD5h0DamBPqknP9VbE66AMHf27lNpynrXjo1ZCX89D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7fpAVJBgUT+PvW2Dv8eK3stnYW3o+NvTDn4XvSrwknLhFDF+t5OcKwyeQcme+gDC
 0mh/59RUJpJ2M2QbmaGJN2ybT+FmlsxBbjpfYmb5SsnnkZpxV8z93HloFspdwxmLHb
 ew3+jljYIwwb4ewptARJWpHi84CBcxdBXPDt5kGw=
Date: Thu, 12 May 2022 11:40:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH 1/2] vduse: Remove empty vduse_mgmtdev_release()
Message-ID: <YnzWKfsIfYOif5eA@kroah.com>
References: <20220511135523.147-1-xieyongji@bytedance.com>
 <YnvB2ZxyzGRkPwbm@kroah.com>
 <CACycT3s_-E=whAX02C0KKnr-1qx2yWdvTrRnQN=Km1L98VFThg@mail.gmail.com>
 <YnyZ6LiaQDxRSD/b@kroah.com>
 <CACycT3tibej7Hw3LtNRyDiNLLm7W5PzssENbuSGXsvK8-Cg43Q@mail.gmail.com>
 <Ynym+9BgJOyJdEkn@kroah.com>
 <CACycT3uHn0BnQO8kHY6P+EnLu1-YAVqC3koWP8AKzvcXH4hHYw@mail.gmail.com>
 <YnzMGO919dZG908/@kroah.com>
 <CACycT3uf61r0Wduw=SSMGvbMRA7XWf208Ow0Thc4N6M6nCd0nA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACycT3uf61r0Wduw=SSMGvbMRA7XWf208Ow0Thc4N6M6nCd0nA@mail.gmail.com>
Cc: virtualization <virtualization@lists.linux-foundation.org>,
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

On Thu, May 12, 2022 at 05:31:51PM +0800, Yongji Xie wrote:
> On Thu, May 12, 2022 at 4:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, May 12, 2022 at 03:51:38PM +0800, Yongji Xie wrote:
> > > On Thu, May 12, 2022 at 2:19 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, May 12, 2022 at 01:59:00PM +0800, Yongji Xie wrote:
> > > > > On Thu, May 12, 2022 at 1:23 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Thu, May 12, 2022 at 01:19:58PM +0800, Yongji Xie wrote:
> > > > > > > On Wed, May 11, 2022 at 10:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > > > >
> > > > > > > > On Wed, May 11, 2022 at 09:55:22PM +0800, Xie Yongji wrote:
> > > > > > > > > It's not recommended to provide an "empty" release function
> > > > > > > > > for the device object as Documentation/core-api/kobject.rst
> > > > > > > > > mentioned.
> > > > > > > >
> > > > > > > > "it is a bug to have an empty release function" is more like it :)
> > > > > > > >
> > > > > > >
> > > > > > > OK.
> > > > > > >
> > > > > > > > > So let's allocate the device object dynamically
> > > > > > > > > to get rid of it.
> > > > > > > >
> > > > > > > > Much better, but not quite there, see below for details.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/vdpa/vdpa_user/vduse_dev.c | 43 +++++++++++++++++-------------
> > > > > > > > >  1 file changed, 25 insertions(+), 18 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> > > > > > > > > index 160e40d03084..a8a5ebaefa10 100644
> > > > > > > > > --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> > > > > > > > > +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> > > > > > > > > @@ -1475,15 +1475,6 @@ static char *vduse_devnode(struct device *dev, umode_t *mode)
> > > > > > > > >       return kasprintf(GFP_KERNEL, "vduse/%s", dev_name(dev));
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > -static void vduse_mgmtdev_release(struct device *dev)
> > > > > > > > > -{
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > > -static struct device vduse_mgmtdev = {
> > > > > > > > > -     .init_name = "vduse",
> > > > > > > > > -     .release = vduse_mgmtdev_release,
> > > > > > > > > -};
> > > > > > > > > -
> > > > > > > > >  static struct vdpa_mgmt_dev mgmt_dev;
> > > > > > > >
> > > > > > > > Close.  This should be a pointer and the device structure within it
> > > > > > > > should control the lifecycle of that structure.  It should not be a
> > > > > > > > single static structure like this, that's very odd.
> > > > > > > >
> > > > > > >
> > > > > > > OK, I can define mgmt_dev as a pointer. But the device is defined as a
> > > > > > > parent device for structure vdpa_mgmt_dev. So I think we can't use it
> > > > > > > to control the lifecycle of the structure vdpa_mgmt_dev.
> > > > > >
> > > > > > You should be able to control the lifecycle of it, especially if it is
> > > > > > the parent device of something.  To not do that correctly is to have
> > > > > > everything messed up as you should be using the driver model properly.
> > > > > > As it is, you are not :(
> > > > > >
> > > > >
> > > > > I can control the lifecycle of it. What I mean is that I can not free
> > > > > it in the release function of the device object since it is the parent
> > > > > device of mgmt_dev. E.g., in other cases (such as ifcvf_probe()), the
> > > > > device object comes from a pci device but the structure vdpa_mgmt_dev
> > > > > is created during driver probing. The structure vdpa_mgmt_dev just
> > > > > maintains a pointer to the device object. So the structure
> > > > > vdpa_mgmt_dev and the device object have different lifecycles.
> > > >
> > > > Then something is very very wrong here.  The structure's lifespace
> > > > should only be controlled by one reference count, not multiple ones.
> > >
> > > But they are different devices (one is vdpa_mgmt_dev and another is
> > > the device I create which will be the parent of vdpa_mgmt_dev), I
> > > didn't get why we need to control their lifecycle in one reference
> > > count.
> > >
> > > > Have it be controlled by the device you create and properly register as
> > > > a child of the pci device and all should be fine.
> > > >
> > >
> > > The structure vdpa_mgmt_dev is defined as:
> > >
> > > /**
> > >  * struct vdpa_mgmt_dev - vdpa management device
> > >  * @device: Management parent device
> > >  * @ops: operations supported by management device
> > >  * @id_table: Pointer to device id table of supported ids
> > >  * @config_attr_mask: bit mask of attributes of type enum vdpa_attr that
> > >  *       management device support during dev_add callback
> > >  * @list: list entry
> > >  */
> > > struct vdpa_mgmt_dev {
> > >     struct device *device;
> > >     const struct vdpa_mgmtdev_ops *ops;
> > >     const struct virtio_device_id *id_table;
> > >     u64 config_attr_mask;
> > >     struct list_head list;
> > > };
> > >
> > > Now the device I create is passed to the struct vdpa_mgmt_dev as a
> > > parent device pointer. If we want to control the lifecycle of the
> > > structure vdpa_mgmt_dev by the device I create, some logic of the vdpa
> > > management device needs to be reworked. For example, define a device
> > > object for structure vdpa_mgmt_dev rather than just maintaining a
> > > pointer to the parent device.
> >
> > But this is a device (it says in the name), so it should have the device
> > structure embedded in it to control the lifespan of it.
> >
> 
> Currently it's not a device as Jason mentioned. So I think the
> question is whether we need to re-define it or just re-name it.

It is a device, you have a pointer to a device structure that is used by
the code!

Embed it in the structure and you should be fine.  Well, maybe, let's
see what falls out from there as it seems like the use of the driver
model is a bit messed up in this codebase.  But it's a good first step
forward in fixing things.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
