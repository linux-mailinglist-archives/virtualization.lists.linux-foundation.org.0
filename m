Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0E4C054D
	for <lists.virtualization@lfdr.de>; Wed, 23 Feb 2022 00:22:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450C0405E6;
	Tue, 22 Feb 2022 23:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pE2lrAMSFN3K; Tue, 22 Feb 2022 23:22:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 756A240621;
	Tue, 22 Feb 2022 23:22:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1032C0073;
	Tue, 22 Feb 2022 23:22:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A513C0011
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 23:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 624A8408B0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 23:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEJuPjLX-lEz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 23:22:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ED1D40873
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 23:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645572118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U8LCl+4f18stHRWkVvOB03kwBny4qKctScgMtzCIqtE=;
 b=SnjxqR5leRr2eagsSKWmW1UEEmFSGmwUZkGI1SSvYV+cOvCKmyuV4Rq2ZEFQTryGWZV9JW
 UqPgVvfgb/s9ejZHCJO/yZCX0lEXEumJYQcEz545Q4yu6aZfRMGp2k5PKbHcfY9b+ddTBo
 zBBCJdC1111Nsk4XX0+bmutQ72YD3bs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-XEVwNeY_PIeWwi6UxuiKwA-1; Tue, 22 Feb 2022 18:21:56 -0500
X-MC-Unique: XEVwNeY_PIeWwi6UxuiKwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so168880wme.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Feb 2022 15:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U8LCl+4f18stHRWkVvOB03kwBny4qKctScgMtzCIqtE=;
 b=oqILU404uCsR5y2lQtjaWBoUR35qP7MP8dU2TtNsN1rBEwXyhrtRqWVVv7LPnY0rSN
 DRdfVrPSpEdo0YFmL6pMWX57AHsUu/YKHnBuZfVCLES4YKvlHvmDLaRrkxsaMtJmb2LM
 4/BDEeNSEfGuvZSoLvNjReb0bBVjxXHDIXeddJQgHPyueLIARo7/+6YlXPZmfN9ldVVM
 bH+EDd2/QNgRShGIyu+YeeLmnEd9XHgnyf75FYXFrKDEMr49BUfPDAWr/3OgZbhQQdZq
 LKMQsrcawJqs9EUQ/PZz0z4L1Muq+7uG3jZKU6Hc7A0yL64GawNoNGG1eHgGrrnIy1d4
 qlrw==
X-Gm-Message-State: AOAM531f7M1iew3AY/KEF7ks4F1GfXa0p34+3F4MT7h/jONonBP6duSJ
 lx7kHEvi5xucjs1gbalkrzbdD0+SZ+OSGXjD7X825ryq5uvr47jDkyibXEgMoeLSO+29TT85Y9a
 T/f3Hu5j0s6IsLf6vifLReNNZ62h0CLHp2JMhozT9wQ==
X-Received: by 2002:adf:fe0f:0:b0:1e2:f9dc:6ed with SMTP id
 n15-20020adffe0f000000b001e2f9dc06edmr21764151wrr.530.1645572115431; 
 Tue, 22 Feb 2022 15:21:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyipX7Z9ZGrp/Zw4FgzcUylaolFtgKwxn5AEPJBrtD+ITbwiwoH1NkCRuDvBGr0SRQYwfXKtQ==
X-Received: by 2002:adf:fe0f:0:b0:1e2:f9dc:6ed with SMTP id
 n15-20020adffe0f000000b001e2f9dc06edmr21764134wrr.530.1645572115110; 
 Tue, 22 Feb 2022 15:21:55 -0800 (PST)
Received: from redhat.com ([2.55.144.92])
 by smtp.gmail.com with ESMTPSA id ba14sm32686127wrb.56.2022.02.22.15.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 15:21:53 -0800 (PST)
Date: Tue, 22 Feb 2022 18:21:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] vhost: validate range size before adding to iotlb
Message-ID: <20220222181927-mutt-send-email-mst@kernel.org>
References: <20220221195303.13560-1-mail@anirudhrb.com>
 <CACGkMEvLE=kV4PxJLRjdSyKArU+MRx6b_mbLGZHSUgoAAZ+-Fg@mail.gmail.com>
 <YhRtQEWBF0kqWMsI@anirudhrb.com>
 <CACGkMEvd7ETC_ANyrOSAVz_i64xqpYYazmm=+39E51=DMRFXdw@mail.gmail.com>
 <20220222090511-mutt-send-email-mst@kernel.org>
 <YhUdDUSxuXTLltpZ@anirudhrb.com>
MIME-Version: 1.0
In-Reply-To: <YhUdDUSxuXTLltpZ@anirudhrb.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm <kvm@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com
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

On Tue, Feb 22, 2022 at 10:57:41PM +0530, Anirudh Rayabharam wrote:
> On Tue, Feb 22, 2022 at 10:02:29AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 22, 2022 at 03:11:07PM +0800, Jason Wang wrote:
> > > On Tue, Feb 22, 2022 at 12:57 PM Anirudh Rayabharam <mail@anirudhrb.com> wrote:
> > > >
> > > > On Tue, Feb 22, 2022 at 10:50:20AM +0800, Jason Wang wrote:
> > > > > On Tue, Feb 22, 2022 at 3:53 AM Anirudh Rayabharam <mail@anirudhrb.com> wrote:
> > > > > >
> > > > > > In vhost_iotlb_add_range_ctx(), validate the range size is non-zero
> > > > > > before proceeding with adding it to the iotlb.
> > > > > >
> > > > > > Range size can overflow to 0 when start is 0 and last is (2^64 - 1).
> > > > > > One instance where it can happen is when userspace sends an IOTLB
> > > > > > message with iova=size=uaddr=0 (vhost_process_iotlb_msg). So, an
> > > > > > entry with size = 0, start = 0, last = (2^64 - 1) ends up in the
> > > > > > iotlb. Next time a packet is sent, iotlb_access_ok() loops
> > > > > > indefinitely due to that erroneous entry:
> > > > > >
> > > > > >         Call Trace:
> > > > > >          <TASK>
> > > > > >          iotlb_access_ok+0x21b/0x3e0 drivers/vhost/vhost.c:1340
> > > > > >          vq_meta_prefetch+0xbc/0x280 drivers/vhost/vhost.c:1366
> > > > > >          vhost_transport_do_send_pkt+0xe0/0xfd0 drivers/vhost/vsock.c:104
> > > > > >          vhost_worker+0x23d/0x3d0 drivers/vhost/vhost.c:372
> > > > > >          kthread+0x2e9/0x3a0 kernel/kthread.c:377
> > > > > >          ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> > > > > >          </TASK>
> > > > > >
> > > > > > Reported by syzbot at:
> > > > > >         https://syzkaller.appspot.com/bug?extid=0abd373e2e50d704db87
> > > > > >
> > > > > > Reported-by: syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com
> > > > > > Tested-by: syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com
> > > > > > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > > > > > ---
> > > > > >  drivers/vhost/iotlb.c | 6 ++++--
> > > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/vhost/iotlb.c b/drivers/vhost/iotlb.c
> > > > > > index 670d56c879e5..b9de74bd2f9c 100644
> > > > > > --- a/drivers/vhost/iotlb.c
> > > > > > +++ b/drivers/vhost/iotlb.c
> > > > > > @@ -53,8 +53,10 @@ int vhost_iotlb_add_range_ctx(struct vhost_iotlb *iotlb,
> > > > > >                               void *opaque)
> > > > > >  {
> > > > > >         struct vhost_iotlb_map *map;
> > > > > > +       u64 size = last - start + 1;
> > > > > >
> > > > > > -       if (last < start)
> > > > > > +       // size can overflow to 0 when start is 0 and last is (2^64 - 1).
> > > > > > +       if (last < start || size == 0)
> > > > > >                 return -EFAULT;
> > > > >
> > > > > I'd move this check to vhost_chr_iter_write(), then for the device who
> > > > > has its own msg handler (e.g vDPA) can benefit from it as well.
> > > >
> > > > Thanks for reviewing!
> > > >
> > > > I kept the check here thinking that all devices would benefit from it
> > > > because they would need to call vhost_iotlb_add_range() to add an entry
> > > > to the iotlb. Isn't that correct?
> > > 
> > > Correct for now but not for the future, it's not guaranteed that the
> > > per device iotlb message handler will use vhost iotlb.
> > > 
> > > But I agree that we probably don't need to care about it too much now.
> > > 
> > > > Do you see any other benefit in moving
> > > > it to vhost_chr_iter_write()?
> > > >
> > > > One concern I have is that if we move it out some future caller to
> > > > vhost_iotlb_add_range() might forget to handle this case.
> > > 
> > > Yes.
> > > 
> > > Rethink the whole fix, we're basically rejecting [0, ULONG_MAX] range
> > > which seems a little bit odd.
> > 
> > Well, I guess ideally we'd split this up as two entries - this kind of
> > thing is after all one of the reasons we initially used first,last as
> > the API - as opposed to first,size.
> 
> IIUC, the APIs exposed to userspace accept first,size.

Some of them.


/* vhost vdpa IOVA range
 * @first: First address that can be mapped by vhost-vDPA
 * @last: Last address that can be mapped by vhost-vDPA
 */
struct vhost_vdpa_iova_range {
        __u64 first;
        __u64 last;
};

but

struct vhost_iotlb_msg {
        __u64 iova;
        __u64 size;
        __u64 uaddr;
#define VHOST_ACCESS_RO      0x1
#define VHOST_ACCESS_WO      0x2
#define VHOST_ACCESS_RW      0x3
        __u8 perm;
#define VHOST_IOTLB_MISS           1
#define VHOST_IOTLB_UPDATE         2
#define VHOST_IOTLB_INVALIDATE     3
#define VHOST_IOTLB_ACCESS_FAIL    4
/*
 * VHOST_IOTLB_BATCH_BEGIN and VHOST_IOTLB_BATCH_END allow modifying
 * multiple mappings in one go: beginning with
 * VHOST_IOTLB_BATCH_BEGIN, followed by any number of
 * VHOST_IOTLB_UPDATE messages, and ending with VHOST_IOTLB_BATCH_END.
 * When one of these two values is used as the message type, the rest
 * of the fields in the message are ignored. There's no guarantee that
 * these changes take place automatically in the device.
 */
#define VHOST_IOTLB_BATCH_BEGIN    5
#define VHOST_IOTLB_BATCH_END      6
        __u8 type;
};



> Which means that
> right now there is now way for userspace to map this range. So, is there
> any value in not simply rejecting this range?
> 
> > 
> > Anirudh, could you do it like this instead of rejecting?
> > 
> > 
> > > I wonder if it's better to just remove
> > > the map->size. Having a quick glance at the the user, I don't see any
> > > blocker for this.
> > > 
> > > Thanks
> > 
> > I think it's possible but won't solve the bug by itself, and we'd need
> > to review and fix all users - a high chance of introducing
> > another regression. 
> 
> Agreed, I did a quick review of the usages and getting rid of size
> didn't seem trivial.
> 
> Thanks,
> 
> 	- Anirudh.
> 
> > And I think there's value of fitting under the
> > stable rule of 100 lines with context.
> > So sure, but let's fix the bug first.
> > 
> > 
> > 
> > > >
> > > > Thanks!
> > > >
> > > >         - Anirudh.
> > > >
> > > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > >         if (iotlb->limit &&
> > > > > > @@ -69,7 +71,7 @@ int vhost_iotlb_add_range_ctx(struct vhost_iotlb *iotlb,
> > > > > >                 return -ENOMEM;
> > > > > >
> > > > > >         map->start = start;
> > > > > > -       map->size = last - start + 1;
> > > > > > +       map->size = size;
> > > > > >         map->last = last;
> > > > > >         map->addr = addr;
> > > > > >         map->perm = perm;
> > > > > > --
> > > > > > 2.35.1
> > > > > >
> > > > >
> > > >
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
